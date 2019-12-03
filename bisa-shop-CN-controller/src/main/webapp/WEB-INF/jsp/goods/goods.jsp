<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <meta name="keywords" content="${goods.name}">
    <meta name="description" content="${goods.description}">
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
            <img class="img-responsive" src="${goods.img_url}">
        </div>
        <div class="col-md-5 col-md-offset-1 boxRight">
        	<form action="/html/${language}/order.html" method="post">
	            <p class="title">${goods.name}</p>
	            <p  style="margin-top: 30px;">
	                <span class="spantitle">价格:</span>
	                <span class="spanprice">¥${goods.price}</span>
	            </p>
	            <div class="goods_num clearfix" >
	                <div class="num_name  spantitle pull-left ">
	                	数 量：
	                	 <input readonly="true" type="hidden" name="goods_id"  value="${goods.id}">
	                </div>
	                <div class="num_add pull-left">
	                    <a href="javascript:;" class="minus fr"
	                       style="border: 1px solid #999;padding-bottom: 3px;padding-left: 3px;padding-right: 3px;">-</a>
	                    <input readonly="true" type="text" id="goods_count" name="goods_count" class="num_show fl text-center" value="1">
	                   
	                    <a href="javascript:;" class="add fr"
	                       style="border: 1px solid #999;padding-bottom: 3px;padding-left: 3px;padding-right: 3px;">+</a>
	                </div>
	            </div>
	            <div class="recommend">
	                <span class="spantitle pull-left">推荐:</span>
	                 <c:forEach items="${list}" var="item">
	                <div class="pull-left cur-p" style="border: 1px solid #e3393c;background:rgba(252,223,227,1);">
	                    <a href="/html/${language}/goods.html?id=${item.id}">
	                       		 ${item.name}
	                    </a>
	                </div>
	                </c:forEach>
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
            </form>
        </div>
    </div>
</div>
<div class="container-fluid" style="padding:0px;margin-top: 68px;">
    <div class="row">
        <img class="img-responsive center-block" src="${goods.detail_body}">
    </div>
</div>
<!--结束-->
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

</body>
<script src="../resources/js/shop/shop.js"></script>
</html>