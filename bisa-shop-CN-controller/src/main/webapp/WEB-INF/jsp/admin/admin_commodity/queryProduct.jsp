<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bisa.health.shop.enumerate.GoodsStatusEnum"%>
<%@ page import="com.bisa.health.shop.enumerate.NeedPostType"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ResourceBundle resource = ResourceBundle.getBundle("resources");
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
    <title>碧沙康健_产品与服务列表</title>
    <!-- base -->
    <link href="resources/ctrl/Font-Awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="resources/css/comm/base.css" rel="stylesheet">
    <link href="resources/css/admin/HK_Admin.css" rel="stylesheet">
    <script>
        var noPost = "<%=NeedPostType.no_post.getValue()%>";
        var need_Post = "<%=NeedPostType.need_post.getValue()%>";

        var in_sale = "<%=GoodsStatusEnum.in_sale.getValue()%>";
        var invalid = "<%=GoodsStatusEnum.invalid.getValue()%>";
        var sold_out = "<%=GoodsStatusEnum.sale_out.getValue()%>";
    </script>
    <!-- 操作 工具栏 -->
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event=""
           href="admin/adminProductService/updateProduct?id={{ d.id }}&internationalization={{d.internationalization}}">编辑</a>
        <a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="delete">删除</a>
    </script>

    <script type="text/html" id="introduce">
        {{# if(d.introduce != null){ }}
        <div style="height:70px;">{{ d.introduce}}'</div>
        {{#  } }}
    </script>

    <script type="text/html" id="imgTpl">
        {{# if(d.imgurl != null){ }}
        <div><img width="70" height="70" src='{{ d.imgurl}}'></div>
        {{#  } }}
    </script>
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .layui-table-cell{
            height: 100%;
            max-width: 100%;
        }
        .laytable-cell-1-11{
            height: 100%;
            max-width: 100%;
        }
    </style>
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
        <div style="padding: 50px;">



            <p class="f-20 pb-15 mt-20 col-8d969d">
                产品列表
            </p>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200">
                <table id="commodityList" lay-filter="test"></table>
            </div>
        </div>
    </div>

    <!-- (查看goods基本信息)============================== 的弹出层的基本内容，供js调用======================= -->
    <div class="detailcontent dis-n">
        <div class="clear pd-20 f-16">
            <div class="clear mb-20 h-40 line-h-40 text-center">
                <div class="clear dis-ib">
                    <img src="resources/img/admin/admin_comm/logov1.png" class="h-35 mt-3 pull-left">
                    <span class="f-28 ml-10 f-w family-s pull-left h-40 line-h-40">商品基本信息</span>
                </div>
            </div>
            <fieldset class="layui-elem-field">
                <legend>商品基本信息</legend>
                <%--<div class="layui-input-block">
                    <div class="lang_btn">
                        &lt;%&ndash;国际化语言类型&ndash;%&gt;
                        <input type="hidden" id="lang" value="">
                        <button class="layui-btn layui-btn-radius layui-btn-primary" data-num="1" lay-submit="" lay-filter="china" id="china">简体</button>
                        <button class="layui-btn layui-btn-radius" data-num="2" lay-submit="" lay-filter="hk" id="hk">繁体</button>
                        <button class="layui-btn layui-btn-radius layui-btn-primary" data-num="3" lay-submit="" lay-filter="english" id="english">英文</button>
                    </div>
                </div>--%>
                <div class="layui-field-box">
                    <div class="layui-form-item mb-0">
                        <label class="layui-form-label pl-0 pr-0">商品图片:</label>
                        <div class="layui-input-block imgurl line-h-35 f-16" id="imgUrl">
                        </div>
                    </div>
                    <div class="layui-form-item mb-0">
                        <label class="layui-form-label pl-0 pr-0">产品id:</label>
                        <div class="layui-input-block goodsName line-h-35 f-16">
                        </div>
                    </div>
                    <div class="layui-form-item mb-0">
                        <label class="layui-form-label pl-0 pr-0">产品描述:</label>
                        <div class="layui-input-block goodsNumber line-h-35 f-16">
                        </div>
                    </div>
                    <div class="layui-form-item mb-0">
                        <label class="layui-form-label pl-0 pr-0">语言版本:</label>
                        <div class="layui-input-block goodsPrice line-h-35 f-16">
                        </div>
                    </div>
                    <div class="layui-form-item mb-0">
                        <label class="layui-form-label pl-0 pr-0">商品编号:</label>
                        <div class="layui-input-block title line-h-35 f-16">
                        </div>
                    </div>

                </div>
            </fieldset>
        </div>
    </div>

</div>
<script src="resources/js/comm/jquery.min.js"></script>
<script src="resources/ctrl/layui/layui.js"></script>
<script src="resources/js/admin/admin_commodity/queryProduct.js"></script>
</body>
</html>