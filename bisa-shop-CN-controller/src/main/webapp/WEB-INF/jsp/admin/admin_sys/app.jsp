<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
  <link rel="icon" href="Images/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon"/>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=0.3, maximum-scale=1">
    <!-- necessary -->
    <meta name="keywords" content="1,2,3">
    <meta name="description" content="">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <title>碧沙康健_APP更新设置</title>
    <!-- base -->
    <link href="resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="resources/css/comm/base.css" rel="stylesheet">
    <link href="resources/css/admin/HK_Admin.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style type="text/css">
    	.formLeftWidth{
    		width:200px;
    	}
    </style>

    <!-- 这里是自定义的表格模板   取值：{{ d.id }}  lay-event：事件name（需要监听生效）  -->
    <script type="text/html" id="barServer">
        <a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-warm layui-btn-sm" lay-event="delete">删除</a>
    </script>
   <!-- 表格  报告状态 中文显示 -->
        <script type="text/html" id="statusTpl">
            	{{# if(d.status == 1){ }}
                	<span style="color: #009688;">当前版本</span>
            	{{# }else{ }}
                	<span style="color: #F581B1;">以往版本</span>
            	{{#  } }}
        </script>
</head>

<body class="layui-layout-body">
<div class="layui-layout">
    <!-- 左侧导航区域 -->
    <%@ include file="leftmenu.jsp" %>

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend>App更新设置：</legend>
            </fieldset>

            <%--App更新表单--%>
            <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200 ml-30">
	         
	            <div class="layui-upload layui-inline">
                        <button type="button" class="layui-btn" id="uploadFile">APK上传</button>
                </div>
	            <span class="ml-60 pd-15" style="border-right: 1px solid #d5d6d8;height: 50px;margin-right: 100px"></span>
                   <form class="layui-form layui-inline" id="apkForm" action="admin/uploadapp" method="post"  >
	                    <div class="layui-inline mt-3">
	                        <input type="text" name="apkurl" id="apkurl" readonly="readonly" lay-verify="required " autocomplete="off"  class="layui-inline layui-input">
	                    </div>
	                     <div class="layui-inline mt-3">
	                        <input type="text" name="version" lay-verify="required " autocomplete="off" placeholder="请输入" class="layui-inline layui-input">
	                    </div>
	                    <div class="layui-inline mt-3">
	                    	      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
	                    </div>
                    </form>
            	</div>

            <%--App更新表格--%>
            <div  class="ml-30">

                    <p class="f-20 pb-15 mt-20 col-8d969d">
                        APK版本列表
                    </p>
                    <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200">
                        <table id="appUpdate" lay-filter="table1"></table>
                    </div>
            </div>


            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
                <legend>服务器部署设置：</legend>
            </fieldset>

            <%--App更新表格--%>
            <div  class="ml-30">

                <p class="f-20 pb-15 mt-20 col-8d969d">
                    	服务器列表
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2 min-w-1200">
                    <table id="serverDeploy" lay-filter="tableServerFilter"></table>
                   <p class="text-right"><button type="button" class="layui-btn" id="serverClick">服务器配置</button></p>
                </div>

            </div>


            <%--弹框html js调用--%>
            <div class="formdetail dis-n">
            <form class="layui-form"  id="serverForm" lay-filter="formServer" action="admin/uploadserver" method="post">
                 <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">版本号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="version"   placeholder="请输入国家区号" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">国家区号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone_code"    placeholder="请输入国家区号" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">城市编码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="country_code" placeholder="请输入城市编码"  class="layui-input">
                    </div>
                </div>
                
                 <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">APP服务器域名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="domain"  placeholder="请输入APP服务器域名"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth" >APP数据服务器域名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="datserver"  placeholder="请输入APP数据服务器域名"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">商城域名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="shopserver"  placeholder="请输入商城域名"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">国家中文简体名字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="cn_country"   placeholder="请输入国家中文简体名字"  class="layui-input">
                    </div>
                </div>
                
                 <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">国家中文繁体名字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="hk_country" placeholder="请输入国家中文繁体名字"  class="layui-input">
                    </div>
                </div>
                
                 <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">国家英文名字</label>
                    <div class="layui-input-inline">
                        <input type="text" name="en_country"   placeholder="请输入国家英文名字"  class="layui-input">
                    </div>
                </div>
              

                <div class="layui-form-item">
                    <label class="layui-form-label formLeftWidth">国家时区</label>
                    <div class="layui-input-inline">
                        <select name="time_zone" lay-filter="aihao">
                            <option value=""></option>
                              <option value="GMT-01">GMT-01</option>
                            <option value="GMT-02" >GMT-02</option>
                            <option value="GMT-03">GMT-03</option>
                            <option value="GMT-04">GMT-04</option>
                            <option value="GMT-05">GMT-05</option>
                            <option value="GMT-06">GMT-06</option>
                            <option value="GMT-07">GMT-07</option>
                            <option value="GMT-08">GMT-08</option>
                            <option value="GMT-09">GMT-09</option>
                            <option value="GMT-10">GMT-10</option>
                            <option value="GMT-11">GMT-11</option>
                            <option value="GMT-12">GMT-12</option>
                            <option value="GMT-13">GMT-13</option>
                            <option value="GMT+00">GMT+00</option>
                            <option value="GMT+01">GMT+01</option>
                            <option value="GMT+02">GMT+02</option>
                            <option value="GMT+03">GMT+03</option>
                            <option value="GMT+04">GMT+04</option>
                            <option value="GMT+05">GMT+05</option>
                            <option value="GMT+06">GMT+06</option>
                            <option value="GMT+07">GMT+07</option>
                            <option value="GMT+08" selected>GMT+08</option>
                            <option value="GMT+09">GMT+09</option>
                            <option value="GMT+10">GMT+10</option>
                            <option value="GMT+11">GMT+11</option>
                            <option value="GMT+12">GMT+12</option>
                            <option value="GMT+13">GMT+13</option>
                        </select>
                    </div>
                </div>
				<div class="layui-form-item">
				    <div class="layui-input-block">
				      <input name="id" type="hidden" />
				      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
 				 </div>
            </form>
            </div>
			<!-- 对话框结束 -->



        </div>
    </div>

</div>

<script src="resources/js/comm/jquery.min.js"></script>
<script src="resources/ctrl/layui/layui.js"></script>

<script>

var element;
var table;
var upload;
var layer;
var form;

$(document).ready(function () {

    //加载layui
    layui.use(['element', 'table', 'upload','form'], function () {
         layer = layui.layer;
         element = layui.element;
         table = layui.table;
         upload = layui.upload;
         form = layui.form;
         
         upload.render({
         	elem: '#uploadFile' //绑定元素
         	,url: '<%=request.getContextPath()%>/admin/ajax/app/upload'
         	,accept: 'file'
         	,done: function(res){
         		$("#apkurl").val(res.pathurl);
      
         	 }
         	 ,error: function(e){
         	    	//console.log(e);
         	      //请求异常回调
         	 }
     	});
         
        /*表格渲染*/
        table.render({
            elem: '#appUpdate', //id选择器
            url: '<%=request.getContextPath()%>/admin/ajax/app/list',//返回的数据格式layui官方有规定  https://www.layui.com/demo/table/user/?page=1&limit=30 此URL参考
            page: false,//开启分页
            limit: 10,
    	  	cellMinWidth: 50,
            cols: [
                [ //标题栏  toolbar:自定义模板
                    {field: 'id', title: 'id',  align: 'center'},
                    {field: 'appUrl', title: '下载URL',hide:true, align: 'center'},
                    {field: 'fileName', title: '文件名', hide:true,width: 250, align: 'center',event:'pductIntroduce'},
                    {field: 'status', title: '状态', align:'center',templet: '#statusTpl'},
                    {field: 'version', title: '版本号', align:'center'},
                	{title: '操作', width: 150, toolbar: '#barDemo', align: 'left'}
                ]
            ],
            //回调
            done: function (res, curr, count) {
				console.log(res);


            }
        });


        /*表格渲染*/
        table.render({
            elem: '#serverDeploy', //id选择器
            url: '<%=request.getContextPath()%>/admin/ajax/server/list',
            page: true,//开启分页
            limit: 10,
            limits: [10, 20, 30],
            cols: [
                [ //标题栏  toolbar:自定义模板
                	{field: 'id', title: 'id',  hide:true, align: 'center'},
                  	{field: 'version', title: '版本号', width: 100,align: 'center'},
                    {field: 'phoneCode', title: '国家区号', width: 100, align: 'center'},
                    {field: 'countryCode', title: '城市编码',width: 100, align: 'center'},
                    {field: 'time_zone', title: '时区', width: 100, align: 'center'},
                    {field: 'en_country', title: '国家英文名字', width: 100, align: 'center'},
                    {field: 'cn_country', title: '国家中文简体名字', width: 100, align: 'center'},
                    {field: 'hk_country', title: '国家中文繁体名字', width: 100, align: 'center'},
                    {field: 'domain', title: 'APP服务器域名', width: 300, align: 'center'},
                    {field: 'datserver', title: 'APP数据服务器域名', width: 300, align: 'center'},
                    {field: 'shopserver', title: '商城域名', width: 300, align: 'center'},
                    {field: 'time_zone', title: '国家时区', align: 'center'},
                    {title: '操作', width: 150, toolbar: '#barServer', align: 'left'}
                ]
            ]
        });


        /*监听*/
        table.on('tool(tableServerFilter)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        	
        	  var data = obj.data; // 获得当前行数据
	          var layEvent = obj.event; // 获得 lay-event 对应的值
	          var tr = obj.tr; // 获得当前行 tr 的DOM对象
	    
	          if(layEvent=='edit'){
	      
	        	  layer.open({
	                  title: '服务器配置'//弹框标题
	                  , content: $(".formdetail").html()//也可以是一个html
	                  , area: ['950px', '600px']
	                  , btn: ['关闭']
	                  , yes: function (index, layero) {
	                      //按钮【按钮知道了】的回调
	                      layer.close(index);
	                  }
	                 
	              });
	        	  form.val("formServer",{
	        		  "id":data.id,
	        		  "version":data.version,
	        		  "phone_code":data.phoneCode,
	        		  "country_code":data.countryCode,
	        		  "domain":data.domain,
	        		  "datserver":data.datserver,
	        		  "shopserver":data.shopserver,
	        		  "cn_country":data.cn_country,
	        		  "hk_country":data.hk_country,
	        		  "en_country":data.en_country,
	        		  "time_zone":data.time_zone});
	        	  form.render();
	        	 
	          }else if(layEvent=='delete'){
	        	  $.get("<%=request.getContextPath()%>/admin/ajax/server/delete?id="+data.id, function(result){
	        		  table.reload('serverDeploy',{url: '<%=request.getContextPath()%>/admin/ajax/server/list'});
	        	  });
	          }
	            
        });

        
        /*弹框*/
        $("#serverClick").click(function () {
            layer.open({
                title: '服务器配置'//弹框标题
                , content: $(".formdetail").html()//也可以是一个html
                , area: ['950px', '600px']
                , btn: ['关闭']
                , yes: function (index, layero) {
                    //按钮【按钮知道了】的回调
                    layer.close(index);
                }
               
            })
            
            form.render();
        })
        
            /*弹框*/
        $("#uploadApp").click(function () {

            layer.open({
                title: 'APK更新配置'//弹框标题
                , content: $(".appformdetail").html()//也可以是一个html
                , area: ['800px', '400px']
                , btn: ['关闭']
                , yes: function (index, layero) {
                    //按钮【按钮知道了】的回调
                    layer.close(index);        
                   
                }
            })
          
        })


    });
    
    
})



	// 消息弹出框
function show_msg(msg){   
	layer.msg(msg, {icon: 7});           
}
	


</script>
</body>
</html>