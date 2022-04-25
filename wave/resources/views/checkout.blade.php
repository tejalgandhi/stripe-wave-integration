<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script>
    var ajax_url = '{{route('create-checkout-session')}}'


    let checkoutBtns = document.getElementsByClassName("checkout");
    for( var i=0; i < checkoutBtns.length; i++ ){
        checkoutBtns[i].addEventListener('click', function(){
            checkout(this.dataset.plan)
            // waveCheckout(this.dataset.plan)
        }, false);
    }

    function checkout(plan_id) {
        let product = plan_id;
        $.ajax({
            type: "GET",
            url: ajax_url,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data:{
                 product:product
            },
            success: function (data, textStatus, xhr) {
                window.location.href= data.url


            }
            , error: function (error) {
            }
        });

    }



</script>
