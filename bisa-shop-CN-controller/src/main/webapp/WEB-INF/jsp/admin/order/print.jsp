<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode"%>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum"%>
<%@ page import="com.bisa.health.shop.enumerate.OrderStatusEnum"%>
<%@ page import="com.bisa.health.shop.enumerate.PayEnum"%>
<%@ page import="com.bisa.health.shop.enumerate.CouponEnum"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<link rel="icon" href="/favicon/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon/favicon.ico"
	type="image/x-icon" />
<link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- necessary -->
<title><spring:message code="admin.domain" /></title>
<meta name="keywords" content="<spring:message code="admin.keyword"/>">
<meta name="description"
	content="<spring:message code="admin.description"/>">
<!-- description -->
<meta name="renderer" content="webkit">
<!-- base -->
<link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
<link href="/resources/css/comm/base.css" rel="stylesheet">
<link href="/resources/css/admin/style.css" rel="stylesheet">
<script src="/resources/js/comm/jquery.min.js"></script>
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.layui-form-label {
	width: 110px !important;
}
</style>

</head>

<body class="layui-layout-body">
	<button id="opt-print">打印</button>
	<div id="print_content">
		<br>
		<div class="clear pd-15"
			style="page-break-after: always; font-size: 12px; width: 90%; margin-left: 50px">
			<p style="font-size: 15px">
				INVOICE (發票)<img src="/resources/img/index/log1.jpg" width="100px"
					height="50px" style="padding-left: 30%;">
			</p>
			<div class="clear full-w mt-15 f-12"
				style="font-size: 12px; width: 100%">
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">INVOICE
						NUMBER (發票號碼)</span> <span
						style="color: #807C7D; font-weight: 600; padding-left: 100px">DATE
						OF ISSUE 發票日期</span>
				</div>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span>INV香港test</span> <span style="padding-left: 145px">2020-01-06
						22:16:45(yyyy-mm-dd)</span>
				</div>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">ORDER NUMBER
						(訂單號)</span>
				</div>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span>PO200106220527679OgZ</span>
				</div>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">DELIVERY NOTE
						NUMBER (送貨單號碼)</span>
				</div>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span>DNnull</span>
				</div>
				<br>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">BILLED TO
						(發票地址)</span>
				</div>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">Client
						Name(姓名)</span> <span style="padding-left: 164px">jak</span>
				</div>
				<div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">Client
						Address(地址)</span> <span style="padding-left: 152px">香港test </span>
				</div>
				<div class="clear  line-h-20 col-black"
					style="width: 100%; padding-left: 275px">
					<span> </span>
				</div>
			</div>
			<br>
			<div class="clear full-w  ">
				<table cellspacing="0" cellpadding="0" style="font-size: 10px;">
					<tbody>
						<tr>
							<td align="center"
								style="color: #807C7D; border-bottom: 1px solid #807C7D"><span
								style="margin-right: 15px">No.</span></td>
							<td align="center"
								style="color: #807C7D; border-bottom: 1px solid #807C7D"><span
								style="margin-left: 15px;">DESCRIPTION</span><br>
							<span style="margin-left: 15px;">商品名</span></td>
							<td align="center"
								style="color: #807C7D; border-bottom: 1px solid #807C7D;"><span
								style="margin-left: 35px;">UNIT PRICE</span><br>
							<span style="margin-left: 35px;">原單價(HKD)</span></td>
							<td align="center"
								style="color: #807C7D; border-bottom: 1px solid #807C7D;"><span
								style="margin-left: 40px">QTY</span><br>
							<span style="margin-left: 40px;">數量</span></td>
							<td align="center"
								style="color: #807C7D; border-bottom: 1px solid #807C7D;"><span
								style="margin-left: 35px">UNIT PRICE</span><br>
							<span style="margin-left: 35px;">優惠單價(HKD)</span></td>
							<td align="center"
								style="color: #807C7D; border-bottom: 1px solid #807C7D;"><span
								style="margin-left: 35px">AMOUNT</span><br>
							<span style="margin-left: 35px;">實付金額(HKD)</span></td>
						</tr>
						<tr>
							<td align="center"><span class=" col-black"
								style="height: 30px; color: #807C7D; margin-right: 15px">2</span></td>
							<td style="border-bottom: 0.5px solid #807C7D; height: 30px"><span
								class="col-black" style="margin-left: 15px;">数据错误</span></td>
							<td align="center"
								style="border-bottom: 0.5px solid #807C7D; height: 30px"><span
								class="f-12 col-black" style="margin-left: 35px;">1</span></td>
							<td align="center"
								style="border-bottom: 0.5px solid #807C7D; height: 30px"><span
								class="f-12 col-black" style="margin-left: 40px">1</span></td>
							<td align="center"
								style="border-bottom: 0.5px solid #807C7D; height: 30px"><span
								class="f-12 col-black" style="margin-left: 35px">0</span></td>
							<td align="center"
								style="border-bottom: 0.5px solid #807C7D; height: 30px"><span
								class="f-12 col-black" style="margin-left: 35px">51</span></td>
						</tr>
						<tr>
							<td align="center" colspan="2"><span class=" col-black">FREIGHT(運費):
							</span><span style="font-size: 10px"> HK$</span>0</td>
							<td align="right" colspan="4"><span class=" col-black">TOTAL
									AMOUNT(實付總金額): </span><span style="font-size: 10px">HK$</span>1</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br>
			<br>
			<br>
			<div class="clear  line-h-20 col-black" style="width: 100%">
				<span style="color: #807C7D; font-weight: 600">TERMS(付款方式)</span>
			</div>
			<div class="clear  line-h-20 col-black" style="width: 100%">
				<span>微信</span>
			</div>
			<br>
			<div style="font-size: 12px;">
				<span style="color: blue; font-weight: 600">THANK YOU FOR
					BUYING BISA HEALTHY PRODUCTS. THIS ORDER IS SUBJECT TO ALL TERMS
					AND CONDITIONS DISPLAYED AT：https://www.bisahealth.com</span><br>(感謝您購買碧沙健康的產品，本訂單受以下顯示的所有條款和條件之制約：https://www.bisahealth.com)
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#opt-print').click(function(){
			var _self=$(this);
			_self.hide();
			
			setTimeout(function(){ _self.show(); }, 4000);
			
			 window.print();
		});
	
	</script>
</body>
</html>