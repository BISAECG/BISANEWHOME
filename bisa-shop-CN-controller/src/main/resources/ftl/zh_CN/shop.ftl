<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <meta name="keywords" content="${html_keyWord}">
    <meta name="description" content="${html_description}">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <title>${html_title}</title>
    <!-- base -->
    <link href="../resources/css/comm/base.css" rel="stylesheet">
    <link href="../resources/css/index/index.css" rel="stylesheet">
    <link href="../resources/css/shop/shop.css" rel="stylesheet">
    <script src="../resources/js/comm/jquery.min.js"></script>
    <style>

    </style>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<!--心电仪购买页面-->
<div class="container ">
    <div class="row mt-40 boxLeft">
        <div class="col-md-4 col-md-offset-1 text-center">
            <img class="img-responsive" src="../resources/img/shop/xixin.png">
        </div>
        <div class="col-md-5 col-md-offset-1 boxRight">
            <p class="title">悉心动态心电仪</p>
            <p  style="margin-top: 30px;">
                <span class="spantitle">价格:</span>
                <span class="spanprice">¥1280</span>
            </p>
            <div class="goods_num clearfix" >
                <div class="num_name  spantitle pull-left ">数 量：</div>
                <div class="num_add pull-left">
                    <a href="javascript:;" class="minus fr">-</a>
                    <input readonly='true' type="text" name="num" class="num_show fl text-center" value="1">
                    <a href="javascript:;" class="add fr">+</a>
                </div>
            </div>
            <div class="recommend">
                <span class="spantitle pull-left">推荐:</span>
                <div class="pull-left cur-p" style="border: 1px solid #e3393c;background:rgba(252,223,227,1);">
                    <a href="shop.html">
                        心电仪
                    </a>
                </div>
                <div class="pull-left cur-p" style="border: 1px solid #ccc;">
                    <a href="shopAi.html">
                        AI智能检测报告
                    </a>
                </div>
                <div class="pull-left cur-p" style="border: 1px solid #ccc;">
                    <a href="shopDoctor.html">
                        医生审核检测报告
                    </a>
                </div>
                <div class="pull-left cur-p" style="border: 1px solid #ccc;">
                    <a href="shopSolution.html">
                        解决方案
                    </a>
                </div>
                <div class="pull-left cur-p" style="border: 1px solid #ccc;">
                    <a href="shopEcg.html">
                        悉心玲报告
                    </a>
                </div>
            </div>
            <div style="clear: both;"></div>
            <a href="payment.html">
                <button class="Order" >
                    Submit Order
                </button>
            </a>
            <p></p>
            <button class="now" >
                <i class="fa fa-phone" style="font-size: 18px;"></i>
                Consult now
            </button>
        </div>
    </div>
</div>
<div class="container-fluid" style="padding:0px;margin-top: 68px;">
    <div class="row center-block">
        <img class="img-responsive" src="../resources/img/shop/ecg.png">
    </div>
</div>
<!--结束-->
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

</body>
<script>
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
</script>
</html>