<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; " />
    <meta charset=utf-8>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <meta name="keywords" content="${html_keyWord}">
    <meta name="description" content="${html_description}">
    <title>${html_title}</title>
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="../resources/css/comm/base.css" rel="stylesheet">
    <link href="../resources/css/about/HK_About.css" rel="stylesheet">
    <link href="../resources/css/index/index.css" rel="stylesheet">
    <script src="../resources/js/comm/jquery.min.js"></script>
</head>
<style>
    .taobao1{
        border-radius: 5px;
        /*position: absolute;*/
        /*left: 22%;*/
        /*top: 75%;*/
        display: inline-block;
        width: 120px;
        height: 36px;
        background:#f40;
        color: #FFFFFF;
        font-size: 22px;
    }
    .jingdong1{
        border-radius: 5px;
        /*position: absolute;*/
        /*left: 30%;*/
        /*top: 75%;*/
        display: inline-block;
        width: 120px;
        height: 36px;
        background:#D71C1E;
        color: #FFFFFF;
        font-size: 22px;
    }
</style>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>

<div class="container-fluid">
    <div class="row mb-40 pos-r"  style="background: url('../resources/img/solution/banner.png') no-repeat;height:
    400px;">
        <div class="col-md-3 col-md-offset-2">
            <div class="row" style="margin-left: 30px;">
                <p class="" style="color:rgba(255,255,255,1);font-size:24px;font-weight:400;margin:40px auto;">医院智慧心电监测技术解决方案</p>
            </div>
            <div class="row" style="margin-left: 30px;">
                <span style="color:rgba(243,242,242,1);font-size:16px;">针对目前医疗机构动态心电监测使用的传统12导联Holter存在的产品价格昂贵、患者佩戴不便、监测易受干扰、仅能存储24小时数据、人工分析劳动量大、器材损耗大等问题，碧沙康健推出了智慧心电监测技术解决方案，实现长时段监测、AI智能分析、网上诊疗和紧急求助等应用，助力AI医用技术的快速发展。</span>
            </div>
            <div class="row pos-a" style="top: 110%;left: 10%;">
                <a  class="text-center taobao1">淘宝商城</a>
                <a class="text-center jingdong1" style="margin-left: 15px;">京东自营</a>
            </div>
        </div>
    </div>
    <p class="title-p">传统方式</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row mb-40">
        <img  class="img-responsive center-block" src="../resources/img/solution/banner2.png" alt="碧沙心电仪四大优势">
    </div>
    <p class="title-p">四大方案</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row mb-40 ">
        <img class="img-responsive center-block" src="../resources/img/solution/banner3.png"
             alt="碧沙心电仪四大优势">
    </div>
    <p class="title-p">方案流程</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row  mb-40 ">
        <img  class="img-responsive center-block" src="../resources/img/solution/banner4.gif" alt="碧沙心电仪方案流程">
    </div>
    <div class="row  mb-40 " >
        <img  class="img-responsive center-block" src="../resources/img/solution/banner5.png" alt="碧沙心电仪方案配置">
    </div>
    <p class="title-p">合作伙伴</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row  mb-40 ">
        <img  class="img-responsive center-block" src="../resources/img/solution/banner6.png" alt="碧沙心电仪合作伙伴">
    </div>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

</body>
</html>