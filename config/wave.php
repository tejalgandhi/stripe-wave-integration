<?php

return [

	'profile_fields' => [
		'about'
	],

	'api' => [
		'auth_token_expires' 	=> 60,
		'key_token_expires'		=> 1,
	],

	'auth' => [
		'min_password_length' => 5,
	],

	'user_model' => App\User::class,
	'show_docs' => env('WAVE_DOCS', true),
    'demo' => env('WAVE_DEMO', false),
    'dev_bar' => env('WAVE_BAR', false),

//    'paddle' => [
//        'vendor' => env('PADDLE_VENDOR_ID', '5062'),
////        'auth_code' => env('PADDLE_VENDOR_AUTH_CODE', '6792bacd22cd963897287cf45e6248b321d7c0a8d977127bff'),
//        'auth_code' => env('PADDLE_VENDOR_AUTH_CODE', '2c917ba2a47e2c64a335620988e2e0da3d224e668e6211f02a'),
//        'env' => env('PADDLE_ENV', 'sandbox')
//    ]
    'stripe' => [
        'secret' => env('STRIPE_SECRET'),
        'key' => env('STRIPE_KEY'),
    ]
];
