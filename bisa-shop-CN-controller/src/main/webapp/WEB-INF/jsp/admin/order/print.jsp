<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.bisa.health.shop.entity.SysStatusCode" %>
<%@ page import="com.bisa.health.shop.enumerate.GoodsTypeEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.OrderStatusEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.PayEnum" %>
<%@ page import="com.bisa.health.shop.enumerate.CouponEnum" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon/favicon.ico"
          type="image/x-icon"/>
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- necessary -->
    <title><spring:message code="admin.domain"/></title>
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

        @page { margin: 30px 0 0 0 ; }
    </style>


</head>

<body class="layui-layout-body">
<div id="print_content" class="pos-r">
    <div class="clear pd-15" style="page-break-after: always; font-size: 12px; width: 90%; margin-left: 50px">
        <p class="text-center mb-30">碧沙康健_订单详情</p>
        <span style="font-size: 15px">INVOICE (發票)</span>
        <img src="/resources/img/index/log1.jpg" width="100" height="50" style="margin-left: 30%;">

        <div class="clear full-w mt-15 f-12" style="font-size: 12px; width: 100%">
            <div class="clear  line-h-20 col-black" style="width: 100%">
                <span style="color: #807C7D; font-weight: 600">INVOICENUMBER (發票號碼)</span>
                <span style="color: #807C7D; font-weight: 600; padding-left: 100px">DATEOF ISSUE 發票日期</span>
            </div>
            <div class="clear  line-h-20 col-black" style="width: 100%">
                <span>INV</span>
                <span style="padding-left: 180px">${order.c_time}(yyyy-mm-dd)</span>
            </div>
            <div class="clear  line-h-20 col-black" style="width: 100%">
                <span style="color: #807C7D; font-weight: 600">ORDER NUMBER(訂單號)</span>
            </div>
            <div class="clear  line-h-20 col-black" style="width: 100%">
                <span>PO${order.order_num}</span>
            </div>
            <div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">DELIVERY NOTENUMBER (送貨單號碼)</span>
            </div>
            <div class="clear  line-h-20 col-black" style="width: 100%">
                <span>DN${order.ems_num}</span>
            </div>
            <br>
            <div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">BILLED TO(發票地址)</span>
            </div>
            <div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">Client
						Name(姓名)</span> <span style="padding-left: 164px">${order.order_name}</span>
            </div>
            <div class="clear  line-h-20 col-black" style="width: 100%">
					<span style="color: #807C7D; font-weight: 600">Client
						Address(地址)</span> <span style="padding-left: 152px">${order.order_address} </span>
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
                        <span style="margin-left: 35px;">優惠价格(HKD)</span></td>
                    <td align="center"
                        style="color: #807C7D; border-bottom: 1px solid #807C7D;"><span
                            style="margin-left: 35px">AMOUNT</span><br>
                        <span style="margin-left: 35px;">實付金額(HKD)</span></td>
                </tr>
                <tr>
                    <td align="center">
                        <span class=" col-black" style="height: 30px; color: #807C7D; margin-right: 15px">1</span>
                    </td>
                    <td style="border-bottom: 0.5px solid #807C7D; height: 30px">
                        <span class="col-black" style="margin-left: 15px;" id="goods_pattern"></span>
                    </td>
                    <td align="center" style="border-bottom: 0.5px solid #807C7D; height: 30px">
                        <span class="f-12 col-black" style="margin-left: 35px;">${order.goods_price}</span>
                    </td>
                    <td align="center" style="border-bottom: 0.5px solid #807C7D; height: 30px">
                        <span class="f-12 col-black" style="margin-left: 40px">${order.goods_count}</span>
                    </td>
                    <td align="center" style="border-bottom: 0.5px solid #807C7D; height: 30px">
                        <span class="f-12 col-black" style="margin-left: 35px">${order.coupon_price}</span>
                    </td>
                    <td align="center" style="border-bottom: 0.5px solid #807C7D; height: 30px">
                        <span class="f-12 col-black" style="margin-left: 35px">${order.order_price}</span>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <span class=" col-black">FREIGHT(運費):</span>
                        <span style="font-size: 10px"> HK$</span>
                        ${order.coupon_price}
                    </td>
                    <td align="right" colspan="4">
                        <span class=" col-black">TOTALAMOUNT(實付總金額): </span>
                        <span style="font-size: 10px">HK$</span>
                        ${order.order_total}
                    </td>
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
            <span id="pay_type"> ${order.order_total}</span>
        </div>
        <br>
        <div style="font-size: 12px;">
				<span style="color: blue; font-weight: 600">THANK YOU FOR
					BUYING BISA HEALTHY PRODUCTS. THIS ORDER IS SUBJECT TO ALL TERMS
					AND CONDITIONS DISPLAYED AT：https://www.bisahealth.com</span><br>(感謝您購買碧沙健康的產品，本訂單受以下顯示的所有條款和條件之制約：https://www.bisahealth.com)
        </div>
    </div>
    <button id="opt-print" class="pos-a cur-p" style="width: 150px;height: 40px;color: #fff;background: deepskyblue;border: 0;text-align:
    center;top: 10%;right: 5%;">打印</button>
</div>

</body>
<script>
    $(document).ready(function(){
        function print(){
            var pay_type = ${order.pay_type};
            if (pay_type == 0) {
                pay_type = "微信";
            } else if (pay_type == 1) {
                pay_type = "支付宝";
            } else if (pay_type == 2) {
                pay_type = "VISA";
            } else if (pay_type == 3) {
                pay_type = "万事达卡";
            } else if (pay_type == 4) {
                pay_type = "银联";
            } else {
                pay_type = "数据错误";
            }
            $('#pay_type').text(pay_type);
            var goods_pattern = "${order.goods_pattern}";
            if (goods_pattern  == 'HC3A250'){
                goods_pattern = "悉心心電儀"
            } else if (goods_pattern == 'ECGRPT-DR01A'){
                goods_pattern = "醫生審核監測報告";
            } else if (goods_pattern  == 'XIXIN-ECGBELL'){
                goods_pattern = "悉心鈴雙重警報服務";
            } else if (goods_pattern  == '24SC'){
                goods_pattern = "人工报告";
            } else if (goods_pattern  == 'BISA-ECGUARD') {
                goods_pattern = "遠程心電監測解決方案";
            } else {
                goods_pattern = "数据错误";
            }
            $('#goods_pattern').text(goods_pattern);
        }
        print();
        $('#opt-print').click(function () {
            var _self = $(this);
            _self.hide();

            setTimeout(function () {
                _self.show();
            }, 4000);

            window.print();
        });
    })
</script>
</html>