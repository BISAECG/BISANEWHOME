<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <meta name="keywords" content="${news_keyWord}">
    <meta name="description" content="${news_description}">
    <!-- description -->
    <meta name="renderer" content="webkit">
    <title>${news_title}</title>
    <link href="../resourcesctrl/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resourcescss/index/head.css" rel="stylesheet">
    <link href="../resourcesctrl/layui/css/layui.css" rel="stylesheet" >
    <link href='../resourcesctrl/font-awesome-4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <link href="../resourcescss/comm/base.css" rel="stylesheet">
    <link href="../resourcescss/news/HK_News.css" rel="stylesheet">
    <script src="../resourcesjs/comm/jquery.min.js"></script>
    <script src="../resourcesjs/index/head.js"></script>
    <!--[if lt IE 9支持html5代碼]-->
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-147231948-1');
    </script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?b4b5d317176d4627ed7048d109c75943";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</head>
<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="wrap clear">
    <div class="row">
        <div class="col-md-12">
            <div class="clear container pt-40 pl-0 pr-0 pb-40">
                <p class="col-3f3b3c f-24 text-center line-h-30 text-overflow news-title">
                ${news_title}
                </p>
                <p class="col-898989 f-16 text-center line-h-25 mt-5 mb-5">
                    <span class="col-898989">date：${release_time}</span>
                    <span class="col-898989 mr-10 cur-new-time"> </span>
                    <span class="col-898989 ml-10">read：${read_quantity}</span>
                    <span class="col-898989 cur-new-quantity"> </span>
                </p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="clear main-details container pb-20 bor bor-b bor-col-e4e4e4 news-content">
            ${news_content}
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
