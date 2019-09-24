<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>碧沙康健_新闻列表</title>
    <!-- base -->
    <link href="resources/ctrl/Font-Awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="resources/css/comm/base.css" rel="stylesheet">
    <link href="resources/css/admin/HK_Admin.css" rel="stylesheet">
    <script type="text/javascript">
        var shopUrl = "<%=request.getContextPath()%>";
    </script>
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delarticle">删除</a>
    </script>
    <script type="text/html" id="imgTpl">
        {{# if(d.img_url != null){ }}
        <div><img src='{{ d.img_url}}'></div>
        {{#  } }}
    </script>

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
    <%@ include file="newsNavigation.jsp" %>
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div style="padding: 50px;">
            <p class="f-18 pt-15 pb-15 col-8d969d">
                搜索文章
            </p>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                <!-- 这里用layui的数据表格的重载 -->
                <form class="layui-form" action="">
                    <div class="layui-form-item mb-0" pane="">
                        <label class="layui-form-label f-14">新增：</label>
                        <div class="layui-input-block">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="text" name="inner_chain_text_CN" placeholder="请输入内联中文" lay-verify="required"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                                <div class="layui-input-inline">
                                    <input type="text" name="inner_chain_text_EN" placeholder="请输入内联英文" lay-verify="required"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                                <div class="layui-input-inline">
                                    <input type="text" name="inner_chain_text_HK" placeholder="请输入内联繁体" lay-verify="required"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                                <div class="layui-input-inline">
                                    <input type="text" name="inner_chain_url" placeholder="请输入要内联地址" lay-verify="required"
                                           autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <button type="submit" class="layui-btn layui-btn-sm" lay-submit="" lay-filter="search2" id="search2">添加</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                文章列表
            </p>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                <table id="keywordlist" lay-filter="test"></table>
            </div>
        </div>
    </div>

    <!-- (查看新闻基本信息)============================== 的弹出层的基本内容，供js调用======================= -->
    <div class="detailcontent dis-n">
        <div class="clear pd-20 f-16">
            <div class="clear mb-20 h-40 line-h-40 text-center">
                <div class="clear dis-ib">
                    <img src="resources/img/admin/admin_comm/logov1.png" class="h-35 mt-3 pull-left">
                    <span class="f-28 ml-10 f-w family-s pull-left h-40 line-h-40">新闻基本信息</span>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="resources/js/comm/jquery.min.js"></script>
<script src="resources/ctrl/layui/layui.js"></script>
<script src="resources/js/admin/admin_news/addkeyword.js"></script>
</body>
</html>