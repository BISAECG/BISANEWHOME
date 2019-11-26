<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />

    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!--<%&#45;&#45;移動設備網頁縮放比例&#45;&#45;%>-->
    <meta name="viewport" content="initial-scale=0.3,user-scalable=yes">
    <!-- necessary -->
    <meta name="keywords" content="${html_keyWord}">
    <meta name="description" content="${html_description}">
    <title>${html_title}</title>
    <!-- description -->
    <meta name="renderer" content="webkit">

    <!-- base -->
    <link href="../resources/css/comm/base.css" rel="stylesheet">
    <link href="../resources/css/index/index.css" rel="stylesheet">
    <script src="../resources/js/comm/jquery.min.js"></script>
    <style>
        p{
            color: #FFFFFF;
        }
    </style>
</head>
<body >
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="pos-r">
    <div class="container-full">
        <div class="row center-block" >
            <img class="img-responsive center-block"  src="../resources/img/menuList/mListBgImg.png" alt="心電儀産品證書">
        </div>
    </div>
    <div class="container mt-40">
        <div class="row">
            <div class="col-md-4  col-md-offset-4 text-center">
                <img src="../resources/img/certificate/chanpintitle.png" class="center-block ">
            </div>
        </div>
    </div>
    <div class="container mt-40">
        <div class="row">
            <div class="col-md-4" style="background: url('../resources/img/certificate/background.png') round;">
                <a href="../resources/img/index/chanpin.png" target="_blank">
                    <img src="../resources/img/index/chanpin.png"  class="center-block mt-20"  alt="醫療器械生産許可證">
                    <p class="text-center mt-10 mb-15">
                        醫療器械生産許可證
                    </p>
                </a>
            </div>
            <div class="col-md-4"
                 style="background: url('../resources/img/certificate/background.png') round;">

                <a href="../resources/img/certificate/zcz.png" target="_blank">
                    <img src="../resources/img/index/chanpin1.png" class="center-block mt-20" alt="CFDA注冊證">
                    <p class="text-center  mt-10 mb-15">
                        CFDA注冊證
                    </p>
                </a>
            </div>
            <div class="col-md-4" style="background: url('../resources/img/certificate/background.png') round;">
                <a href="../resources/img/certificate/CE@2x.png" target="_blank">
                    <img src="../resources/img/index/chanpin2.png" class="center-block mt-20" alt="FCC認證">
                    <p class="text-center  mt-10 mb-15">
                        FCC認證
                    </p>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4" style="background: url('../resources/img/certificate/background.png') round;">
                <a href="../resources/img/certificate/FCC@2x.png" target="_blank">
                    <img src="../resources/img/index/chanpin3.png" class="center-block mt-20 " alt="藍牙">
                    <p class="text-center  mt-10 mb-15">
                        藍牙
                    </p>
                </a>
            </div>
            <div class="col-md-4" style="background: url('../resources/img/certificate/background.png') round;">
                <a href="../resources/img/certificate/QBQ@2x.png" target="_blank">
                    <img src="../resources/img/index/chanpin4.png" class="center-block mt-20 " alt="FCC藍牙QBQ認證">
                    <p class="text-center  mt-10 mb-15">
                        FCC藍牙QBQ認證
                    </p>
                </a>
            </div>
            <div class="col-md-4" style="background: url('../resources/img/certificate/background.png') round;">
                <a href="../resources/img/certificate/img888.png" target="_blank">
                    <img src="../resources/img/index/chanpin5.png" class="center-block mt-20 " alt="實用新型專利證書">
                    <p class="text-center  mt-10 mb-15">
                        實用新型專利證書
                    </p>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4" style="background: url('../resources/img/certificate/background.png') round;">
                <a href="../resources/img/certificate/img787.png" target="_blank">
                    <img src="../resources/img/index/chanpin6.png" class="center-block mt-20 " alt="專利登記薄">
                    <p class="text-center  mt-10 mb-15">
                        專利登記薄
                    </p>
                </a>
            </div>
        </div>
    </div>



</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
</body>
</html>