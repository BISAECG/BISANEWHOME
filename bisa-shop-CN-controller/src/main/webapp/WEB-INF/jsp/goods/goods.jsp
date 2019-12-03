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
    <title>${goods.name}</title>
    <meta name="keywords" content="${goods.name}">
    <meta name="description" content="${goods.description}">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <title>报告购买页</title>
    <!-- base -->
    <link href="../resources/css/comm/base.css" rel="stylesheet">
    <link href="../resources/css/index/index.css" rel="stylesheet">
    <link href="../resources/css/shop/shop.css" rel="stylesheet">
    <script src="../resources/js/comm/jquery.min.js"></script>
    <style>
        .spantitle{
            color:rgba(153,153,153,1);
            font-size:20px;
            line-height:40px;
            font-weight: 400;
        }
        .spanprice{
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

<!--ai报告购买页面-->
<div class="container">
    <div class="row mt-40 shopBox">
        <div class="col-md-4 col-md-offset-1 boxLeft">
         	<img class="img-responsive" src="${goods.img_url}">
        </div>
        <div class="col-md-5 col-md-offset-1 boxRight">
	            <p class="shopTitle" style="margin-bottom: 12px">${goods.name}</p>
	            <p style="font-size:16px;color:rgba(207,21,24,1);">${goods.description}</p>
	            <p class="shopPrice">
	                <span >价格:</span>
	                <span>¥${goods.price}</span>
	            </p>
	            <div class="row">
	            	<input readonly="true" type="hidden" name="goods_id"  value="${goods.id}">
	            </div>
	            <div class="recommend">
	                <span class=" pull-left">推荐:</span>
	                   <c:forEach items="${list}" var="item">
	                <div class="pull-left cur-p" style="border: 1px solid #ccc;margin-left: 5px;margin-top: 5px;">
	                    <a href="/html/${language}/goods.html?id=${item.id}" style="padding: 2px;font-size:18px;color:rgba(102,102,102,1);">
	                      ${item.name}
	                    </a>
	                </div>
	                </c:forEach>
	                
	            </div>
	            <div style="clear: both;"></div>
	            <button class="Order" style="margin-top: 15px;color:#fff">
	                <a href="/html/${language}/order.html?goods_id=${goods.id}">立刻购买</a>
	            </button>
	            <p></p>
	            <button class="now" >
	                <i class="fa fa-phone" style="font-size: 15px;">
	                	联系我们
	                </i>
	               
	            </button>
        </div>
    </div>
</div>
<div class="container-fluid" style="padding: 0px;margin-top: 68px;">
    <div class="row center-block">
          <img class="img-responsive center-block" src="${goods.detail_body}">
    </div>

</div>

<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

</body>

</html>