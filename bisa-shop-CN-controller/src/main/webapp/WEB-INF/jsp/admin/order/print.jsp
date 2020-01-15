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
        .col-807c7d{color: #807C7D;font-weight: 600;}
        .bold{font-weight: bold;}
        .border{color:#807C7D; border-bottom: 1px solid #807C7D;width: 15%;}
        .borderTwo{border-bottom: 0.5px solid #807C7D; height: 30px}
        #opt-print{width: 150px;height: 40px;color: #fff;background: deepskyblue;border: 0;text-align:
                center;top: 8%;right: 5%;}
    </style>
</head>

<body class="layui-layout-body">
<div id="print_content" class="pos-r">
    <div class="clear" style="page-break-after: always; font-size: 12px;padding: 30px 50px 50px 50px;">
        <div align="left" style="margin-top: 10px">
            <img   src="/resources/img/index/log1.jpg" width="100" height="50" >
        </div>
        <div class="clear full-w  f-12" style="font-size: 14px; width: 100%;margin-top: 30px;">

            <div class="dis-ib  pull-left"  style="width: 30%;">
                <div class="clear  line-h-20 col-black">
                    <span class="bold">BILLED TO(付款人)</span>
                </div>
                <div class="clear  line-h-20 col-black  dis-ib mt-40">
                    <span  class="bold">CLIENT NAME(姓名)</span>
                    <br>
                    <span  class="col-807c7d">${order.order_name}</span>
                </div>
                <br>
                <div class="clear  line-h-20 col-black  dis-ib mt-20">
                    <span  class="bold">CLIENT ADDRESS(地址)</span>
                    <br>
                    <span  class="col-807c7d">${order.order_address}</span>
                </div>

            </div>
            <div class="dis-ib  pull-left" style="width: 30%;">
                <div class="clear  line-h-20 col-black text-left dis-ib">
                    <span class="bold">DATE OF ISSUE(發票日期)</span>
                    <br>
                    <span id="c_time"  class="col-807c7d"></span>
                    <span class="col-807c7d">(yyyy-mm-dd)</span>
                </div>
                <br>
                <div class="clear  line-h-20 col-black  dis-ib mt-20">
                    <span  class="bold" >PAYMENT TERMS(付款方式)</span>
                    <br>
                    <span  class="col-807c7d"  id="pay_type"></span>
                </div>
            </div>
            <div class="dis-b  pull-left pl-30" style="width: 40%;">
                <div class="clear  line-h-20 col-black text-left dis-ib">
                    <span class="bold">INVOICE NO(發票號碼)</span>
                    <br>
                    <span class="col-807c7d">INV</span>
                    <span class="col-807c7d" id="pay_id"></span>
                </div>

                <div class="clear  line-h-20 col-black text-left  dis-ib mt-20">
                    <span class="bold"> ORDER NO(訂單號)</span>
                    <br>
                    <span  class="col-807c7d">PO</span>
                    <span  class="col-807c7d">${order.order_num}</span>
                </div>
                <div class="clear  line-h-20 col-black dis-ib mt-20">
                    <span class="bold">DELIVERY NO(送貨單號碼)</span>
                    <br>
                    <span  class="col-807c7d">DN</span>
                    <span  class="col-807c7d">${order.ems_num}</span>
                </div>
            </div>
        </div>
        <div class="clear full-w mt-40">
            <table cellspacing="0" cellpadding="0" class="f-10">
                <tbody>
                <tr>
                    <td align="center" class="border">
                        <span>No.</span></td>
                    <td align="center" class="border">
                        <span>DESCRIPTION</span><br>
                        <span>商品名</span></td>
                    <td align="center" class="border">
                        <span>UNIT PRICE</span><br>
                        <span>原單價(HKD)</span></td>
                    <td align="center" class="border">
                        <span>QTY</span><br>
                        <span>數量</span></td>
                    <td align="center" class="border">
                        <span>UNIT PRICE</span><br>
                        <span>優惠价格(HKD)</span></td>
                    <td align="center" class="border">
                        <span>AMOUNT</span><br>
                        <span>實付金額(HKD)</span></td>
                </tr>
                <tr>
                    <td align="center"  class="borderTwo">
                        <span class="f-12 col-black" style="height: 30px; color: #807C7D;">1</span>
                    </td>
                    <td align="center"  class="borderTwo">
                        <span class="f-12 col-black" id="goods_pattern"></span>
                    </td>
                    <td align="center"  class="borderTwo">
                        <span class="f-12 col-black" id="goods_price"></span>
                    </td>
                    <td align="center"  class="borderTwo">
                        <span class="f-12 col-black">${order.goods_count}</span>
                    </td>
                    <td align="center"  class="borderTwo">
                        <span class="f-12 col-black" id="coupon_price"></span>
                    </td>
                    <td align="center"  class="borderTwo">
                        <span class="f-12 col-black" id="order_price"></span>
                    </td>
                </tr>
                <tr>
                    <td  colspan="2" >
                        <span class=" col-black">FREIGHT(運費):</span>
                        <span class="f-10"> HK$</span>
                        <sapn id="emd_postage"></sapn>
                    </td>
                    <td align="right" colspan="4">
                        <span class=" col-black">TOTAL AMOUNT(實付總金額): </span>
                        <span class="f-10">HK$</span>
                        <sapn class="pr-20" id="order_total"></sapn>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="f-12 mt-20">
            <span style="color: blue; font-weight: 600">THANK YOU FOR BUYING BISA HEALTHY PRODUCTS. THIS ORDER IS SUBJECT TO ALL TERMS
					AND CONDITIONS DISPLAYED AT：https://www.bisahealth.com</span>
            <br>(感謝您購買碧沙健康的產品，本訂單受以下顯示的所有條款和條件之制約：https://www.bisahealth.com)
        </div>
    </div>
    <button id="opt-print" class="pos-a cur-p">打印</button>
</div>

</body>
<script>
    $(document).ready(function(){
        console.log('${order}')
        function print(){
            //定义支付类型
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
            //定义日期格式
            var c_time ='${order.c_time}';
            c_time = c_time.substr(0, 10);
            $('#c_time').text(c_time);
            $('#pay_type').text(pay_type);
            //定义商品名称
            var goods_pattern = '${order.goods_pattern}';
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
        //小数点后面补0函数
        function formatnumber(value, num){
            var _value = value.toString();
            var _dot = _value.indexOf(".");
            var _valueLen  = _value.length;
            if (num == 0) {
                if (_dot != -1) {
                    _value = _value.substring(0, _dot);
                }
            } else {//如果没有小数点
                if (_dot == -1) {
                    _value = _value + ".";
                    for (var i = 1; i <= num; i++) {
                        _value = _value + "0";
                    }
                } else {//有小数点，超出位数自动截取，否则补0
                    _value = _value.substring(0, _dot + num + 1);
                    for (var i = _valueLen; i <= _dot + num; i++) {
                        _value = _value + "0";
                    }
                }
            }
            return _value;
        }
        //数据补0后插入到页面中
        function MakeUpName(){
            var order_total =formatnumber(${order.order_total},2);
            $('#order_total').text(order_total);

            var coupon_price =formatnumber(${order.coupon_price},2);
            $('#coupon_price').text(coupon_price);

            var order_price =formatnumber(${order.order_price},2);
            $('#order_price').text(order_price);

            var goods_price =formatnumber(${order.goods_price},2);
            $('#goods_price').text(goods_price);

            var emd_postage =formatnumber(${order.emd_postage},2);
            $('#emd_postage').text(emd_postage);

            var pay_id ='${order.pay_id}'
            $('#pay_id').text(pay_id.slice(0,18));
        }
        MakeUpName();
        //按钮点击隐藏
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