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
    <script src="../resources/js/comm/jquery.min.js"></script>
    <style>
        .spantitle{
            color:rgba(153,153,153,1);
            font-size:20px;
            line-height:40px;
            font-weight: 400;
        }
        .spanprice{
            margin-left: 20px;
            color:rgba(207,21,24,1);
            line-height:40px;
            font-size:28px;
        }
    </style>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>


<div class="con">
    <div class="container" style="background:rgba(255,255,255,1);box-shadow:3px 9px 9px rgba(239,239,239,1);">
        <div class="row">
            <div class="col-md-4 col-md-offset-1" style="margin-top: 28px;margin-bottom: 41px;">
                <img class="img-responsive" src="../resources/img/shop/chanpin.png">
            </div>
            <div class="col-md-6 col-md-offset-1" style="margin-top: 41px;">
                <p style="font-size:24px;font-weight:400;color:rgba(51,51,51,1);">碧沙家用醫用動態心電監測儀</p>
                <p>
                    <span class="spantitle">價格:</span>
                    <span class="spanprice">¥ 1280</span>
                </p>
                <p>
                <div class="goods_num clearfix">
                    <div class="num_name  spantitle pull-left ">數 量：</div>
                    <div class="num_add pull-left" style="margin-top: 5px;">
                        <a href="javascript:;" class="minus fr">-</a>
                        <input readonly='true' type="text" name="num" class="num_show fl text-center" style="width: 80px;" value="1">
                        <a href="javascript:;" class="add fr">+</a>
                    </div>
                </div>

                </p>
                <p>
                    <span class="spantitle">地區:</span>
                    <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" style="background:rgba(252,223,227,1);"> 香港
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 澳門
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 台灣
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option3"> 新加坡
                    </label>
                </p>
                <p style="font-size:12px;color:rgba(208,18,17,1);">（因快遞郵費問題其他地區請電話咨詢我司銷售人員或在下方留言）</p>
                <form class="form-horizontal" >
                    <div class="form-group" style="margin-bottom: 0px;">
                        <label for="Address" class="col-sm-3 control-label spantitle" style="text-align: left;">詳細地址:</label>
                        <div class="col-sm-5" style="margin-top: 5px;">
                            <input type="email" class="form-control" id="Address" placeholder="">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px;">
                        <label for="name" class="col-sm-3 control-label spantitle" style="text-align: left;">姓名:</label>
                        <div class="col-sm-5" style="margin-top: 5px;">
                            <input type="text" class="form-control" id="name" placeholder="">
                        </div>
                    </div>
                    <div class="form-group" style="margin-bottom: 0px;">
                        <label for="phone" class="col-sm-3 control-label spantitle" style="text-align: left;">電話:</label>
                        <div class="col-sm-5" style="margin-top: 5px;">
                            <input type="text" class="form-control" id="phone" placeholder="">
                        </div>
                    </div>
                </form>
                <span class="spantitle">郵費:</span>
                <span class="spanprice">¥ 999</span>
                </p>
                <p>
                    <span class="spantitle">商品總價:</span>
                    <span class="spanprice total" id="totalPrice"><em id="price">1280</em>元</span>
                </p>
                <button style="width:170px;height:34px;background:rgba(207,21,24,1);border-radius:5px;color: #fff;border: 0;">Submit
                    Order</button>
                <button style="width:170px;height:34px;background:rgba(91,209,161,1);border-radius:5px;color: #fff;border: 0;">Consult now</button>
            </div>
        </div>
    </div>
    <!--<div class="container" style="margin-top: 14px;margin-bottom: 9px;">-->
    <!--<div class="row">-->
    <!--<p style="font-size:20px;color:rgba(229,72,30,1);">Tips: If you have any questions about our products or other related issues, you can submit your questions in the comments-->
    <!--below, our sales staff will reply you.</p>-->
    <!--</div>-->
    <!--</div>-->
    <div style="width: 100%;background:rgba(153,153,153,1);margin-top: 68px;">
        <div class="container">
            <div class="row">
                <p style="font-size:24px;color:rgba(255,255,255,1);line-height: 44px;margin-bottom: 0px;">在線留言</p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <p style="font-size:20px;color:rgba(229,72,30,1);font-weight:400;margin-top: 20px;">
                溫馨提示：如您對我們的産品或其他相關問題有疑問，均可在下方留言提交您的問題，我們的銷售人員會回複您。
            </p>
            <p>
                <span style="font-size:20px;color:rgba(229,72,30,1);font-weight:400;">服務熱線：</span>
                <span style="font-size:30px;font-weight:bold;color:rgba(207,21,24,1);">(852)2423  0600</span>
            </p>
        </div>
        <div class="row" style="margin-top: 25px;">
            <form class="form-inline">
                <div class="form-group col-md-3" style="padding-left: 0px;">
                    <label for="name1" class="control-label " style="color:rgba(102,102,102,1);font-size:20px;font-weight: 400;">姓名:</label>
                    <input type="text" class="form-control" id="name1" placeholder="請輸入姓名">
                </div>
                <div class="form-group col-md-3">
                    <label for="phone1" class="control-label " style="color:rgba(102,102,102,1);font-size:20px;font-weight: 400;">電話:</label>
                    <input type="text" class="form-control" id="phone1" placeholder="請輸入電話">
                </div>
                <div class="form-group col-md-3">
                    <label for="email" class="control-label " style="color:rgba(102,102,102,1);font-size:20px;font-weight: 400;">郵箱:</label>
                    <input type="email" class="form-control" id="email" placeholder="請輸入郵箱">
                </div>
                <div class="form-group col-md-3">
                    <label for="category" class="control-label " style="color:rgba(102,102,102,1);font-size:20px;font-weight: 400;">類別:</label>
                    <select class="form-control" id="category">
                        <option>個人</option>
                        <option>企業</option>
                        <option>醫院</option>
                    </select>
                </div>
            </form>
        </div>
        <div class="row" style="margin-top: 50px;">
            <p style="color:rgba(102,102,102,1);font-size:20px;font-weight: 400;">留言:</p>
            <textarea class="form-control" rows="5" placeholder="請輸入留言" style="box-shadow:0px 2px 38px 2px rgba(231,229,229,1);"></textarea>
            <button
                    style="background:rgba(43,122,174,1);border-radius:10px;width:200px;height:50px;margin-top: 20px;border: 0;color:#FFFFFF;margin-left: 40%;">
                提交留言
            </button>
        </div>
    </div>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

</body>
<script>
    //根據選擇的數量計算總價，並顯示出來
    $(function () {
        //加號
        var price1 = 1280;
        var num = parseInt($('input[name="num"]').attr('value'));
        var text = parseInt($('input[name="num"]').attr('text'));
        $('.add').click(function(){
            num++;
            text++;
            $('input[name="num"]').attr('value',num);
            var total = num * 1280;
            $('#price').html(total.toFixed(2));
        });
        //減號
        $('.minus').click(function () {
            if(num>1){
                num--;
                $('input[name="num"]').attr('value',num);
                console.log(num)
                var total = num * 1280;
                $('#price').text(total.toFixed(2));
            }else{
                alert('購買數量不能少于一件')
            }


        });
    });
</script>
</html>