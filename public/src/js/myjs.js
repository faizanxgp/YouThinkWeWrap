$(document).ready(function () {

        $('.previews a').on('click', function() {
            //this.preventDefault();

            var largeImage = $(this).attr('data-full');

            $('.selected').removeClass();
            $(this).addClass('selected');
            $('.full img').hide();
            $('.full img').attr('src', largeImage);
            $('.full img').fadeIn();
        });

        // $('.full img').on('click', function(){
        //     var modalImage = $(this).attr('src');
        //     $.fancybox.open(modalImage);
        // });







    $(".testimonial").mouseover(function () {
        $(".blue-stars").css({"display": "block"});
    });
});
$(document).ready(function () {
    $(".testimonial").mouseout(function () {
        $(".blue-stars").css({"display": "none"});
    });
});
$(document).ready(function () {
    $(".testimonial1").mouseover(function () {
        $(".blue-stars1").css({"display": "block"});
    });
});
$(document).ready(function () {
    $(".testimonial1").mouseout(function () {
        $(".blue-stars1").css({"display": "none"});
    });
});
$(document).ready(function () {
    $(".testimonial2").mouseover(function () {
        $(".blue-stars2").css({"display": "block"});
    });
});
$(document).ready(function () {
    $(".testimonial2").mouseout(function () {
        $(".blue-stars2").css({"display": "none"});
    });
});
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
function myFunction1() {
    var x = document.getElementById("topnav1");
    if (x.className === "nav1") {
        x.className += " responsive";
    } else {
        x.className = "nav1";
    }
}