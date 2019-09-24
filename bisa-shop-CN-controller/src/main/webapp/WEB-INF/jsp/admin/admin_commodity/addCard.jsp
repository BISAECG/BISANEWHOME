<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bisa.health.shop.enumerate.GoodsStatusEnum"%>
<%@ page import="com.bisa.health.shop.enumerate.NeedPostType"%>  
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
    <title>碧沙康健_新增服务卡</title>
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
            <div style="padding: 30px 50px;">
                <p class="f-20 pt-15 pb-15 col-8d969d">
                    	批量生成服务激活卡
                </p>
				<form class="layui-form" action="" lay-filter="">
				 <div class="layui-form-item">
				    <label class="layui-form-label">名称</label>
				    <div class="layui-input-block goods-select-div" style="width: 200px;">
				      <select name="goodsNumber" id="goodsNumber" lay-verify="required" lay-filter="goodsNumber">
				      </select>
				      <input type="hidden" id="cardName" name="cardName" lay-verify="required" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">服务类型</label>
				    <div class="layui-input-block" style="width: 200px;">
				     <select name="serviceType" lay-verify="required">
				       <c:forEach items="${listServiceType}" var="serviceType">
				      			<option value="${serviceType.serviceType}" selected><c:if test="${serviceType.serviceType=='TIME'}">天数</c:if><c:if test="${serviceType.serviceType=='COUNT'}">次数</c:if>
				      			</option>
						</c:forEach>
				      </select> 
				  	</div>
				  </div>
				 <div class="layui-form-item">
				    <label class="layui-form-label">服务编码</label>
				    <div class="layui-input-block" style="width: 200px;">
				      <select name="serviceToken" id="service_select" lay-filter="serviceToken" lay-verify="required">
				          	  <c:forEach items="${listService}" var="service">
				      			<option value="${service.stoken}" selected>${service.desc}</option>
						   </c:forEach>
				      </select>
				    </div>
				  </div>
				  <div class="layui-form-item">
				      <label class="layui-form-label">充值面额</label>
				      <div class="layui-input-block" style="width: 200px;">
				      <input type="text" name="count" placeholder="次数/天数" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				  </div>
				   <div class="layui-form-item">
				      <label class="layui-form-label">生成数量</label>
				      <div class="layui-input-block" style="width: 200px;">
				        <input type="text" name="amount" lay-verify="required" autocomplete="off" class="layui-input">
				      </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit="" lay-filter="createBtn1" id="createBtn1">开始生成</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
				
				</form> 
				<fieldset class="layui-elem-field layui-field-title f-12" style="margin-top: 30px;">
				  <legend>充值的面额应与卡名一致，如“24小时报告10次卡”，充值面额为10。</legend>
				</fieldset>
				<fieldset class="layui-elem-field layui-field-title f-12" style="margin-top: 10px;">
					<legend>生成数量为本批次卡的总数，如生成1000张卡。</legend>
				</fieldset> 
            </div>
        </div>
        
    </div>
    <script src="resources/js/comm/jquery.min.js"></script>
    <script src="resources/ctrl/layui/layui.js"></script>
    <script src="resources/js/admin/admin_commodity/addCard.js"></script>
</body>
</html>