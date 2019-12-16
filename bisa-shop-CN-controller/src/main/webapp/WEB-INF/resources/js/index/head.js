$(document).ready(function() {
    /*返回顶部*/
    $(window).scroll(function() {
        if ($(window).scrollTop() > 100) {
            $(".bar-totop").fadeIn(1500);
        } else {
            $(".bar-totop").fadeOut(1500);
        }
    });

    $(".bar-totop").click(function() {
        if ($('html').scrollTop()) {
            $('html').animate({
                scrollTop: 0
            }, 1000);
            return false;
        }
        $('body').animate({
            scrollTop: 0
        }, 1000);
        return false;
    });
    
});