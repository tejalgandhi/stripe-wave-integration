<?php

namespace Wave\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Stripe\Stripe;
use Wave\PaddleSubscription;
use Wave\Plan;

class HomeController extends \App\Http\Controllers\Controller
{

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    	if(setting('auth.dashboard_redirect', true) != "null"){
    		if(!\Auth::guest()){
    			return redirect('dashboard');
    		}
    	}

        $seo = [

            'title'         => setting('site.title', 'Laravel Wave'),
            'description'   => setting('site.description', 'Software as a Service Starter Kit'),
            'image'         => url('/og_image.png'),
            'type'          => 'website'

        ];

        return view('theme::home', compact('seo'));
    }


    public function getPaddlePayLink(Request $request){
//        $plan =$request->product;
//        $vendor_id = config("wave.paddle.vendor");
//        $vendor_auth_code = config("wave.paddle.auth_code");
//        $product_id = $plan;
//        $recurring_price = 'USD:150.00';
//        $price = 'USD:5150';
//
//        $ch = curl_init();
//
//        curl_setopt($ch, CURLOPT_URL, 'https://sandbox-vendors.paddle.com/api/2.0/product/generate_pay_link');
//        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//        curl_setopt($ch, CURLOPT_POST, 1);
//        curl_setopt($ch, CURLOPT_POSTFIELDS, "vendor_id=".$vendor_id."&vendor_auth_code=".$vendor_auth_code."&product_id=".$product_id."&prices[0]=".$price."&recurring_prices[0]=".$recurring_price."&return_url=http://wave.test");
//
//        $headers = array();
//        $headers[] = 'Cache-Control: no-cache';
//        $headers[] = 'Content-Type: application/x-www-form-urlencoded';
//        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
//
//        $result = curl_exec($ch);
//        if (curl_errno($ch)) {
//            echo 'Error:' . curl_error($ch);
//        }
//        curl_close($ch);
//        return json_decode($result, true);
        $stripe = new \Stripe\StripeClient('sk_test_51KbMrTSJ9HYIDQ6ABKxYpISmgL0Rv4jVWYex1Qmz9avSnyjEI8nb1DfYQXC3OGTMujrmB8RUz0CZZKglVvPsqvqE00r81ucgc1');

        $stripe->paymentLinks->create(
            [
                'line_items' => [['price' => 'prod_LHy8RLFRStCqJY', 'quantity' => 1]],
                'after_completion' => [
                    'type' => 'redirect',
                    'redirect' => ['url' => 'https://example.com'],
                ],
            ]
        );
        dd($stripe);
    }

    public function createCheckoutSession(Request $request)
    {
        $product =$request->product;
        \Stripe\Stripe::setApiKey(config("wave.stripe.secret") );
        $stripe = new \Stripe\StripeClient('sk_test_51KbMrTSJ9HYIDQ6ABKxYpISmgL0Rv4jVWYex1Qmz9avSnyjEI8nb1DfYQXC3OGTMujrmB8RUz0CZZKglVvPsqvqE00r81ucgc1');

        $prices = $stripe->prices->all([
            'product'=>$product,
        ]);
        $prices_array = [];
        if(!empty($prices)){
            foreach ($prices as $k=>$price){
                $prices_array[$k]['price']=$price->id;
                $prices_array[$k]['quantity']=1;
            }
        }

        $checkout_session = \Stripe\Checkout\Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [
                $prices_array
             ],

            'mode' => 'subscription',
            'success_url' =>env('APP_URL').'/success?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' =>route("cancel"),
        ]);
//        header("Location: " . $checkout_session->url);
        return response()->json(['url' => $checkout_session->url]);
// 303 redirect to $session->url
    }

    public function success(Request $request){
        \Stripe\Stripe::setApiKey(config("wave.stripe.secret") );
        $session = \Stripe\Checkout\Session::retrieve($request->get('session_id'));
        $guest = (auth()->guest()) ? 1 : 0;

        if(!empty($session)) {
            $customer = \Stripe\Customer::retrieve($session->customer);
            $subscription = \Stripe\Subscription::retrieve($session->subscription);
            if (!empty($customer) && !empty($subscription)) {
                if (auth()->guest()) {

                    if (User::where('email', $customer->email)->exists()) {
                        $user = User::where('email', $customer->email)->first();
                    } else {
                        // create a new user
                        $registration = new \Wave\Http\Controllers\Auth\RegisterController;

                        $user_data = [
                            'name' => $customer->name,
                            'email' => $customer->email,
                            'password' => Hash::make('12345678')
                        ];

                        $user = $registration->create($user_data);

                    }
                    Auth::login($user);

                } else {
                    $user = auth()->user();
                }
                $plan = Plan::where('plan_id', $subscription->plan->product)->first();

                // add associated role to user
                $user->role_id = $plan->role_id;
                $user->save();

                $subscription = PaddleSubscription::create([
                    'subscription_id' =>  $subscription->id,
                    'plan_id' =>  $subscription->plan->id,
                    'user_id' => $user->id,
                    'status' => 'active', // https://paddle.com/docs/subscription-status-reference/
                    'next_bill_data' => \Carbon\Carbon::now()->addMonths(1)->toDateTimeString(),
                    'cancel_url' => $session->cancel_url,
                    'update_url' => $session->update_url
                ]);
                $message = 'Success';
                $status = 1;
            } else {

                $message = 'Error locating that subscription product id. Please contact us if you think this is incorrect.';

            }

        } else {
            $message = 'error';
        }

        return redirect()->route('wave.home');


    }

    public function paymentSuccess(Request $request){
        Log::info('payment');
        Log::info($request->all());
        dd('ddd');
    }

//    public function charge(Request $request){
//        try {
//            \Stripe\Stripe::setApiKey(config("wave.stripe.secret") );
//            $prices = \Stripe\Price::all([
//                // retrieve lookup_key from form data POST body
//                'lookup_keys' => [$_POST['lookup_key']],
//                'expand' => ['data.product']
//            ]);
//            dd($prices->data);
//
//
//            $checkout_session = \Stripe\Checkout\Session::create([
//                'line_items' => [[
//                    'price' => $prices->data[0]->id,
//                    'quantity' => 1,
//                ]],
//                'mode' => 'subscription',
////                'success_url' => $YOUR_DOMAIN . '/success.html?session_id={CHECKOUT_SESSION_ID}',
////                'cancel_url' => $YOUR_DOMAIN . '/cancel.html',
//            ]);
//
//            header("HTTP/1.1 303 See Other");
//            header("Location: " . $checkout_session->url);
//        } catch (Error $e) {
//            http_response_code(500);
//            echo json_encode(['error' => $e->getMessage()]);
//        }
//    }

}
