<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.ActivateEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.CardUnitEnum" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- necessary -->
    <title><spring:message code="admin.domain"/></title>
    <meta name="keywords" content="<spring:message code="admin.keyword"/>">
    <meta name="description" content="<spring:message code="admin.description"/>">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/admin/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style type="text/css">
    	.layui-form-label{
    		width:110px !important;
    	}
      
    </style>
   
</head>

<body class="layui-layout-body">
   <div >  
             <p class="f-18 pt-15 pb-15 col-8d969d">
                             <spring:message code="user.recharge"/>
             </p>
		    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
			   <div class="site-text site-block">
			      	 <form class="layui-form"  id="myForm" lay-filter="form">
				      <div class="layui-form-item">
					    <label class="layui-form-label"><spring:message code='card.number' /></label>
					    <div class="layui-input-block">
					      <input type="text" name="card_num" required  lay-verify="required" placeholder="<spring:message code='4027' />" autocomplete="off" class="layui-input">
					    </div>
					  </div>
					  <div class="layui-form-item">
					    <label class="layui-form-label"><spring:message code='password' /></label>
					    <div class="layui-input-inline">
					      <input type="text" name="card_pwd" required lay-verify="required" placeholder="<spring:message code='4028' />" autocomplete="off" class="layui-input">
					    </div>
					  </div>
					 
					  <div class="layui-form-item">
					    <label class="layui-form-label"><spring:message code='4024' /></label>
					    <div class="layui-input-block">
					      <input type="checkbox" name="status" title="<spring:message code='activation' />">					
					    </div>
					  </div>
					  
					  <div class="layui-form-item">
					    <label class="layui-form-label"><spring:message code='pin' /></label>
					   
					    <div class="layui-input-inline">
					     <input type="text" name="code" required lay-verify="required" placeholder="<spring:message code='4029' />" autocomplete="off" class="layui-input">
					    </div>
					     
					    <div class="layui-input-inline">
					      <img alt="" id="imgCode" src="/common/kaptcha"> 
					    </div>
					  </div>
					 
					  <div class="layui-form-item">
					    <div class="layui-input-block">
					      <button class="layui-btn" lay-submit lay-filter="form-submit"><spring:message code='submit' /></button>
					      <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
					    </div>
					  </div>
			        </form>
			   </div>
		    </div>
    </div>
    
       
  <script src="/resources/ctrl/layui/layui.js"></script>
	<script src="/resources/js/utils.js"></script>
    <script type="text/javascript">
        //<spring:message code="refresh"/>  页面按钮
  
     //加载layui
    layui.use(['element', 'table', 'upload','form'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         upload = layui.upload,
         form = layui.form,
         $=layui.jquery;
       	 showMessage("${message}");
     
       	form.on('submit(form-submit)', function(data){
       		console.log(data.field);
       		layer.load();
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/user/card/recharge',
				data : data.field,
				success : function(data) {
					layer.closeAll();
					if(data.code=="${SysStatusCode.SUCCESS}"){
						window.location.href="/html/${language}/user_card"; 
					}
					showMessage(data.msg);
				},error:function(){
					layer.closeAll();
				}
			});
	
       		return false;
       	});
       	
       	
        $('#imgCode').click(function(){
        	var timestamp = Date.parse(new Date());
        	$("#imgCode").attr('src','/common/kaptcha?version='+timestamp);
        });

       	
       
        
        /*异常信息*/
        function showMessage(msg) {
        	if(msg!=''){
        		layer.msg(msg);
        	}
        	
        }
    });

    
    </script>
</body>
</html>