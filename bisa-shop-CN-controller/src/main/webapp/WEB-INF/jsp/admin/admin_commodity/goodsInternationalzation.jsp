<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bisa.health.shop.enumerate.GoodsStatusEnum"%>
<%@ page import="com.bisa.health.shop.enumerate.NeedPostType"%> 
<%@ page import="com.bisa.health.shop.enumerate.GoodsClassify"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
	<link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- necessary -->
    <meta name="keywords" content="1,2,3">
    <meta name="description" content="">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <title>碧沙康健_新增商品</title>
    <!-- base -->
    <link href="resources/ctrl/Font-Awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="resources/css/comm/base.css" rel="stylesheet">
    <link href="resources/css/admin/HK_Admin.css" rel="stylesheet">
    <link href="plugin/formSelects/formSelects-v4.css" rel="stylesheet" />
    <script>
		var noPost = "<%=NeedPostType.no_post.getValue()%>";  
		var need_Post = "<%=NeedPostType.need_post.getValue()%>";
		
		var in_sale = "<%=GoodsStatusEnum.in_sale.getValue()%>";
		var invalid = "<%=GoodsStatusEnum.invalid.getValue()%>";
		var sale_out = "<%=GoodsStatusEnum.sale_out.getValue()%>";
	
		var virtual = "<%=GoodsClassify.VIRTUAL.getValue()%>";
		</script>
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-layout-body">
    <div class="layui-layout">
        <!-- 左侧导航区域 -->
        <%@ include file="commodityNavigation.jsp" %>
        
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div class="mt-30 ml-50">
                <p class="f-20 pt-15 pb-15 col-8d969d">
                    	添加商品语言国际化
                </p>
                <fieldset class="layui-elem-field layui-field-title f-12" style="margin-top: 10px;">
				  <legend>注意：下面选项框显示的是未添加的语言类型</legend>
				</fieldset>
				<form class="layui-form" action="" lay-filter="">
				  <div class="layui-form-item">
				  
				    <label class="layui-form-label">名称</label>
				    <div class="layui-input-block" style="width: 500px;">
				      <input type="text" name="goodsName" lay-verify="required" autocomplete="off" placeholder="请输入商品名称"
							 class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">大标题</label>
				    <div class="layui-input-block" style="width: 500px;">
				      <input type="text" name="title" autocomplete="off" placeholder="请输入商品大标题" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">描述</label>
				    <div class="layui-input-block" style="width: 500px;height:100px;">
				      <textarea name="description" required lay-verify="required" placeholder="请输入商品描述 " class="layui-textarea"></textarea>
				    </div>
				  </div>
				  <div class="layui-form-item" lay-filter="">
				    <label class="layui-form-label">语言版本</label>
				    <div class="layui-input-block" style="width: 150px;">
				      <select name="langInter" class="langInter" lay-verify="required">
				      </select>
				    </div>
				  </div> 
				  
				  <div class="layui-form-item update-btn">
				    <div class="layui-input-block">
				       <button class="layui-btn" lay-submit lay-filter="addBtn">添加商品</button>
      					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				</form>
            </div>

	        <div class="mt-10 goods-img-div mt-30 ml-50 dis-n">
               <p class="f-18 pt-15 pb-15 col-8d969d">
                 	  商品图片
               </p>
               	<input type="hidden" id="img_goods_number" value="" />
               	
				<form class="layui-form" action="" lay-filter="">
					<div class="layui-form-item">
				    <div class="layui-inline text-center">
				    	<img class="layui-upload-img" src="resources/img/admin/admin_comm/add-img.jpg" id="demo0" style="height: 92px;width: 92px;">
				   		<div class="mt-5">
				   			<button type="button" class="layui-btn upload-img-btn" id="test1" value="1">主图</button>
				   		</div>
				   		<span id="demoText1"></span>
				   </div>
				    <div class="layui-inline text-center">
				    	<img class="layui-upload-img" src="resources/img/admin/admin_comm/add-img.jpg" id="demo1" style="height: 92px;width: 92px;">
				   		<div class="mt-5">
				   			<button type="button" class="layui-btn upload-img-btn" id="test2" value="2">侧图1</button>
				   		</div>
				   		<span id="demoText2"></span>
				   </div>
				    <div class="layui-inline text-center">
				    	<img class="layui-upload-img" src="resources/img/admin/admin_comm/add-img.jpg" id="demo2" style="height: 92px;width: 92px;">
				   		<div class="mt-5">
				   			<button type="button" class="layui-btn upload-img-btn" id="test3" value="3">侧图2</button>
				   		</div>
				   		<span id="demoText3"></span>
				   </div>
				   <div class="layui-inline text-center">
						<img class="layui-upload-img" src="resources/img/admin/admin_comm/add-img.jpg" id="demo3" style="height: 92px;width: 92px;">
				  		<div class="mt-5">
				  			<button type="button" class="layui-btn upload-img-btn" id="test4" value="4">侧图3</button>
				  		</div>
				  		<span id="demoText4"></span>
				   </div>
				   <div class="layui-inline text-center">
				   		<img class="layui-upload-img" src="resources/img/admin/admin_comm/add-img.jpg" id="demo4" style="height: 92px;width: 92px;">
				   		<div class="mt-5">
				   			<button type="button" class="layui-btn upload-img-btn" id="test5" value="5">详情图1</button>
				   		</div>
				   		<span id="demoText5"></span>
				   </div>
				   <div class="layui-inline text-center">
				   		<img class="layui-upload-img" src="resources/img/admin/admin_comm/add-img.jpg" id="demo5" style="height: 92px;width: 92px;">
				   		<div class="mt-5">
				   			<button type="button" class="layui-btn upload-img-btn" id="test6" value="6">详情图2</button>
				   		</div>
				   		<span id="demoText6"></span>
				   </div>
				   <div class="layui-inline text-center">
				   		<img class="layui-upload-img" src="resources/img/admin/admin_comm/add-img.jpg" id="demo6" style="height: 92px;width: 92px;">
				   		<div class="mt-5">
				   			<button type="button" class="layui-btn upload-img-btn" id="test7" value="7">详情图3</button>
				   		</div>
				   		<span id="demoText7"></span>
				   </div>
				  </div>
				</form>  
	       </div>
	       
        </div>
    </div>
    <script src="resources/js/comm/jquery.min.js"></script>
    <script src="resources/ctrl/layui/layui.js"></script>
    <script src="resources/js/admin/admin_commodity/goodsInternationalzation.js"></script>
</body>
</html>