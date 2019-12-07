<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.enumerate.PayTypeEnum" %>

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
	  <title><spring:message code="admin.domain" /></title>
	 <meta name="keywords" content="<spring:message code="admin.keyword" />">
	 <meta name="description" content="<spring:message code="admin.description" />">
<!-- description -->
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
<<<<<<< HEAD
   	<link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
=======
>>>>>>> BUG1
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/index/index.css" rel="stylesheet">
    <link href="/resources/css/shop/choosePayment.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
<<<<<<< HEAD
    <script src="/resources/ctrl/layui/layui.js"></script>
=======
>>>>>>> BUG1
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
<<<<<<< HEAD
    <form action="/html/${language}/pay" method="post" class="layui-form">
    	 	<input type="hidden"  id="language" name="language" value="${language}" />
                 <input type="hidden" id="orderNum" name="orderNum" value="${orderNum}" />
                  <input type="hidden"  id="payType" name="payType" value="-1" />
                   <input type="hidden"  id="timestamp" name="timestamp" value="${timestamp}" />

        <div class="col-md-8 chooseRight text-center">
            <div class="row boxTop ">
                <div class="col-md-6">
                    <a lay-submit  lay-filter="wechat" >
                    <img class="img-responsive center-block" src="/resources/img/shop/wx.png">
                        	微信支付
                    </a>
                </div>
                <div class="col-md-6">
                    <a lay-submit  lay-filter="alipay">
                    <img class="img-responsive center-block" src="/resources/img/shop/zfb.png">
                        	支付宝支付
=======
        <div class="col-md-3 col-md-offset-1 chooseLeft text-center">
            <a href="payWaiting.html">
                <img class="img-responsive center-block" src="/resources/img/shop/yl.png">
                银联支付
            </a>
        </div>
        <div class="col-md-8 chooseRight text-center">
            <div class="row boxTop ">
                <div class="col-md-6">
                    <a href="payWaiting.html">
                    <img class="img-responsive center-block" src="/resources/img/shop/wx.png">
                        微信支付
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="payWaiting.html">
                    <img class="img-responsive center-block" src="/resources/img/shop/zfb.png">
                        支付宝支付
>>>>>>> BUG1
                    </a>
                </div>
            </div>
            <div class="row boxBottom mt-50">
                <div class="col-md-6">
<<<<<<< HEAD
                    <button lay-submit  lay-filter="visa">
=======
                    <a>
>>>>>>> BUG1
                        <img class="img-responsive center-block" src="/resources/img/shop/visa.png">
                        VISA支付
                    </button>
                </div>
                <div class="col-md-6">
<<<<<<< HEAD
                    <button lay-submit  lay-filter="master">
=======
                    <a>
>>>>>>> BUG1
                        <img class="img-responsive center-block" src="/resources/img/shop/mate.png">
                        Master支付
                    </button>
                </div>
            </div>
            <div class="row boxTop ">
                <div class="col-md-6">
                    <button  class="layui-btn" id="easy" lay-submit  lay-filter="easy"  >
		                <img class="img-responsive center-block" src="/resources/img/shop/yl.png">
		                	银联支付
		            </button>
                </div>
            </div>
        </div>
      </form>
    </div>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
<<<<<<< HEAD
<script type="text/javascript">
	layui.use([ 'element', 'form' ],function() {
		var layer = layui.layer, 
		element = layui.element, 
		form = layui.form;
		

		form.on('submit(easy)', function(data){
			$('#payType').val("${PayTypeEnum.EASY.getValue()}");
			return true;
		});
		form.on('submit(visa)', function(data){
			return true;
		});
		form.on('submit(master)', function(data){
			return true;
		});
		
		
	});
</script>
=======
<script src="/resources/js/shop/shop.js"></script>
>>>>>>> BUG1
</body>
</html>