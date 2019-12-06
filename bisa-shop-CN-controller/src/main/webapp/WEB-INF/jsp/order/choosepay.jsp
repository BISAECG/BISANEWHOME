<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html;"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <!-- necessary -->
    <meta name="keywords" content="${html_keyWord}">
    <meta name="description" content="${html_description}">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <title>选择支付方式</title>
    <!-- base -->
    <link href="../resources/css/comm/base.css" rel="stylesheet">
    <link href="../resources/css/index/index.css" rel="stylesheet">
    <link href="../resources/css/shop/choosePayment.css" rel="stylesheet">
    <script src="../resources/js/comm/jquery.min.js"></script>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="container choose">
    <div class="row">
        <div class="col-md-11  col-md-offset-1  text-center chooseTitle">
            <p>请选择支付方式</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-md-offset-1 chooseLeft text-center">
            <a href="payWaiting.html">
                <img class="img-responsive center-block" src="../resources/img/shop/yl.png">
                银联支付
            </a>
        </div>
        <div class="col-md-8 chooseRight text-center">
            <div class="row boxTop ">
                <div class="col-md-6">
                    <a href="payWaiting.html">
                    <img class="img-responsive center-block" src="../resources/img/shop/wx.png">
                        微信支付
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="payWaiting.html">
                    <img class="img-responsive center-block" src="../resources/img/shop/zfb.png">
                        支付宝支付
                    </a>
                </div>
            </div>
            <div class="row boxBottom mt-50">
                <div class="col-md-6">
                    <a>
                        <img class="img-responsive center-block" src="../resources/img/shop/visa.png">
                        VISA支付
                    </a>
                </div>
                <div class="col-md-6">
                    <a>
                        <img class="img-responsive center-block" src="../resources/img/shop/mate.png">
                        Master支付
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
<script src="../resources/js/shop/shop.js"></script>
</body>
</html>