<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.OrderStatusEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.PayEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.CouponEnum" %>
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
    <script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="address"><spring:message code='3003' /></a>
		<a class="layui-btn layui-btn-normal layui-btn-sm" lay-event="details"><spring:message code='details' /></a>
        <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="ems"><spring:message code='3005' /></a>
    </script>
  
  
     <script type="text/html" id="orderStatus">
        {{# if(d.order_status=="${OrderStatusEnum.UNSHIPPED.getValue()}"){ }}
       		<span style="color: #F581B1;"><spring:message code="unshipped"/></span>
        {{# }else if(d.order_status=="${OrderStatusEnum.DELIVERRY.getValue()}"){ }}
            <span style="color: #009688;"><spring:message code="shipped"/></span>
 		{{# }else if(d.order_status=="${OrderStatusEnum.CANCEL.getValue()}"){ }}
            <span style="color: #F581B1;"><spring:message code="returns"/></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code="exchange"/></span>
		{{#  } }}
    </script>
    <script type="text/html" id="orderIsPay">
        {{# if(d.is_pay=="${PayEnum.PAY.getValue()}"){ }}
       		<span style="color: #009688;"><spring:message code="paid"/></span>
        {{#  }else{ }}
 			<span style="color: #F581B1;"><spring:message code="unpaid"/></span>
		{{#  } }}
    </script>
 
</head>

<body class="layui-layout-body">
    <div class="layui-layout">
        <!-- 左侧导航区域 -->
        <%@ include file="nav.jsp" %>
        <!-- 内容主体区域 -->
        <div class="layui-body">
            <div style="padding: 50px;">
                <p class="f-18 pt-15 pb-15 col-8d969d">
                    <spring:message code="seach"/>
                </p>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <!-- 这里用layui的数据表格的重载 -->

                    <form class="layui-form" lay-filter="form-opt" >
                        <div class="layui-form-item mb-0" pane="">
                            <label class="layui-form-label f-14"><spring:message code="seach"/>：</label>
                            <div class="layui-input-block">
                                <div class="layui-inline">
                                    <select name="searchabout" lay-verify="required" lay-search="">
                                        <option value=""><spring:message code="seach.content.input"/></option>
                                        <option value="user_id"><spring:message code="7003"/></option>
                                        <option value="order_num"><spring:message code="3008"/></option>
                                        <option value="order_name"><spring:message code="addressee"/></option>
                                        <option value="order_phone"><spring:message code="addressee.phone"/></option>
                                        <option value="c_time"><spring:message code="time"/></option>
                                        
                                    </select>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="incontent" lay-verify="required" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <button type="submit" class="layui-btn layui-btn-sm" lay-submit lay-filter="search"><spring:message code="seach"/></button>
                                    <button type="button" class="layui-btn layui-btn-sm btn-refresh"><spring:message code="refresh"/></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <p class="f-18 pt-15 pb-15 mt-40 col-8d969d">
                    	<spring:message code="list"/>
                </p>
				<script type="text/html" id="toolbarDemo">
					<div class="layui-btn-container">
						<button class="layui-btn layui-btn-sm" lay-event="getCheckData">打印</button>
					</div>
				</script>
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <table id="mTable" lay-filter="mTable"></table>
                </div>
            </div>
        </div>
        
        <%--详情Dialog--%>
        <div class="details dis-n">
        	<div class="site-text site-block">
	            <form class="layui-form"  id="mainForm" lay-filter="form" >
	                <input name="id" type="hidden" readonly="readonly"  value="0" />
	                 <input name="address_id" id="address_id" type="hidden" readonly="readonly"  value="0" />
	                 <input name="user_id" id="user_id" readonly="readonly"  type="hidden" value="0" />
	                <div class="layui-form-item">
	                    <label class="layui-form-label"><spring:message code='2036'/></label>
	                    <div class="layui-input-inline">
	                    	<input type="text" readonly="readonly"  name="goods_num"  lay-verify="required" placeholder="<spring:message code='3014'/>" autocomplete="off" class="layui-input">
	                    </div>
	                     <label class="layui-form-label"><spring:message code='2025'/></label>
	                    <div class="layui-input-inline">
	                             <select id="goods_type" name="goods_type" lay-verify="required">
	                            	<option value="${GoodsTypeEnum.REAL.getValue()}"><spring:message code='2009'/></option>
	                            	<option value="${GoodsTypeEnum.VIRTUAL.getValue()}"><spring:message code='2010'/></option>
	                            </select>
	                    </div>
	             
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label"><spring:message code='2026'/></label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="goods_price"  lay-verify="required"  autocomplete="off" class="layui-input">
	                    </div>
	                    <label class="layui-form-label layui-col-md3"><spring:message code='2015'/></label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="goods_count"  lay-verify="required"  autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label layui-col-md3"><spring:message code='3008'/></label>
	                    <div class="layui-input-inline">
	                        <input readonly="readonly"  type="text" name="order_num"  lay-verify="required"  class="layui-input">
	                    </div>
	                      <label class="layui-form-label layui-col-md3"><spring:message code='time'/></label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="c_time"  lay-verify="required"  autocomplete="off" class="layui-input">
	                    </div>
	                
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label"><spring:message code='status'/></label>
	                    <div class="layui-input-inline">
	                    	<select  id="order_status" name="order_status" lay-verify="required">
	                            <option value="${OrderStatusEnum.UNSHIPPED.getValue()}"><spring:message code='unshipped'/></option>
	                            <option value="${OrderStatusEnum.DELIVERRY.getValue()}"><spring:message code='shipped'/></option>
	                            <option value="${OrderStatusEnum.CANCEL.getValue()}"><spring:message code='returns'/></option>
	                            <option value="${OrderStatusEnum.EXCHANGE.getValue()}"><spring:message code='exchange'/></option>
	                        </select>
	                    </div>
	                    <label class="layui-form-label layui-col-md3"><spring:message code='paid.statut'/></label>
	                    <div class="layui-input-inline">
	                    	<select   id="is_pay" name="is_pay" lay-verify="required">
	                    		<option value="${PayEnum.PAY.getValue()}"><spring:message code='paid'/></option>
	                            <option value="${PayEnum.NOT_PAY.getValue()}"><spring:message code='unpaid'/></option>
	                        </select>
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                    <label class="layui-form-label layui-col-md3"><spring:message code='3015'/></label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="order_price"  lay-verify="required" " autocomplete="off" class="layui-input">
	                    </div>
	                      <label class="layui-form-label layui-col-md3"><spring:message code='2018'/></label>
	                    <div class="layui-input-inline">
	                    	<input readonly="readonly"  type="text" name="order_total"  lay-verify="required"  class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                <label class="layui-form-label layui-col-md3"><spring:message code='4025'/></label>
	                    <div class="layui-input-block">
	                         <input readonly="readonly"  type="text" name="coupon_num"  lay-verify="required"  autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	                  <div class="layui-form-item ">
	                  	 <label class="layui-form-label"><spring:message code='3016'/></label>
	                    <div class="layui-input-inline">
	                    	<select  id="is_coupon" name="is_coupon" lay-verify="required">
	                    		<option value="${CouponEnum.COUPON.getValue()}"><spring:message code='3017'/></option>
	                            <option value="${CouponEnum.NOT_COUPON.getValue()}"><spring:message code='3018'/></option>
	                         </select>
	                    </div>
	                     <label class="layui-form-label"><spring:message code='3019'/></label>
	                    <div class="layui-input-inline">
	                    	<input readonly="readonly"  type="text" name="coupon_price"  lay-verify="required" autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	       			<div class="layui-form-item ">
	       				<label class="layui-form-label"><spring:message code='addressee.phone'/></label>
	                    <div class="layui-input-inline">
	  							<input readonly="readonly"  type="text" name="order_phone"  lay-verify="required" autocomplete="off" class="layui-input">
	                    </div>
	                	<label class="layui-form-label layui-col-md3"><spring:message code='3020'/></label>
	                    <div class="layui-input-inline">
	                         <input readonly="readonly"  type="text" name="ems_num"  lay-verify="required"  autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                	<label class="layui-form-label layui-col-md3"><spring:message code='3021'/></label>
	                    <div class="layui-input-block">
	                         <input readonly="readonly"  type="text" name="order_address"  lay-verify="required"  autocomplete="off" class="layui-input">
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
        
        
        <%--地址Dialog--%>
        <div class="address-box dis-n">
        	<div class="site-text site-block">
	          	 <form class="layui-form"  id="address-form" lay-filter="address-form">
	                <input name="id" type="hidden" value="0" />
	                <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code='address'/></label>
	                    <div class="layui-input-block">
	                        <input type="text" name="order_address"  lay-verify="required"   class="layui-input">
	                    </div>
	                </div>
	                <div class="layui-form-item ">
	                  
	                    <label class="layui-form-label"><spring:message code='addressee.phone'/></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="order_phone"  lay-verify="required"  class="layui-input">
	                    </div>
	                </div>
	               
	                <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="address_submit" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
        
        <%--物流Dialog--%>
        <div class="ems-box dis-n">
        	<div class="site-text site-block">
	          	 <form class="layui-form"  id="ems-form" lay-filter="ems-form">
	                <input name="id" type="hidden" value="0" />
	                <div class="layui-form-item ">
	                    <label class="layui-form-label"><spring:message code='3022'/></label>
	                    <div class="layui-input-inline">
	                       	<select  id="order_status" name="order_status" lay-filter="ems_status" lay-verify="required">
	                           <option value="${OrderStatusEnum.UNSHIPPED.getValue()}"><spring:message code='unshipped'/></option>
	                            <option value="${OrderStatusEnum.DELIVERRY.getValue()}"><spring:message code='shipped'/></option>
	                            <option value="${OrderStatusEnum.CANCEL.getValue()}"><spring:message code='returns'/></option>
	                            <option value="${OrderStatusEnum.EXCHANGE.getValue()}"><spring:message code='exchange'/></option>
	                        </select>
	                    </div>
	                    <label class="layui-form-label"><spring:message code='3020'/></label>
	                    <div class="layui-input-inline">
	                        <input type="text" name="ems_num"  placeholder="<spring:message code='3023'/>"  class="layui-input">
	                    </div>
	                </div>
	               
	                <div class="layui-form-item">
	                    <div class="text-center pd-20">
	                        <button class="layui-btn" lay-submit lay-filter="ems_submit" ><spring:message code='submit' /></button>
	                        <button type="reset" class="layui-btn layui-btn-primary"><spring:message code='reset' /></button>
	                    </div>
	                </div>
	            </form>
			</div>
        </div><!-- end 弹框 -->
		<!-- 打印相关的弹出层，供js调用 -->
		<!--startprint-->
		<div class="clear ">
			<div id="print_content">
			</div>
		</div>
		<!--endprint-->
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
     
       	form.on('submit(address_submit)', function(data){
       		layer.load();
       		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/order/ajax/address',
				data : data.field,
				success : function(data) {
					layer.closeAll();
					if(data.code=="${SysStatusCode.SUCCESS}"){
						tableIns.reload({page:{curr:1},where: {
			             	vKey: "",
			             	vVal: ""
			         	}});
						showMessage(data.msg);
					}
					
				},error:function(){
					layer.closeAll();
				}
			});
       		return false;
       	});
       	
		form.on('submit(ems_submit)', function(data){
			layer.load();
	 		$.ajax({
				type : "POST",
				dataType: "json",
				//contentType: "application/json;charset=UTF-8",
				url : '/admin/order/ajax/ems',
				data : data.field,
				success : function(data) {
					layer.closeAll();
					if(data.code=="${SysStatusCode.SUCCESS}"){
						tableIns.reload({page:{curr:1},where: {
			             	vKey: "",
			             	vVal: ""
			         	}});
						showMessage(data.msg);
					}
					
				},error:function(){
					layer.closeAll();
				}
			});
       	return false;
       	});
	
  		form.on('submit(search)', function(data){
  			 var incontent = data.field.incontent;
             var searchabout = data.field.searchabout;
             if(searchabout=="user_id"){
  	  			$.ajax({
  					type : "GET",
  					dataType: "json",
  					async: false,
  					data:{username:incontent},
  					//contentType: "application/json;charset=UTF-8",
  					url : '/admin/user/ajax/load/',
  					success : function(obj) {
  						if(obj.code=="${SysStatusCode.SUCCESS}"){
  							tableIns.reload({page:{curr:1},where: {
  		 	                	vKey: searchabout,
  		 	                	vVal: obj.data.user_guid
  		 	            	}});
  						}
  					}
  				});
  	  		
  			}else{

  	        	tableIns.reload({page:{curr:1},where: {
  	                	vKey: searchabout,
  	                	vVal: incontent
  	            }});
  			}
             return false;
       	});
  		
  		
       	
  		$('.btn-refresh').click(function(){
  			tableIns.reload({page:{curr:1},where: {
             	vKey: "",
             	vVal: ""
         	}});
         	return false;
  		});
   
        //=================执行渲染==================
        var tableIns =table.render({
			id:'mTable',
            elem: '#mTable', //指定原始表格元素选择器（推荐id选择器）
            toolbar: '#toolbarDemo' ,
            url: '/admin/order/ajax/list',
            method:'GET',
            page:{layout:	['prev', 'page', 'next'],limit:10},
            cols: [
                [ //标题栏
                    	{type: 'checkbox', fixed: 'left'},
                        {field: 'id', title: 'ID', width: '5%', align: 'center'},
                        {field: 'goods_pattern', title: '<spring:message code="id"/>',width: '10%',  align: 'center'},
                        {field: 'order_num', title: '<spring:message code="3008"/>', width: '10%', align: 'center'},
                        {field: 'order_status', title: '<spring:message code="status"/>',width: '10%', sort:true, align: 'center' ,templet:'#orderStatus'},
                        {field: 'is_pay', title: '<spring:message code="paid.statut"/>',width: '8%',  sort:true,align: 'center',templet:'#orderIsPay'},
                        {field: 'coupon_price', title: '<spring:message code="3019"/>',width: '8%',  align: 'center'},
                        {field: 'goods_price', title: '<spring:message code="2026"/>', width: '10%', align: 'center'},
                        {field: 'goods_count', title: '<spring:message code="2035"/>', width: '10%', align: 'center'},
                        {field: 'order_total', title: '<spring:message code="2018"/>',width: '10%',  align: 'center'},
                        {field: 'order_price', title: '<spring:message code="3015"/>',width: '10%',  align: 'center'},
                        {field: 'c_time', title: '<spring:message code="time"/>', width: '12%',sort:true, align: 'center'},
                        {fixed: 'right', title: "<spring:message code='opt' />", width: '25%', align: 'center', toolbar: '#barDemo'}                  
                ]
            ],
            done: function (res, curr, count) {

            }
        });
        
        // ===============监听工具条===================
        table.on('tool(mTable)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
        	var data = obj.data; // 获得当前行数据
            var layEvent = obj.event; // 获得 lay-event 对应的值
            var tr = obj.tr; // 获得当前行 tr 的DOM对象
            var where=null;
           if(layEvent == 'ems'){
        	   var isOk=false;
      			
        	   if(data.order_status!="${OrderStatusEnum.UNSHIPPED.getValue()}"){
        		   isOk=true;
        	   }
        	
            	if(isOk){
            	
            		layer.confirm("<spring:message code='3024' />",{
          			  btn: ["<spring:message code='submit' />"] //按钮
          			  ,title:"<spring:message code="warning"/>"
          			}, function(index){
          				 openEms(data);
          				layer.close(index);
          			});
            	}else{
            		 openEms(data);
            	}
        	   
        	   
            }else if(layEvent == 'address'){
            	
              	 layer.open({
                     title: "<spring:message code='modify' />"//弹框标题
                     , content:$('.address-box')//也可以是一个html
                     , area: ['700', '300']
     		         ,closeBtn: 1
     		         ,shadeClose:true
     		         ,type: 1
     		      	,shade: 0 
     		     	,success:function(layero,index){
	  	   		       	form.val('address-form',data);
	  	   		 	    form.render(null,'address-form');
             		}
                 });
            	 
            }else if(layEvent == 'details'){
            	openDialog('form','.details',data);
            }
            
          
        });

        function openEms(data){
    		layer.open({
                  title: "<spring:message code='modify' />"//弹框标题
                  , content:$('.ems-box')//也可以是一个html
                  , area: ['700', '300']
  		         ,closeBtn: 1
  		         ,shadeClose:true
  		         ,type: 1
  		      	,shade: 0 
  		     	,success:function(layero,index){
	  	   		       	form.val('ems-form',data);
	  	   		 	    form.render(null,'ems-form');
          		}
              });
        }

        function openDialog(formName,formHtml,data){
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

        /*异常信息*/
        function showMessage(msg) {
            if(msg!=''){
                layer.msg(msg);
            }

        }

        //工具栏事件
        table.on('toolbar(mTable)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    // var data = JSON.stringify(data);
                    console.log(JSON.stringify(data));
                    layer.open({
                        type: 1
                        ,content:
							'<div style="text-align: left;margin-left:100px;">'
							+'<p>' + '<span>' +'id:' +'</span>' + JSON.stringify(data[0].id) + '</span>' +'</p>'
                            +'<p>' + '<span>' +'订单号:' +'</span>' + JSON.stringify(data[0].order_num) +'</p>'
                            +'<p>' +'<span>' +'收件人姓名:' +'</span>' + JSON.stringify(data[0].order_name) +'</p>'
                            +'<p>' +'<span>' +'收件人地址:' +'</span>' + JSON.stringify(data[0].order_address) +'</p>'
                            +'</div>'
						,title :'打印发票'
						,area: ['500px', '300px']
						,offset: 'auto'
                        ,btn: ['打印']
                        ,yes: function(index, layero) {
                            //按钮【按钮一】的回调
                            // console.log(JSON.stringify(data));
                            // console.log( JSON.stringify(data[0].order_address));
                            // printorderlist();
                            // function printorderlist() {
                            //     var html_page = JSON.stringify(data[0].order_address);
                            //     console.log(html_page);
                            //     $("#print_content").html(html_page);
                            //     $("#print_content").print();
                            // window.print();
                            // }
							console.log(data[0] )
                            console.log(JSON.stringify(data[0].order_num))
                            console.log(data[0].goods_num )
                            // console.log()
                            // console.log()
							var html_page = "";
                            var html_page_tipsv1 = "";
                            html_page_tipsv1 += "<\/br>";
                            html_page_tipsv1 += "<div class=\"clear pd-15\" style=\"page-break-after: always;font-size: 12px;width: 90%;margin-left: 50px\">";
                            html_page_tipsv1 += "<p style=\"font-size: 15px\" >";
                            html_page_tipsv1 += "INVOICE (發票)";
                            html_page_tipsv1 += "<img src='/resources/img/index/log1.jpg' width='100px' height='50px' style=';padding-left: 30%;'>";
                            html_page_tipsv1 += "<\/p>";
                            html_page_tipsv1 += "<div class=\"clear full-w mt-15 f-12\" style=\"font-size: 12px;width: 100%\">";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">INVOICE NUMBER (發票號碼)<\/span>";
                            html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600;padding-left: 100px\">DATE OF ISSUE 發票日期<\/span>";
                            html_page_tipsv1 += "    <\/div>";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            // 发票号码
                            html_page_tipsv1 += "        <span  >INV" + data[0].order_address + "<\/span>";
                            // 发票打印时间
                            html_page_tipsv1 += "        <span  style=\"padding-left: 145px\">" + data[0].c_time + "(yyyy-mm-dd)<\/span>";
                            html_page_tipsv1 += "    <\/div>";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">ORDER NUMBER (訂單號)<\/span>";
                            html_page_tipsv1 += "    <\/div>";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            // 订单号
                            html_page_tipsv1 += "        <span  >PO" + data[0].order_num + "<\/span>";
                            html_page_tipsv1 += "    <\/div>";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">DELIVERY NOTE NUMBER (送貨單號碼)<\/span>";
                            html_page_tipsv1 += "    <\/div>";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            //送货单号码
                            html_page_tipsv1 += "        <span  >DN" + data[0].ems_num + "<\/span>";
                            html_page_tipsv1 += "    <\/div><\/br>";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">BILLED TO (發票地址)<\/span>";
                            html_page_tipsv1 += "    <\/div>";
                            html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">Client Name(姓名)<\/span>";
                            //收货人姓名
                            html_page_tipsv1 += "        <span  style=\"padding-left: 164px\">" + data[0].order_name + "<\/span>";
                            html_page_tipsv1 += "    <\/div>";
                            //收货人地址
                            html_page_tipsv1 += SplitAddress(data[0].order_address)
                            html_page_tipsv1 += "<\/div></br>";
                            /*定义第一段需要拼接的html结束*/
                            /*定义第二段需要拼接的html内容*/
                            var html_page_tipsv2 = "";
                            html_page_tipsv2 += "<div class=\"clear full-w  \">";
                            html_page_tipsv2 += "   <table  cellspacing=\"0\" cellpadding=\"0\" style=\"font-size: 10px;\" >";
                            html_page_tipsv2 += "   <tr  >";
                            html_page_tipsv2 += "   <td  align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D\" ><span style=\"margin-right: 15px\" >No.<\/span><\/td>";
                            html_page_tipsv2 += "   <td align=\"center\" style=\"color: #807C7D;border-bottom:1px solid #807C7D\" ><span style=\"margin-left: 15px;\">DESCRIPTION<\/span><\/br ><span style=\"margin-left: 15px;\">商品名<\/span><\/td>";
                            html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D;\"><span style=\"margin-left: 35px;\" >UNIT PRICE<\/span><\/br ><span style=\"margin-left: 35px;\">原單價(HKD)<\/span><\/td>";
                            html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D; \"><span style=\"margin-left: 40px\" >QTY<\/span><\/br ><span style=\"margin-left: 40px;\">數量<\/span><\/td>";
                            html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D;\"><span style=\"margin-left: 35px\" >UNIT PRICE<\/span><\/br ><span style=\"margin-left: 35px;\">優惠單價(HKD)<\/span><\/td>";
                            html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D;\"><span style=\"margin-left: 35px\">AMOUNT<\/span><\/br ><span style=\"margin-left: 35px;\">實付金額(HKD)<\/span><\/td>";
                            html_page_tipsv2 += "    <\/tr>";
                            /*定义第二段内部需要拼接的html内容*/
                            html_page_tipsv2 += "   <tr>";
                            html_page_tipsv2 +=
								"   <td align=\"center\"><span class=\" col-black\" style=\"height:30px;color: #807C7D;margin-right: 15px\">" +data[0].id + "<\/span><\/td>";
                            //定义商品名称
                            var goods_pattern = "";
                            if (data[0].goods_pattern  == 'HC3A250'){
                                goods_pattern = "悉心心電儀"
                            } else if (data[0].goods_pattern == 'ECGRPT-DR01A'){
                                goods_pattern = "醫生審核監測報告";
                            } else if (data[0].goods_pattern  == 'XIXIN-ECGBELL'){
                                goods_pattern = "悉心鈴雙重警報服務";
                            } else if (data[0].goods_pattern  == '24SC'){
                                goods_pattern = "人工报告";
                            } else if (data[0].goods_pattern  == 'BISA-ECGUARD') {
                                goods_pattern = "遠程心電監測解決方案";
                            } else {
                                goods_pattern = "数据错误";
                            }
                            //定义商品名称
                            html_page_tipsv2 += "   <td  style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"col-black\" style=\"margin-left: 15px;\">" + goods_pattern + "<\/span><\/td>";
                            html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\"  style=\"margin-left: 35px;\">" + data[0].goods_price + "</span><\/td>";
                            html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\"  style=\"margin-left: 40px\">" + data[0].goods_count + "</span><\/td>";
                            html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\" style=\"margin-left: 35px\">" + data[0].coupon_price + "</span><\/td>";
                            html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\" style=\"margin-left: 35px\">" + data[0].order_price + "</span><\/td>";
                            html_page_tipsv2 += "    <\/tr>";
                            /*定义第二段需要拼接的html内容结束*/
                            html_page_tipsv2 += "   <tr>";
                            html_page_tipsv2 += "   <td align=\"center\" colspan=\"2\" ><span class=\" col-black\">FREIGHT(運費): <\/span><span style=\"font-size: 10px\"> HK$<\/span>" + data[0].coupon_price + "<\/td>";
                            html_page_tipsv2 += "   <td align=\"right\" colspan=\"4\"><span class=\" col-black\">TOTAL AMOUNT(實付總金額): <\/span><span style=\"font-size: 10px\">HK$<\/span>" + data[0].order_total + "<\/td>";
                            html_page_tipsv2 += "    <\/tr>";
                            html_page_tipsv2 += "    <\/table>";
                            html_page_tipsv2 += "<\/div><\/br><\/br><\/br>";
                            /*定义第二段需要拼接的html内容结束*/
                            /*定义第三段需要拼接的html*/
                            // 定义支付方式
                            var pay_type = "";
                            if (data[0].pay_type == 0) {
                                pay_type = "微信"
                            } else if (data[0].pay_type == 1) {
                                pay_type = "支付宝";
                            } else if (data[0].pay_type == 2) {
                                pay_type = "VISA";
                            } else if (data[0].pay_type == 3) {
                                pay_type = "万事达卡";
                            } else if (data[0].pay_type == 4) {
                                pay_type = "银联";
                            } else {
                                pay_type = "数据错误";
                            }
                            // 定义支付方式
                            var html_page_tipsv3 = "";
                            html_page_tipsv3 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            html_page_tipsv3 += "        <span  style=\"color: #807C7D;font-weight: 600\">TERMS(付款方式)<\/span>";
                            html_page_tipsv3 += "    <\/div>";
                            html_page_tipsv3 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                            html_page_tipsv3 += "        <span  >" + pay_type + "<\/span>";
                            html_page_tipsv3 += "    <\/div></br>";
                            html_page_tipsv3 += "<div style=\"font-size: 12px;\">";
                            html_page_tipsv3 += "<span  style=\"color:blue;font-weight: 600\">THANK YOU FOR BUYING BISA HEALTHY PRODUCTS. THIS ORDER IS SUBJECT TO ALL TERMS AND CONDITIONS DISPLAYED AT：https://www.bisahealth.com<\/span><\/br>";
                            html_page_tipsv3 += "(感謝您購買碧沙健康的產品，本訂單受以下顯示的所有條款和條件之制約：https://www.bisahealth.com)";
                            html_page_tipsv3 += "<\/div>";
                            html_page_tipsv3 += "<\/div>";
                            /*定义第三段需要拼接的html结束*/
                            html_page = html_page + html_page_tipsv1 + html_page_tipsv2 + html_page_tipsv3;
                            $("#print_content").html(html_page);
                            $("#print_content").removeClass("dis-n");
                            bdhtml=window.document.body.innerHTML;
                            sprnstr="<!--startprint-->";
                            eprnstr="<!--endprint-->";
                            prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr));
                            prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
                            window.document.body.innerHTML=prnhtml;
                            window.print();
                            layer.close(index);
                        }
                                // for (i = 0; i < page_length; i++) {
                                //     /*定义第一段需要拼接的html*/

                                // }
                                /*把拼接好的html内容插入页面进行打印*/
                                // $("#print_content").html(html_page);
                                // $("#print_content").print();
                            // };
                            /*打印结束关闭loading层*/
                            // layer.close(index);

                        // ,btn2: function(index, layero){
                        //     //按钮【按钮二】的回调
						//
                        //     //return false 开启该代码可禁止点击该按钮关闭
                        // }
                        ,cancel: function(){
                            //右上角关闭回调

                            //return false 开启该代码可禁止点击该按钮关闭
                        }
                    });

                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选')
                    break;
            };
        });


        var $ = layui.$,
            active1 = {
                getinvoiceData: function () {
                    /*获取选中的id*/
                    var checkStatus = table.checkStatus('mTable');
                    var data = checkStatus.data;

                    /*判断data的数量是否为0*/
                    if (data.length == 0) {
                        layer.alert('请先选择需要打印发票的订单。', {
                            icon: 6,
                            title: '打印发票提示'
                        })
                    } else {
                        var jsonprintid = [];
                        var manifest_box_content = "";
                        for (var i = 0; i < data.length; i++) {
                            jsonprintid.push(data[i].id);
                            /*把订单添加到相应位置*/
                            manifest_box_content += "<p class=\"clear h-40 line-h-40 col-red\">";
                            manifest_box_content += data[i].order_no;
                            manifest_box_content += "<\/p>";
                        }
                        $(".manifest_box").html(manifest_box_content);
                        layer.open({
                            type: 1,
                            title: "打印发票",
                            area: ['560px', '500px'], //宽高
                            btn: ['打印', '取消'],
                            btn1: function (index, layero) {
                                /*开启加载loading层*/
                                var index = layer.load(1);
                                var orderlist_data = null;
                                /*在这里进行ajax调用返回json数据*/
                                $.ajax({
                                    url: 'admin/order/getPrintOrderList',
                                    data: {
                                        jsonprintid: jsonprintid
                                    },
                                    type: "POST",
                                    async: false,
                                    success: function (data) {
                                        orderlist_data = data;
                                    }
                                });
                                /*在此处进行打印内容的拼接操作*/
                                printorderlist();
                                function printorderlist() {
                                    var page = orderlist_data;
                                    var page_length = orderlist_data.length;
                                    var html_page = "";
                                    for (i = 0; i < page_length; i++) {
                                        /*定义第一段需要拼接的html*/
                                        var html_page_tipsv1 = "";
                                        html_page_tipsv1 += "<\/br>";
                                        html_page_tipsv1 += "<div class=\"clear pd-15\" style=\"page-break-after: always;font-size: 12px;width: 90%;margin-left: 50px\">";
                                        html_page_tipsv1 += "<p style=\"font-size: 15px\" >";
                                        html_page_tipsv1 += "INVOICE (發票)";
                                        html_page_tipsv1 += "<img src='../../resources/img/index/log1.jpg' width='100px' height='50px' style=';padding-left: 30%;'>";
                                        html_page_tipsv1 += "<\/p>";
                                        html_page_tipsv1 += "<div class=\"clear full-w mt-15 f-12\" style=\"font-size: 12px;width: 100%\">";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">INVOICE NUMBER (發票號碼)<\/span>";
                                        html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600;padding-left: 100px\">DATE OF ISSUE 發票日期<\/span>";
                                        html_page_tipsv1 += "    <\/div>";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        // 发票号码
                                        html_page_tipsv1 += "        <span  >INV" + data[i].发票号码 + "<\/span>";
                                        // 发票打印时间
                                        html_page_tipsv1 += "        <span  style=\"padding-left: 145px\">" + data[i].c_time + "(dd-mm-yyyy)<\/span>";
                                        html_page_tipsv1 += "    <\/div>";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">ORDER NUMBER (訂單號)<\/span>";
                                        html_page_tipsv1 += "    <\/div>";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        // 订单号
                                        html_page_tipsv1 += "        <span  >PO" + data[i].order_num + "<\/span>";
                                        html_page_tipsv1 += "    <\/div>";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">DELIVERY NOTE NUMBER (送貨單號碼)<\/span>";
                                        html_page_tipsv1 += "    <\/div>";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        //送货单号码
                                        html_page_tipsv1 += "        <span  >DN" + data[i].ems_num + "<\/span>";
                                        html_page_tipsv1 += "    <\/div><\/br>";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">BILLED TO (發票地址)<\/span>";
                                        html_page_tipsv1 += "    <\/div>";
                                        html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">Client Name(姓名)<\/span>";
                                        //收货人姓名
                                        html_page_tipsv1 += "        <span  style=\"padding-left: 164px\">" + data[i].order_name + "<\/span>";
                                        html_page_tipsv1 += "    <\/div>";
                                        //收货人地址
                                        html_page_tipsv1 += SplitAddress(data[i].order_address)
                                        html_page_tipsv1 += "<\/div></br>";
                                        /*定义第一段需要拼接的html结束*/
                                        /*定义第二段需要拼接的html内容*/
                                        var html_page_tipsv2 = "";
                                        html_page_tipsv2 += "<div class=\"clear full-w  \">";
                                        html_page_tipsv2 += "   <table  cellspacing=\"0\" cellpadding=\"0\" style=\"font-size: 10px;\" >";
                                        html_page_tipsv2 += "   <tr  >";
                                        html_page_tipsv2 += "   <td  align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D\" ><span style=\"margin-right: 15px\" >No.<\/span><\/td>";
                                        html_page_tipsv2 += "   <td align=\"center\" style=\"color: #807C7D;border-bottom:1px solid #807C7D\" ><span style=\"margin-left: 15px;\">DESCRIPTION<\/span><\/br ><span style=\"margin-left: 15px;\">商品名<\/span><\/td>";
                                        html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D;\"><span style=\"margin-left: 35px;\" >UNIT PRICE<\/span><\/br ><span style=\"margin-left: 35px;\">原單價(HKD)<\/span><\/td>";
                                        html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D; \"><span style=\"margin-left: 40px\" >QTY<\/span><\/br ><span style=\"margin-left: 40px;\">數量<\/span><\/td>";
                                        html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D;\"><span style=\"margin-left: 35px\" >UNIT PRICE<\/span><\/br ><span style=\"margin-left: 35px;\">優惠單價(HKD)<\/span><\/td>";
                                        html_page_tipsv2 += "   <td align=\"center\"  style=\"color: #807C7D;border-bottom:1px solid #807C7D;\"><span style=\"margin-left: 35px\">AMOUNT<\/span><\/br ><span style=\"margin-left: 35px;\">實付金額(HKD)<\/span><\/td>";
                                        html_page_tipsv2 += "    <\/tr>";
                                        /*定义第二段内部需要拼接的html内容*/
                                        html_page_tipsv2 += "   <tr>";
                                        html_page_tipsv2 += "   <td align=\"center\"><span class=\" col-black\" style=\"height:30px;color: #807C7D;margin-right: 15px\">" + (i + 1) + "<\/span><\/td>";
                                        //定义商品名称
                                        var goods_pattern = "";
                                        if (data[i].goods_pattern == "HC3A250") {
                                            pay_type = "悉心心電儀"
                                        } else if (data[i].goods_pattern == "ECGRPT-DR01A") {
                                            goods_pattern = "醫生審核監測報告";
                                        } else if (data[i].goods_pattern == "XIXIN-ECGBELL") {
                                            goods_pattern = "悉心鈴雙重警報服務";
                                        } else if (data[i].goods_pattern == "BISA-ECGUARD") {
                                            goods_pattern = "遠程心電監測解決方案";
                                        } else {
                                            goods_pattern = "数据错误";
                                        }
                                        //定义商品名称
                                        html_page_tipsv2 += "   <td  style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"col-black\" style=\"margin-left: 15px;\">" + goods_pattern + "<\/span><\/td>";
                                        html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\"  style=\"margin-left: 35px;\">" + data[i].goods_price + "</span><\/td>";
                                        html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\"  style=\"margin-left: 40px\">" + data[i].goods_count + "</span><\/td>";
                                        html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\" style=\"margin-left: 35px\">" + data[i].coupon_price + "</span><\/td>";
                                        html_page_tipsv2 += "   <td  align=\"center\" style=\"border-bottom:0.5px solid #807C7D;height:30px\"><span class=\"f-12 col-black\" style=\"margin-left: 35px\">" + data[i].order_price + "</span><\/td>";
                                        html_page_tipsv2 += "    <\/tr>";
                                        /*定义第二段需要拼接的html内容结束*/
                                        html_page_tipsv2 += "   <tr>";
                                        html_page_tipsv2 += "   <td align=\"center\" colspan=\"2\" ><span class=\" col-black\">FREIGHT(運費): <\/span><span style=\"font-size: 10px\"> HK$<\/span>" + data[i].coupon_price + "<\/td>";
                                        html_page_tipsv2 += "   <td align=\"right\" colspan=\"4\"><span class=\" col-black\">TOTAL AMOUNT(實付總金額): <\/span><span style=\"font-size: 10px\">HK$<\/span>" + data[i].order_total + "<\/td>";
                                        html_page_tipsv2 += "    <\/tr>";
                                        html_page_tipsv2 += "    <\/table>";
                                        html_page_tipsv2 += "<\/div><\/br><\/br><\/br>";
                                        /*定义第二段需要拼接的html内容结束*/
                                        /*定义第三段需要拼接的html*/
                                        // 定义支付方式
                                        var pay_type = "";
                                        if (data[i].pay_type == 0) {
                                            pay_type = "微信"
                                        } else if (data[i].pay_type == 1) {
                                            pay_type = "支付宝";
                                        } else if (data[i].pay_type == 2) {
                                            pay_type = "VISA";
                                        } else if (data[i].pay_type == 3) {
                                            pay_type = "万事达卡";
                                        } else if (data[i].pay_type == 4) {
                                            pay_type = "银联";
                                        } else {
                                            pay_type = "数据错误";
                                        }
                                        // 定义支付方式
                                        var html_page_tipsv3 = "";
                                        html_page_tipsv3 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        html_page_tipsv3 += "        <span  style=\"color: #807C7D;font-weight: 600\">TERMS(付款方式)<\/span>";
                                        html_page_tipsv3 += "    <\/div>";
                                        html_page_tipsv3 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                                        html_page_tipsv3 += "        <span  >" + pay_type + "<\/span>";
                                        html_page_tipsv3 += "    <\/div></br>";
                                        html_page_tipsv3 += "<div style=\"font-size: 12px;\">";
                                        html_page_tipsv3 += "<span  style=\"color:blue;font-weight: 600\">THANK YOU FOR BUYING BISA HEALTHY PRODUCTS. THIS ORDER IS SUBJECT TO ALL TERMS AND CONDITIONS DISPLAYED AT：https://www.bisahealth.com<\/span><\/br>";
                                        html_page_tipsv3 += "(感謝您購買碧沙健康的產品，本訂單受以下顯示的所有條款和條件之制約：https://www.bisahealth.com)";
                                        html_page_tipsv3 += "<\/div>";
                                        html_page_tipsv3 += "<\/div>";
                                        /*定义第三段需要拼接的html结束*/
                                        html_page = html_page + html_page_tipsv1 + html_page_tipsv2 + html_page_tipsv3;
                                    }
                                    /*把拼接好的html内容插入页面进行打印*/
                                    $("#print_content").html(html_page);
                                    $("#print_content").print();
                                };
                                /*打印结束关闭loading层*/
                                layer.close(index);
                            },
                            content: $('.sureprint'),
                        });
                    }
                }
            };

        //拆分地址
        function SplitAddress(data) {
            var addres = data.trim().split(" ");
            if (data != null || data != "") {
                var html_page_tipsv1 = "";
                var html_page_tipsv2 = "";
                html_page_tipsv1 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%'>";
                html_page_tipsv1 += "        <span  style=\"color: #807C7D;font-weight: 600\">Client Address(地址)<\/span>";
                html_page_tipsv1 += "        <span  style=\"padding-left: 152px\">"
                html_page_tipsv2 += "    <div class=\"clear  line-h-20 col-black\" style='width: 100%;padding-left: 275px'>";
                html_page_tipsv2 += "        <span >";
                for (var i = 0; i < addres.length; i++) {
                    if (i < 3) {
                        if (addres[i] != null || addres[i] != "") {
                            html_page_tipsv1 += addres[i] + " ";
                        }
                    } else {
                        if (addres[i] != null || addres[i] != "") {

                            html_page_tipsv2 += addres[i] + " ";
                        }
                    }
                }
                html_page_tipsv1 += "   <\/span> <\/div>";
                html_page_tipsv2 += " <\/span>   <\/div>";
                return html_page_tipsv1 + html_page_tipsv2;
            } else {
                return "";
            }
        }
    });

    
    </script>
</body>
</html>