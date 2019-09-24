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
                <p class="" style="color:rgba(255,255,255,1);font-size:24px;font-weight:400;margin:40px auto;">醫院智慧心電監測技術解決方案</p>
            </div>
            <div class="row" style="margin-left: 30px;">
                <span style="color:rgba(243,242,242,1);font-size:16px;">針對目前醫療機構動態心電監測使用的傳統12導聯Holter存在的産品價格昂貴、患者佩戴不便、監測易受幹擾、僅能存儲24小時數據、人工分析勞動量大、器材損耗大等問題，碧沙康健推出了智慧心電監測技術解決方案，實現長時段監測、AI智能分析、網上診療和緊急求助等應用，助力AI醫用技術的快速發展。</span>
            </div>
            <div class="row pos-a" style="top: 110%;left: 10%;">
                <a  class="text-center taobao1">淘寶商城</a>
                <a class="text-center jingdong1" style="margin-left: 15px;">京東自營</a>
            </div>
        </div>
    </div>
    <p class="title-p">傳統方式</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row mb-40">
        <img  class="img-responsive center-block" src="../resources/img/solution/banner2.png" alt="碧沙心電儀四大優勢">
    </div>
    <p class="title-p">四大方案</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row mb-40 ">
        <img class="img-responsive center-block" src="../resources/img/solution/banner3.png"
             alt="碧沙心電儀四大優勢">
    </div>
    <p class="title-p">方案流程</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row  mb-40 ">
        <img  class="img-responsive center-block" src="../resources/img/solution/banner4.gif" alt="碧沙心電儀方案流程">
    </div>
    <div class="row  mb-40 " >
        <img  class="img-responsive center-block" src="../resources/img/solution/banner5.png" alt="碧沙心電儀方案配置">
    </div>
    <p class="title-p">合作夥伴</p>
    <div class="line">
        <span class="line-top"></span>
        <span class="line-btm"></span>
    </div>
    <div class="row  mb-40 ">
        <img  class="img-responsive center-block" src="../resources/img/solution/banner6.png" alt="碧沙心電儀合作夥伴">
    </div>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

</body>
</html>