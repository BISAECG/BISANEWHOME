<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <link rel="icon" href="favicon/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="favicon/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="favicon/favicon.ico" type="image/x-icon" />
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
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/admin/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="en_US"><spring:message code='edit' /></a>
        <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delarticle">删除</a>
    </script>
    
      <script type="text/html" id="news_roofPlacement">
        {{# if(d.type == 0){ }}
       		<span style="color: #009688;">不置顶</span>
        {{# }else{ }}
            <span style="color: #F581B1;">置顶</span>
        {{#  } }}
     </script>
    <style type="text/css">
    	.layui-form-label{
    		width:110px !important;
    	}
      
    </style>
</head>

<body class="layui-layout-body">
    <div class="layui-layout">
        <!-- 左侧导航区域 -->
        <%@ include file="nav.jsp" %>
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div style="padding: 50px;">
                <p class="f-18 pt-15 pb-15 col-8d969d">
                    搜索文章
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <!-- 这里用layui的数据表格的重载 -->
                    <form class="layui-form" lay-filter="form-opt">
                        <div class="layui-form-item mb-0" pane="">
                            <label class="layui-form-label f-14">搜索：</label>
                            <div class="layui-input-block">
                                <div class="layui-inline">
                                    <select name="searchabout" lay-verify="required" lay-search="">
                                        <option value="">请选择您要查询的内容</option>
                                        <option value="news_title">新闻标题</option>
                                        <option value="release_time">发布时间</option>
                                    </select>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button type="submit" class="layui-btn layui-btn-sm" lay-submit lay-filter="search">搜索</button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-refresh">刷新</button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-add">新增</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                    	文章列表
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="mTable" lay-filter="mTable"></table>
                </div>
            </div>
        </div>
        
             <%--弹框html js调用--%>
        <div class="formsetting dis-n">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="mainForm" lay-filter="form" >
	                <input name="id" type="hidden" value="0" />
	                 <input name="number" id="number" type="hidden" value="0" />
	                 <input name="category_name" id="category_name" type="hidden" value="0" />
	                <div class="layui-form-item">
	                    <label class="layui-form-label">商品名</label>
	                    <div class="layui-input-block">
	                    	<input type="text" name="name" required="" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
	                    </div>
	             
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label">商品分类</label>
	                    <div class="layui-input-inline">
	                         <select id="category_num" name="category_num" lay-verify="required">
	                         </select>
	                    </div>
	                    <label class="layui-form-label layui-col-md3">语言</label>
	                    <div class="layui-input-inline">
	                            <select id="language" name="language" lay-filter="language" lay-verify="required">
	                            </select>
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label layui-col-md3">商品价格</label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="price"  lay-verify="required" placeholder="请输入商品价格"  class="layui-input">
	                    </div>
	                    <label class="layui-form-label layui-col-md3">商品类型</label>
	                    <div class="layui-input-inline">
	                            <select id="order_type" name="type" lay-verify="required">
	                            	
	                            </select>
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label">商品描述</label>
	                    <div class="layui-input-block">
	                        <textarea name="description" placeholder="请输入内容"  lay-verify="required" class="layui-textarea"></textarea>
	                    </div>
	                </div>
	   
	                <div class="layui-form-item pt-20">
	                    <div class="text-center">
	                        <button class="layui-btn" lay-submit lay-filter="create" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
        
    </div>
  <script src="/resources/ctrl/layui/layui.js"></script>
	<script src="/resources/js/utils.js"></script>
    <script type="text/javascript">
        //刷新  页面按钮
  
     //加载layui
    layui.use(['element', 'table', 'upload','form'], function () {
        var layer = layui.layer,
         element = layui.element,
         table = layui.table,
         upload = layui.upload,
         form = layui.form,
         $=layui.jquery;
       	 showMessage("${message}");
     
       	 
       	form.on('submit(create)', function(data){
       		
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/order/ajax/add',
				data : data.field,
				success : function(data) {
					if(data.code=="${SysStatusCode.SUCCESS}"){
						layer.closeAll();
						tableIns.reload();
					}
						showMessage(data.msg);
					
				}
			});
	
       		return false;
       	});
       	
   
        //=================执行渲染==================
        var tableIns =table.render({
            elem: '#mTable', //指定原始表格元素选择器（推荐id选择器）
            url: '/admin/order/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                        {field: 'id', title: 'ID', width: '5%', align: 'center'},
                        {field: 'number', title: '商品编号', width: '20%', align: 'center'},
                        {field: 'type', title: '商品类型', width: '10%', align: 'center',templet:'#goodType'},
                        {field: 'language', title: '语言', width: '10%', align: 'center'},
                        {field: 'price', title: '商品价格', width: '10%', align: 'center'},
                        {field: 'name', title: '商品名',width: '10%',  align: 'center'},
                        {fixed: 'right', title: "<spring:message code='opt' />", width: '35%', align: 'center', toolbar: '#barDemo'}                  
                ]
            ],
            done: function (res, curr, count) {

            }
        });
        
        // ===============监听工具条===================
        table.on('tool(table)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        	var data = obj.data; // 获得当前行数据
            var layEvent = obj.event; // 获得 lay-event 对应的值
            var tr = obj.tr; // 获得当前行 tr 的DOM对象
            var where=null;
            if(layEvent == 'delete'){
                // 删除这里有个BUG就是单页删除完后需要手动刷新
                var id = data.id;
                layer.confirm("<spring:message code='submit.delete' />", function (index) {
                    $.ajax({
                        url: '/admin/order/ajax/del/'+id,
                        type: "DELETE",
                        success: function (data) {
                        	
                        	if(data.code=="${SysStatusCode.SUCCESS}"){
                        		layer.closeAll();
        						tableIns.reload({page:{curr:1}});
                        	}
                        	showMessage(data.msg);
                        }
                    });
                });
            }else if(layEvent == 'edit'){
            	
            	openDialog('serverForm','.formsetting',data.number);
            	 
            }else{
            	where={number:data.number,language:layEvent,id:0,price:data.price,type:data.type};
            }
            if(where!=null){
            	fullData(where,true);
            }
          
        });
        

        function openDialog(formName,formHtml,data){
        	$('#mainForm')[0].reset();
          	 layer.open({
                   title: "<spring:message code='add' />"//弹框标题
                   , content:$(formHtml)//也可以是一个html
                   , area: ['700', '600']
   		         ,closeBtn: 1
   		         ,shadeClose:true
   		         ,type: 1
   		      	,shade: 0 
   		     	,success:function(layero,index){
	   		       	form.val(formName,data);
	   		 	    form.render(null,formName);
           		}
               });
       
          }
        function fullData(where){
        	$.ajax({
                url: '/admin/order/ajax/load',
                type: "GET",
                data : where,
                success: function (data) {
                	if(data.code=="${SysStatusCode.SUCCESS}"){
                		openDialog('mainForm','.formsetting',data.data);
                	}else{
                		openDialog('mainForm','.formsetting',where);
                		
                	}
                	
                }
            });
        }
    	 
        //执行实例
        $(".btn-add").click(function(){
        	fullData({id:0,number:'',language:"${language}"},false);
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