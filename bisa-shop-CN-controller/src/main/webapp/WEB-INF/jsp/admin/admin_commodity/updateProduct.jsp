<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>碧沙康健_编辑产品与服务</title>
    <!-- base -->
    <link href="resources/ctrl/Font-Awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="resources/css/comm/base.css" rel="stylesheet">
    <link href="resources/css/admin/HK_Admin.css" rel="stylesheet">
    <link href="plugin/formSelects/formSelects-v4.css" rel="stylesheet" />

    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>

<body class="layui-layout-body">
    <div class="layui-layout">

        <!-- 左侧导航区域 -->
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item"><a href="admin/adminProductService/queryProduct">产品与服列表</a></li>
                    <li class="layui-nav-item"><a href="admin/commodity/addProduct">添加产品与服务</a></li>

                </ul>
            </div>
        </div>
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div style="padding: 30px 50px;">
                <p class="f-18 pt-15 pb-15 col-8d969d">
                    修改产品与服务资料：
                </p>
                <form class="layui-form" method="get" action="">
                    <div class="layui-form-item">
                        <div class="layui-form-item" lay-filter="">
                            <label class="layui-form-label">语言版本</label>
                            <div class="layui-input-block" style="width: 150px;">
                                <select name="internationalization" class="langInter" lay-verify="required">
                                    <option value="">请选择</option>
                                    <option value="1">简体</option>
                                    <option value="2">繁体</option>
                                    <option value="3">英文</option>
                                </select>
                            </div>
                        </div>

                      <%--  <label class="layui-form-label">商品类别</label>
                        <div class="layui-input-block col-8d969d" style="width: 400px;">
                            <select name="class_id" xm-select="select15" xm-select-skin="primary" lay-verify="required" xm-select-radio id="selectID">
                                <option value="">-请选择 商品类别-</option>
                            </select>
                        </div>
                        <p class="f-14 pt-15 pl-15">注：如没有想添加的商品类别前去 <a href="admin/commodity/classifyView">类别管理</a> 添加</p>
--%>

                    </div>
                    
                    <p class="f-18 pt-15 pb-15 col-8d969d mt-10 mb-10">
                        编辑产品详细描述
                    </p>

                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                         <textarea name="introduce" id="newseditor"></textarea>
                        <div class="mt-20 mb-20">
                            <div class="pull-right mr-40">
                                <button type="button" class="layui-btn" lay-submit="" lay-filter="addNews" id="addpudct" >立即提交</button>
                            </div>
                        </div>
                    </div>
                </form>
        </div>
    </div>

    <script src="resources/js/comm/jquery.min.js"></script>
    <script src="resources/ctrl/layui/layui.js"></script>
    <script src="resources/ctrl/ckeditor/ckeditor.js"></script>
    <script src="resources/js/admin/admin_commodity/updateProduct.js"></script>

</body>
</html>