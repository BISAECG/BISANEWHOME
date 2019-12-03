$(document).ready(function () {


    //根据选择的数量计算总价，并显示出来
    $(function () {
        //加号
        var num = parseInt($('#goods_count').val());
        //当购物车数量增加的时候
        $('.add').click(function(){
            num++;
            $('#goods_count').val(num);
        });
        //当购物车数量减少的时候
        $('.minus').click(function () {
            if(num>1){
                num--;
                $('#goods_count').val(num);
            }
        });
    });




})