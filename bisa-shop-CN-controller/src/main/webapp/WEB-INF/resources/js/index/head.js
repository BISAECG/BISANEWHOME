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
    // 侧边栏改变图片
    function barSort(){
        $("#bar-sort1").hover(function () {
            $("#bar-sort1").attr("src","../resources/img/index/Sidebar1-hover.png");
        },function () {
            $("#bar-sort1").attr("src","../resources/img/index/Sidebar1.png");
        })
        $("#bar-sort2").hover(function () {
            $("#bar-sort2").attr("src","../resources/img/index/Sidebar2-hover.png");
        },function () {
            $("#bar-sort2").attr("src","../resources/img/index/Sidebar2.png");
        })
        $("#bar-sort4").hover(function () {
            $("#bar-sort4").attr("src","../resources/img/index/Sidebar4-hover.png");
        },function () {
            $("#bar-sort4").attr("src","../resources/img/index/Sidebar4.png");
        })
    }
    barSort();
});