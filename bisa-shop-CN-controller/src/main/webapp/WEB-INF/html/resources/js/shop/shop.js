$(document).ready(function () {


    //根据选择的数量计算总价，并显示出来
    $(function () {
        //加号
        var price1 = 1280;
        var num = parseInt($('input[name="num"]').attr('value'));
        var text = parseInt($('input[name="num"]').attr('text'));
        var yunfei = 999;
        console.log(yunfei)
        //当购物车数量增加的时候
        $('.add').click(function(){
            num++;
            text++;
            $('input[name="num"]').attr('value',num);
            var total = num * 1280 + yunfei;
            $('#price').html(total.toFixed(2));
        });
        //当购物车数量减少的时候
        $('.minus').click(function () {
            if(num>1){
                num--;
                $('input[name="num"]').attr('value',num);
                var total = num * 1280 + yunfei;
                $('#price').text(total.toFixed(2));
            }else{
                alert('购买数量不能少于一件')
            }
        });
    });




})