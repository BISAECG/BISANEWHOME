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
    <title>碧沙康健_新闻内容</title>
    <!-- base -->
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/admin/HK_Admin.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-layout-body">
    <div class="layui-layout">
        <!-- 左侧导航区域 -->
        <%@ include file="newsNavigation.jsp" %>
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div style="padding: 30px 50px;">
                <p class="f-18 pt-15 pb-15 col-8d969d">
                    填写新闻基本资料
                </p>
                <div class="layui-form-item">
                     <div class="lang_btn">
                          <button class="layui-btn layui-btn-radius layui-btn-primary" data-num="1" lay-submit="" lay-filter="china" id="zh_CN" >简体</button>
                          <button class="layui-btn layui-btn-radius" data-num="2" lay-submit="" lay-filter="hk"  id="hk" >繁体</button>
                          <button class="layui-btn layui-btn-radius layui-btn-primary" data-num="3" lay-submit="" lay-filter="english" id="en_US">英文</button>
                      </div>
                 </div>
                <form class="layui-form">
                	<input type="hidden" name="id" value="">
                	<input type="hidden" name="news_id" id="news_id" value="${news.news_id}">
                	<input type="hidden" name="lang_id" id="lang_id" value="${news.language}">
                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">新闻标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="main_title" id="main_title" lay-verify="required" autocomplete="off" placeholder="请输入新闻标题" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">新闻副标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="subheading" id="subheading" lay-verify="required" placeholder="请输入新闻副标题" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">作者：</label>
                            <div class="layui-input-block">
                                <input type="text" name="author" id="author" lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" id="readings">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">阅读量：</label>
                            <div class="layui-input-block">
                                <input type="text" name="readings"  id="readings1" lay-verify="required|number" placeholder="请输入阅读量" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                             <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">主图地址：</label>
                            <div class="layui-inline layui-col-xs6 pl-30">
                            		<input type="text" name="photo_address" id="photo_address" lay-verify="required" placeholder="请输入新闻主图地址" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-inline">
                            	<div class="layui-input-inline">
                            		<div class="layui-upload">
								  		<button type="button" class="layui-btn" id="test1">上传图片</button>
									</div> 
      							</div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">关键词：</label>
                            <div class="layui-input-block">
                                <input type="text" name="html_keyWord" id="html_keyWord" lay-verify="required" placeholder="请输入新闻关键词"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">页面标题：</label>
                            <div class="layui-input-block">
                                <input type="text" name="html_title" id="html-title" lay-verify="required" placeholder="请输入新闻meat的名称"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">页面描述：</label>
                            <div class="layui-input-block">
                                <input type="text" name="html_description" id="html-description" lay-verify="required"
                                       placeholder="请输入新闻meat标签中的描述"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">描述：</label>
                            <div class="layui-input-block">
                                <input type="text" name="describe" id="describe" lay-verify="required" placeholder="请输入新闻描述" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">新闻类型：</label>
                            <div class="layui-input-block" style="width: 150px;">
                                <select  class="newstype" lay-verify="required" name="newstype">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black">是否置顶：</label>
                            <div class="layui-input-block">
                                <input type="radio" name="roofPlacement" value="1" title="置顶">
                                <input type="radio" name="roofPlacement" value="0" title="不置顶">
                            </div>
                        </div>
                    </div>
                    
                    <p class="f-18 pt-15 pb-15 col-8d969d mt-10 mb-10">
                        编辑新闻主要内容
                    </p>

                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                         <textarea name="newseditor" id="newseditor"></textarea>
                    </div>
                    
                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                   <div class="mt-20 mb-20">
                    <div class="pull-right mr-40">
                        <button type="button" class="layui-btn" lay-submit=""  lay-filter="updateCN" id="updateCN">立即提交</button>
                    </div>
                </div>
                    
                </form>
                
            </div>
        </div>
    </div>
    
    <script src="/resources/js/comm/jquery.min.js"></script>
    <script src="/resources/ctrl/layui/layui.js"></script>
    <script src="/resources/ctrl/ckeditor/ckeditor.js"></script>
    <script src="/resources/js/admin/admin_news/adminNewsContent.js"></script>
</body>
<script>

</script>
</html>