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
    <title>修改系统设置</title>
    <!-- base -->
    <link href="resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="resources/css/comm/base.css" rel="stylesheet">
    <link href="resources/css/admin/HK_Admin.css" rel="stylesheet">

    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

</head>

<body class="layui-layout-body">
<div class="layui-layout">
    <!-- 左侧导航区域 -->
    <%@ include file="leftmenu.jsp" %>
    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div style="padding: 30px 50px;">
            <p class="f-18 pt-15 pb-15 col-8d969d">
             修改系统设置
            </p>
            <form class="layui-form" action="">
                <input type="hidden" name="id" value="">
                <div class="clear pd-15 bg-fafafa bor bor-col-e8ebf2">
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司简体地址：</label>
                        <div class="layui-input-inline" style="width: 450PX;">
                            <input type="text" name="company_address_CN"  lay-verify="required" autocomplete="off"
                                   placeholder="请输入公司地址" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司繁体地址：</label>
                        <div class="layui-input-inline" style="width: 450PX;">
                            <input type="text" name="company_address_HK"  lay-verify="required" autocomplete="off"
                                   placeholder="请输入公司地址" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司英文地址：</label>
                        <div class="layui-input-inline" style="width:70%;">
                            <input type="text" name="company_address_US"  lay-verify="required" autocomplete="off"
                                   placeholder="请输入公司地址" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司域名：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="company_domain"  lay-verify="required"
                                   placeholder="请输入公司域名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司logo：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="company_logo_url"  lay-verify="required" placeholder="请输入公司logo"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司电话：</label>
                        <div class="layui-input-inline">
                            <input type="text" name="company_phone"  lay-verify="required" placeholder="请输入公司电话"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司简体名字：</label>
                        <div class="layui-input-inline" style="width: 450PX;">
                            <input type="text" name="company_name_CN"  lay-verify="required" placeholder="请输入公司名称"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司繁体名字：</label>
                        <div class="layui-input-inline" style="width: 450PX;">
                            <input type="text" name="company_name_HK"  lay-verify="required" placeholder="请输入公司名称"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label pt-10 pb-10 pl-0 pr-0 col-black" style="width: 150px;">公司英文名字：</label>
                        <div class="layui-input-inline" style="width: 450PX;">
                            <input type="text" name="company_name_US"  lay-verify="required" placeholder="请输入公司名称"
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>

                </div>
            </form>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input name="id" type="hidden" value="" />
                    <button class="layui-btn" lay-submit="" lay-filter="demo1" id="demo1">立即提交</button>
                </div>
            </div>
        </div>
    </div>

    <script src="resources/js/comm/jquery.min.js"></script>
    <script src="resources/ctrl/layui/layui.js"></script>
</body>
<script>
    $(document).ready(function () {

        $.ajax({
            url: 'admin/SelectCompanyInfo',
            type: "POST",
            success: function (data) {
                $('input[name="company_address_CN"]').val(data.company_address_CN);
                $('input[name="company_address_HK"]').val(data.company_address_HK);
                $('input[name="company_address_US"]').val(data.company_address_US);
                $('input[name="company_domain"]').val(data.company_domain);
                $('input[name="company_logo_url"]').val(data.company_logo_url);
                $('input[name="company_name_CN"]').val(data.company_name_CN);
                $('input[name="company_name_HK"]').val(data.company_name_HK);
                $('input[name="company_name_US"]').val(data.company_name_US);
                $('input[name="company_phone"]').val(data.company_phone);
                $('input[name="id"]').val(data.id);

            }
        });
  $('#demo1').click(function () {
      var company_address_CN=$('input[name="company_address_CN"]').val();
      var company_address_HK=$('input[name="company_address_HK"]').val();
      var company_address_US=$('input[name="company_address_US"]').val();
      var company_domain=$('input[name="company_domain"]').val();
      var company_logo_url=$('input[name="company_logo_url"]').val();
      var company_name_CN=$('input[name="company_name_CN"]').val();
      var company_name_HK=$('input[name="company_name_HK"]').val();
      var company_name_US=$('input[name="company_name_US"]').val();
      var company_phone=$('input[name="company_phone"]').val();
      var id=$('input[name="id"]').val();
      var update_time = new Date();
      $.ajax({
          url: 'admin/UpCompanyInfo',
          type: "POST",
          contentType:"application/json",
          data: JSON.stringify({
              company_address_CN:company_address_CN,
              company_address_HK:company_address_HK,
              company_address_US:company_address_US,
              company_domain: company_domain,
              company_logo_url:company_logo_url,
              company_name_CN: company_name_CN,
              company_name_HK:company_name_HK,
              company_name_US:company_name_US,
              company_phone: company_phone,
              id: id,
              update_time: update_time
          }),
          success: function (data) {
                alert("修改成功");
          }
      });
  })

    })

</script>
</html>