<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html;" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <meta name="keywords" content="${html_keyWord}">
    <meta name="description" content="${html_description}">
    <title>${html_title}</title>
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="../resources/ctrl/layui/css/layui.css" rel="stylesheet" >
    <link href="../resources/css/comm/base.css" rel="stylesheet">
    <link href="../resources/css/news/HK_News.css" rel="stylesheet">
    <link href="../resources/css/about/HK_About.css" rel="stylesheet">
    <script src="../resources/js/comm/jquery.min.js"></script>
    <style>
        .title-color{
            background-color:rgba(1,144,255,0.3);
        }
        .seach span{
            margin: 0 5px;
        }
        .seach span a{
            color:#858585;
        }
        .seach span a:hover{
            color:#2B84C6;
        }
    </style>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="wrap clear" id="title-list">
    <div class="container-full pos-r center-block">
        <img class="img-responsive center-block" src="../resources/img/news/HK_HowToShop/banner.png" >
        <p class="f-40" style="color: #FFFFFF;position: absolute;left:45%;top: 15%; ">
            Health information
        </p>
        <p style="position: absolute;left:40%;top: 34%;">
            <span class="f-30 pr-40"  style="color: #FFFFFF;">ECG</span>
            <span class="f-30" style="background: #3592D0;color: #FFFFFF;">Follow Bisahealth</span>
        </p>
        <p class="f-30"  style="color: #FFFFFF;position: absolute;left:42%;top: 50%;">Give your family a heart-to-heart care</p>
        <img style="position: absolute;left:48%;top: 75%;"
             src="../resources/img/news/HK_HowToShop/downlogo.png">
    </div>
    <div class="container pt-20 pb-20">
        <div class="row">
            <div class="col-md-6 seach">
                <span style="color: #010101;">Health information:</span>
                <span><a>PECG</a></span>
                <span><a>Bisa</a></span>
                <span><a>Myocardial infarction</a></span>
                <span><a>ECG</a></span>
            </div>
            <div class="col-md-3 col-md-offset-3 seach">
                <form class="pos-r">
                    <div class="pos-r" style="border:1px solid rgba(43,132,198,1);height: 36px;width: 180px;">
                        <input name="seachtext" type="text" style="width:160px;border:0;height:35px;position:
                        absolute;left: 20px;top: 0%;border-bottom:1px solid rgba(43,132,198,1); ">
                        <i class="fa fa-search pos-a" style="left: 2%;top: 27%;font-size: 16px;" aria-hidden="true"></i>
                    </div>
                    <input id="seach" type="button"
                           style="width:55px;height:36px;background:rgba(43,132,198,1);color: #fff;border: 0;position: absolute;left:
                           180px;top: 0%;"
                           value="seach">
                </form>
            </div>
        </div>
    </div>
    <div class="full-w mb-20"  style="background: #F1F1F1;">
        <div class="container">
            <div class="row">
                <div class="col-md-4 pt-10 pb-10">
                <span style="font-size: 18px;font-weight: bold;">
                    News and information
                </span>
                </div>
                <div class="col-md-1 col-md-offset-7">
                    <i class="fa fa-angle-double-down pull-right" style="padding-top: 20px;font-size: 16px;" aria-hidden="true"></i>
                </div>
            </div>
        </div>
    </div>
    <!--zhiding-->
    <div class="container mt-40 pb-40"  style="border-bottom: 1px solid #E5E5E4;">
        <div class="row  main_div" id="zhidingtitle">
        </div>
    </div>
    <!--putongwenzhang-->
    <div class="container pt-div" id="putongtitle" style="margin-bottom: 100px;">
        <ul class="flow-default" style="height: 300px;" id="LAY_demo2"></ul>
    </div>
    <div class="container seachlist">
        <ul class="flow-default"  id="LAY_demo1"></ul>
    </div>
</div>

<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
</body>
<script src="../resources/js/comm/bootstrap.js"></script>
<script src="../resources/ctrl/layui/layui.js"></script>
<script>
    $(document).ready(function() {
        //新聞內容獲取
        function indexNew() {
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/new/tops",
                success: function (data) {
                    console.log(data);
                    $.each(data, function(i, item) {
                        var time = getMyDate(item.release_time);
                        $(".main_div").append(
                                '<div class="clear col-md-3 new-div">'+
                                '<div class="row">'+
                                '<input type="hidden"  class="zd-id" value="'+item.id+'"/>'+
                                '<img class=" wh16-9 cur-p news-img" width="280" height="200" src="'+item.img_url+'">'+
                                '<p class="line-h-20 h-20 f-16 col-414141 text-overflow cur-p  text-center mt-10 news-title" style="font-weight:bold;">'+item.news_title+''+
                                '</p>'+
                                '<p class="f-12 col-888 mtb-10-0-ipad h-40 overflow-h line-h-20 text-line-2-1-ipad cur-p hovecol-999 news-describe">'+item.news_describe+''+
                                '</p>'+
                                '<p class="f-12 col-888 mtb-10-0-ipad line-h-20 text-line-2-1-ipad cur-d">'+
                                '<span>time:</span><span class="col-888 news-time">'+time+'</span>'+
                                '<span  style="margin-left: 40px;">read:</span><span class="col-888 news-quantity">'+item
                                        .read_quantity+'</span>'+
                                '</p>'+
                                '</div>'+
                                '</div>'
                        )
                    });
                }
            });
        }
        indexNew();
        //點擊圖片跳轉
        $(".main_div").on("click", ".new-div", function () {
            var id = $(this).find(".zd-id").val();
            window.open('/news/body?id='+id,'_blank')
        });
        function getMyDate(data) {
            if (data == "" || data == null) {
                return "- - - - - -";
            }
            data = parseInt(data);
            //var oldTime = (new Date(data)).getTime(); //得到毫秒數
            var oDate = new Date(data);
            oYear = oDate.getFullYear(),
                    oMonth = oDate.getMonth() + 1,
                    oDay = oDate.getDate(),
                    oHour = oDate.getHours(),
                    oMin = oDate.getMinutes(),
                    oSen = oDate.getSeconds(),
                    oTime = oYear + '年' + getzf(oMonth) + '月' + getzf(oDay) + '日';//最後拼接時間
            return oTime;
        };
        function getzf(num) {
            if (parseInt(num) < 10) {
                num = '0' + num;
            }
            return num;
        }
        layui.use('flow', function () {
            var flow = layui.flow;
            flow.load({
                elem: '#LAY_demo2' //流加載容器
                , isAuto: false
                , isLazyimg: true
                , done: function (page, next) { //加載下一頁
                    $.get("/news/list?page=" + page + "&limit=" + 5 , function (data) {
                        console.log(data)
                        var lis = [];
                        layui.each(data.datas, function (index,item) {  //遍曆後台傳過來的數據
                            var release_time = getMyDate(item.release_time);
                            lis.push(
                                    '<li class="news-div cur-p">'+
                                    '<div class="row">'+
                                    '<div class="col-md-12 pt-15 pb-20" style="border-bottom: 1px solid #E5E5E4;padding-left: 0px;">'+
                                    '<input type="hidden" class="news-id" value="'+item.id+'"/>'+
                                    '<div class="col-md-2" style="padding:0px;">'+
                                    '<span class="col-888" style="background:linear-gradient(0deg,rgba(44,106,206,1) 0%,rgba(47,232,230,1) 100%);box-shadow:0px 1px 5px 0px rgba(53,143,238,1);color: #fff;">'+release_time+'</span>'+
                                    '</div>'+
                                    '<div class="col-md-9">'+
                                    '<span class="col-888" style="color: #101010;">'+item.news_title+'</span>'+
                                    '</div>'+
                                    '<div class="col-md-1">'+
                                    '<span class="cur-p pull-right">more></span>'+
                                    '</div>'+
                                    '</div>'+
                                    '</div>'+
                                    '</li>'//作爲元素塞進數組lis中
                            )
                        });
                        var pageres =  Math.ceil(data.total/3);
                        next(lis.join(''), page <pageres);  //拼接成字符串
                    })
                }
            })
        })

        //點擊圖片跳轉
        $(".pt-div").on("click", ".news-div", function () {
            var id = $(this).find(".id").val();
            window.open('/news/body?id='+id,'_blank')
        });
        $('#seach').click(function(){
            var  keywordtext = $('input[name="seachtext"]').val();
            $('#zhidingtitle').addClass("dis-n");
            $('#putongtitle').addClass("dis-n");
            $('.seach').addClass("dis-n");
            // $('#seachlist').addClass("dis-n");
            console.log(keywordtext)
            layui.use('flow', function () {
                var flow = layui.flow;
                flow.load({
                    elem: '#LAY_demo1' //流加載容器
                    , isAuto: false
                    , isLazyimg: true
                    , done: function (page, next) { //加載下一頁
                        $.get("/news/list?page=" + page + "&limit=" + 6 +"&keyWord=" + keywordtext, function (data) {
                            var lis = [];
                            console.log(data)
                            layui.each(data.datas, function (index, item) {  //遍曆後台傳過來的數據
                                lis.push(
                                        '<li>'+
                                        '<div class="container">'+
                                        '<div class="row">'+
                                        '<div class="col-md-12 pt-15 pb-20">'+
                                        '<input type="hidden" class="news-id" value="'+item.news_id+'"/>'+
                                        '<div class="col-md-3">'+
                                        '<img class=" cur-p news-img" width="280" height="200" src="'+item.img_url+'">'+
                                        '</div>'+
                                        '<div class="col-md-9">'+
                                        '<div class="row">'+
                                        '<div class="col-md-12">'+
                                        '<p class="line-h-20 h-20 f-16 col-414141 text-overflow cur-p  text-center mt-10 news-title"  style="font-weight:bold;">'+item.news_title+'</p>'+
                                        '</div>'+
                                        '</div>'+
                                        '<div class="row">'+
                                        '<div class="col-md-12">'+
                                        '<p class="f-12 col-888 mtb-10-0-ipad h-40 overflow-h line-h-20 text-line-2-1-ipad cur-p hovecol-999 news-describe">'+item.news_describe+'</p>'+
                                        '</div>'+
                                        '</div>'+
                                        '</div>'+
                                        '</div>'+
                                        '</div>'+
                                        '</div>'+
                                        '</li>'//作爲元素塞進數組lis中
                                )
                            });
                            var pageres = Math.ceil(data.total / 6);
                            next(lis.join(''), page < pageres);  //拼接成字符串
                        })
                    }
                })
            })


        })
    });
</script>
</html>