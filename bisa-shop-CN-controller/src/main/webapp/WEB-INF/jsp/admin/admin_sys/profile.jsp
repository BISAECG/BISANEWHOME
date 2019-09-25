<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>页面设置</title>
    <!-- base -->
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
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="delete">删除</a>
 		<a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="generate">生成静态网页</a>
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
    <%@ include file="leftmenu.jsp" %>
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 mt-20">
            <!-- 这里用layui的数据表格的重载 -->
                <div class="layui-form-item mb-0" pane="">
                    <div class="layui-input-block">
                        <div class="layui-inline">
                        	<button type="button" id="addPage" class="layui-btn">新增页面</button>
                        </div>
                    </div>
                </div>
        </div>
        <div style="padding:0px 30px 30px 30px;">
            <p class="f-18 pt-15 pb-15  col-8d969d">
                页面设置
            </p>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                <table id="keywordlist" lay-filter="test"></table>
            </div>
        </div>
        <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
            <form class="layui-form" action="">
                <div class="layui-form-item mb-0" pane="">
                    <div class="layui-input-block">
                        <label class="layui-form-label f-14" style="width: 100px;">生成功能：</label>
                        <div class="layui-inline">
                            <button type="button" class="layui-btn layui-btn-sm" lay-submit="" id="allhtml">一键生成全站静态文件</button>
                            <button type="button" class="layui-btn layui-btn-sm btn-head" id="headhtml">生成头部文件</button>
                            <button type="button" class="layui-btn layui-btn-sm btn-footer" id="foothtml">生成底部文件</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%--弹框html js调用--%>
        <div class="formsetting dis-n">
            <form class="layui-form"  id="serverForm" lay-filter="formServer"  method="post">
                <input name="id" type="hidden" value="0" />
                <div class="layui-form-item ">
                    <label class="layui-form-label" style="width: 110px;">地址</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name"  lay-verify="required" placeholder="请输入跳转地址"  class="layui-input">
                    </div>
                    <label class="layui-form-label" style="width: 110px;">排序</label>
                    <div class="layui-input-inline">
                            <select name="order_id" lay-verify="">
                                <option value="">请选择排序数字</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                    </div>
                </div>
                <div class="layui-form-item ">
                    <label class="layui-form-label" style="width: 110px;padding-left:0px;">页面简体标题</label>
                    <div class="layui-input-inline">
                        <input type="text" name="html_title_CN"  lay-verify="required" placeholder="请输入页面简体名称"  class="layui-input">
                    </div>
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;">页面栏目简体</label>
                    <div class="layui-input-inline">
                        <input type="text" name="column_name_CN"  placeholder="请输入页面栏目简体"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left:0px;">页面繁体标题</label>
                    <div class="layui-input-inline">
                        <input type="text" name="html_title_HK"  lay-verify="required"  placeholder="请输入页面繁体名称"  class="layui-input">
                    </div>
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;">页面栏目繁体</label>
                    <div class="layui-input-inline">
                        <input type="text" name="column_name_HK"  lay-verify="required"  placeholder="请输入页面栏目繁体"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left:0px;">页面英文标题</label>
                    <div class="layui-input-inline">
                        <input type="text" name="html_title_US"  lay-verify="required"  placeholder="请输入页面英文名称"  class="layui-input">
                    </div>
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;">页面栏目英文</label>
                    <div class="layui-input-inline">
                        <input type="text" name="column_name_US"  lay-verify="required"  placeholder="请输入页面栏目英文"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left:0px;padding-right: 0px;">页面简体关键词</label>
                    <div class="layui-input-block">
                        <input type="text" name="html_keyWord_CN"  placeholder="请输入页面简体名称"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;padding-right: 0px;">页面繁体关键词</label>
                    <div class="layui-input-block">
                        <input type="text" name="html_keyWord_HK"  lay-verify="required"  placeholder="请输入页面繁体名称"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;padding-right: 0px;">页面英文关键词</label>
                    <div class="layui-input-block">
                        <input type="text" name="html_keyWord_US"  lay-verify="required"  placeholder="请输入页面英文名称"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;">页面简体描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="html_description_CN"   lay-verify="required" placeholder="请输入页面简体名称"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;">页面繁体描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="html_description_HK"  lay-verify="required"  placeholder="请输入页面繁体名称"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label " style="width: 110px;padding-left: 0px;">页面英文描述</label>
                    <div class="layui-input-block">
                        <input type="text" name="html_description_US"  lay-verify="required"  placeholder="请输入页面英文名称"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo2" id="demo2">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>

        </div>
        <!-- 对话框结束 -->
    </div>
</div>
<script src="resources/js/comm/jquery.min.js"></script>
<script src="resources/ctrl/layui/layui.js"></script>
<script src="resources/js/admin/profile.js"></script>
</body>

</html>