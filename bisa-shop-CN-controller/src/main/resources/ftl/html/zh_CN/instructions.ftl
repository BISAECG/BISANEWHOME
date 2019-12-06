<!DOCTYPE html>
<html lang="CN" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="Images/favicon.ico" type="image/x-icon" />
    <link rel="bookmark" href="Images/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; " />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <!-- necessary -->
    <meta name="keywords" content="${html_description}">
    <meta name="description" content="${html_keyWord}">
    <title>${html_title}</title>
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="../resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="../resources/css/comm/base.css" rel="stylesheet">
    <link href="../resources/css/about/HK_About.css" rel="stylesheet">
    <link href="../resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <script src="../resources/js/comm/jquery.min.js"></script>
    <style>
        .title-color {
            background-color: rgba(1, 144, 255, 0.3);
        }
    </style>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="wrap clear">
    <div class="clear full-w">
        <img class="full-w" src="../resources/img/news/HK_HowToShop/banner.jpg" alt="">
    </div>
    <div class="container mt-30 pl-0 pr-0 clear bg-f5f5f5 pt-30 pb-70 mb-60">
        <div class="col-sm-3 pl-30 pr-20">
            <div class="clear bg-white pd-40-10-ipad">
                <p class="mt-10 mb-10 col-212121 f-30 line-h-40 cur-d">
                    使用说明
                </p>
                <p id="p1"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list1">
                    悉心心电仪App
                </p>
                <p id="p2"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list2">
                    心电仪使用指南
                </p>
                <p id="p3"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list2">
                    苹果用户报告生成指南
                </p>
                <p id="p4"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list2">
                    <a href="../resources/img/news/HK-Instructions/PECG.pdf" download="PECG.pdf">
                        PECG使用说明书下载</a>
            </div>
        </div>
        <div id="instr1" class=" clear col-sm-9 pr-30 pl-0">
            <div class="clear bg-white pb-60 pl-50 pr-50">
                <p class="pt-40-20-ipad f-50-40-ipad col-b0b0b0 line-h-70-50-ipad pb-20">
                    悉心心电仪App
                </p>
                <div class="clear bor bor-b bor-col-f5f5f5">
                </div>
                <div class="layui-collapse mt-40" lay-accordion="">
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            1.如何下载碧沙康健APP？
                        </h2>
                        <div class="layui-colla-content layui-show">
                            <p class="f-20 col-333 h-20 line-h-20 mt-30">
                                碧沙康健APP官网下载地址：
                            </p>
                            <p class=" h-20 line-h-20 mt-30">
                                <a download="bisahealth.apk"
                                   href="../resources/img/news/HK-Instructions/bishahealth.apk">点击下载</a>
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-30">
                                二维码下载：
                            </p>
                            <p class="f-20 col-aaa h-20 line-h-20 mt-20">
                                请使用手机截图后在微信或浏览器扫描截图二维码进入碧沙康健APP下载地址。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="../resources/img/news/HK-Instructions/qr_code.png" alt="碧沙康健app下载">
                            </div>
                        </div>
                    </div>
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            2.如何注册碧沙康健帐号？
                        </h2>
                        <div class="layui-colla-content">
                            <p class="f-20 col-333 line-h-30 mt-30">
                                （1）开启碧沙康健APP在帐号登入界面填写您的手机号，接收并填写短信验证码， 点击进入按钮。
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （2）打开APP
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （3）直接在 快捷登录 界面填写您的手机号，接收并填写短信验证码。
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （4）点击进入就注册成功了。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_register_tipsv1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （5）首次登录需设置密码，以后可选择手机号和密码登录。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_register_tipsv2.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45;第三列&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            3.如何在APP中绑定和解绑心电仪器等产品？
                        </h2>
                        <div class="layui-colla-content">
                            <p class="f-20 col-333 line-h-30 mt-30">
                                1.绑定产品流程：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （1）打开手机蓝牙和产品电源（长按心电仪操作键至绿灯亮起）
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （2）登录碧沙康健APP进入 全部设备 界面 拷贝
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （3）点击右上角 + 号进入 绑定设备 界面 拷贝
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_bound_tipsv1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （4）点击 开始匹配 按钮等待搜索附近的悉心产品
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （5）选中蓝牙搜索展示的产品设备号后点击确认添加设备
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_bound_tipsv2.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25 pl-30">
                                （6）绑定成功，您可正常使用碧沙康健APP监测心电了
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_bound_tipsv4.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-30">
                                2.解綁產品流程：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （1）登录碧沙康健APP进入 全部设备 界面
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （2）点击左上角 垃圾桶 按钮开启删除模式
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_bound_tipsv5.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25 pl-30">
                                （3）勾选需要解绑的设备
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25 pl-30">
                                （4）点击右下角 删除 按钮确认删除
                            </p>
                            <div class="clear text-center mt-25 mb-35">
                                <img src="../resources/img/news/HK-Instructions/in_bound_tipsv6.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45;第四列&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            4.如何使用APP监测心电与生成查看报告？
                        </h2>
                        <div class="layui-colla-content">
                            <p class="f-20 col-333 line-h-30 mt-30 f-w">
                                15分钟免费报告生成与查看：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-30">
                                （1）确保手机蓝牙与心电仪电源已开启
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （2）正确佩戴心电仪
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （3）登录碧沙康健APP进入 全部设备 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_report_tipsv1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （4）点击列表中已绑定的心电仪产品进入 心电监测 界面。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_report_tipsv2.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （5）点击左下角 生成报告 按钮选择需要生成的报告类型（收费报告需提前充值）
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_report_tipsv3.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （6）点击 开始监测 按钮后根据所选报告监测时长持续佩戴心电仪
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_report_tipsv4.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （7）报告将在监测结束后生成并推送给您，您也可以点击右下角 立即生成 按钮立即生成与查看报告。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/shuomingimg_7.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （8）您也可以在 心电监测 界面右下角点击 查看报告 按钮查看历史报告
                            </p>

                            <p class="f-20 col-333 line-h-30 mt-50 f-w">
                                24小时收费报告生成与查看（收费报告需提前充值）
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （1）确保手机蓝牙与心电仪电源已开启
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （2）保持正确佩戴持续最长不超过24小时（采集数据不足24小时也可以生成报告，建议佩戴前确保心电仪电量充沛）
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （3）登录碧沙康健APP进入 全部设备 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/chargeInstructions_1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （4）点击列表中已绑定的该心电仪产品进入 心电监测界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/chargeInstructions_2.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （5）使用OTG数据线将手机与心电仪设备连接并等待 注意事项提示，确认后进入 选择数据 界面，如未弹出 注意事项提示 请在连接后点击左下角 生成报告 按钮选择生成24小时收费报告并 开启监测。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/chargeInstructions_3.png">
                            </div>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/in_report_tipsv3.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （6）在 选择数据 界面勾选需要生成报告的心电数据（心电数据根据日期和时间排列，只能勾选一个时间段）。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/chargeInstructions_4.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （7）点击右下角 生成报告 按钮上传数据，所有操作完毕。（收费报告需要一定时间进行人工审核，完成后将自动推送给您，请耐心等候）。
                            </p>
                            <!--<%&#45;&#45;所有历史报告查看&#45;&#45;%>-->
                            <p class="f-20 col-333 line-h-30 mt-30 f-w">
                                所有历史报告查看：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （1）登录碧沙康健APP进入 全部设备 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/chargeInstructions_1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （2）点击列表中已绑定的心电仪产品进入 心电监控 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/history2.png" >
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （3）点击右下角 查看报告 按钮进入日历界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/history_3.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （4）您可以通过选中日期来筛选想要查看的历史报告，点击下方对应的报告类型即可查看报告详情。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="../resources/img/news/HK-Instructions/history4.png" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="instr2" style="display: none;" class=" clear col-sm-9 pr-30 pl-0">
            <div class="clear bg-white pb-60 pl-50 pr-50">
                <p class="pt-40-20-ipad f-50-40-ipad col-b0b0b0 line-h-70-50-ipad pb-20">
                    心电仪使用指南
                </p>
                <div class="clear bor bor-b bor-col-f5f5f5">
                </div>
                <div class="layui-collapse mt-40" lay-accordion="">
                    <!--<%&#45;&#45; 第一行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            1)	安装一次性使用心电电极片
                        </h2>
                        <div class="layui-colla-content layui-show">
                            <p class="col-333">
                                取出一台处于关闭状态的动态心电记录仪，将电极片与动态心电记录仪四角对齐扣合并揭去电极片保护膜。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="../resources/img/news/HK-Instructions/diyihang.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第2行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            2)	贴戴动态心电记录仪
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                建议剃掉在电极片安放位置（红色椭圆区域）的体毛，彻底清洁电极片安装位置的皮肤上的油脂和污垢，保持动态心电记录仪的操作键朝上的方向，将一次性使用心电电极贴片紧密贴合皮肤，把电极片贴在图中椭圆圈指定的位置，靠近心窝部两侧。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="../resources/img/news/HK-Instructions/dierhang_cn.png" >
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第3行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            3) 开始采集数据
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                启动动态心电记录仪, 长按操作键直至指示灯显示为绿色，数秒后指示灯开始闪烁, 采集数据开始。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="../resources/img/news/HK-Instructions/disanhang_cn.png" >
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第4行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            4) 结束采集数据
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                待数据采集结束后（一般为24小时），关闭动态心电记录仪, 长按操作键直至指示灯显示为绿色，数秒后指示灯熄灭, 采集数据结束。
                            </p>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第5行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            5) 取下动态心电记录仪
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                采集数据结束后, 用手按着动态心电记录仪, 如下图所示，从电极片的A处开始, 然后由外向内慢慢揭下一次性使用心电电极片，放下动态心电记录仪，然后拔开电极片，将电极片弃置垃圾桶。取下时切勿用力撕扯电极片，以免损伤皮肤。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="../resources/img/news/HK-Instructions/diwuhang.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第6行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            6)	上传数据
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                将动态心电记录仪通过OTG数据线连接手机或者通过USB数据线连接电脑，上传动态心电记录仪数据请参考本公司官网最新说明书。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="../resources/img/news/HK-Instructions/diliuhang.png">
                                <img class="img-180" src="../resources/img/news/HK-Instructions/diliuhang_2.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第7行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            7)	紧急求助操作
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                动态心电记录仪在采集状态下连按2下操作键触发主动求助，蜂鸣器约2秒鸣叫3次， 同时将短信发给紧急联系人（在有定制的APP服务情况下）。此时再按一下操作键则取消求助，蜂鸣器停止鸣叫。
                            </p>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第8行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            8)	停搏提醒
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                动态心电记录仪在采集状态下，若使用者发生心脏停搏事件动态心电记录仪会触发停搏求助，蜂鸣器约2秒鸣叫3次 ，同时将短信发给紧急联系人（在有定制的APP服务情况下）。
                            </p>
                            <p class="col-333" style="color: red;">
                                **本公司一次性使用心电电极片己通过生物性兼容测试, 若用户佩戴一次性使用心电电极片后出现皮肤不适或红肿,请立即停止使用并取下动态心电记录仪。若有需要, 请前往医院就医。
                            </p>
                        </div>
                    </div>
                    <!--<%&#45;&#45;動態心電記錄儀狀態說明&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            动态心电记录仪状态说明
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                动态心电记录仪有三个状态：工作状态、关闭状态、充电/USB连接状态。当动态心电记录仪处于关闭状态时，长按操作键约3秒，绿灯会长亮约5秒, 然后进入工作状态。动态心电记录仪处于工作状态时, 长按操作键约3秒，绿灯会长亮3～5秒，然后进入关闭状态。动态心电记录仪处于工作状态或者关闭状态时，使用USB数据线连接开机的电脑即进入充电/USB连接状态。动态心电记录仪 在充电/USB连接状态下不能采集心电数据。
                            </p>
                            <p class="col-333">
                                以下表格为三个状态的详细说明：
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-360" src="../resources/img/news/HK-Instructions/zhuangtai_cn.png" >
                            </div>
                            <p class="col-333">
                                三个状态切换方式如下图所示：
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-360" src="../resources/img/news/HK-Instructions/qiehuan_cn.png" >
                            </div>
                            <p class="col-333">
                                注意事项 :
                            </p>
                            <p class="col-333">
                                1.在使用动态心电记录仪前请仔细阅读说明书。
                            </p>
                            <p class="col-333">
                                2.请将电极片放置在远离高温、潮湿和水浸的地方。
                            </p>
                            <p class="col-333">
                                3.电极片为一次性消耗品，重复使用可能导致发炎或感染。
                            </p>
                            <p class="col-333">
                                请勿自行拆卸和更换电池，若有需要，请联系本公司授权的售后维修部门或经销商进行处理。
                            </p>
                        </div>
                    </div>
                    <!--<%&#45;&#45;常見的問題和解決方法&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            常见的问题和解决方法
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                符號:
                            </p>
                            <div>
                                <img class="img-360" src="../resources/img/news/HK-Instructions/fuhao_cn.png" >
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45;免責聲明&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            免责声明
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                本公司产品采集的心电数据只有经过本公司授权的医疗单位、专家或医生解读才能用于医疗诊断。
                            </p>
                            <p class="col-333">
                                用户对于本公司产品采集的心电数据的自我解读所造成的误诊误导和损失，本公司不承担任何责任。
                            </p>
                            <p class="col-333">
                                依据本公司产品采集的心电数据所做的风险评估并非完美。由于风险评估的指数偏高导致用户心理负担加重从而可能造成病情的恶化或由于风险评估的指数偏低但用户实际病情的恶化等情况而造成的损失，本公司不承担任何责任。
                            </p>
                            <p class="col-333">
                                本公司明确表示不对任何直接、间接或相关情况导致的损失负责，包括但不限于收入损失、利润损失、业务中断或数据丢失而带来的损失，无论任何形式的行动或法律原则下的所宣称的赔偿责任，甚至包括事先已告知任何可能导致的损失。
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="instr3" style="display: none;" class=" clear col-sm-9 pr-30 pl-0">
            <div class="clear bg-white pb-60 pl-50 pr-50">
                <p class="pt-40-20-ipad f-50-40-ipad col-b0b0b0 line-h-70-50-ipad pb-20">
                    苹果用户报告生成指南
                </p>
                <div class="clear bor bor-b bor-col-f5f5f5">
                </div>
                <div class="layui-collapse mt-40" lay-accordion="">
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            苹果用户报告生成指南
                        </h2>
                        <div class="layui-colla-content layui-show">
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                1.使用 micro USB 将监测完毕的 心电记录仪 与 电脑 连接。
                            </p>
                            <p class="f-20 h-20 line-h-20 mt-20">
                                2. 打开 我的电脑。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple1.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                3.打开 HC3A250 盘（如找不到HC3A250盘，可能是记录仪与电脑连接失败，请再次拔插尝试连接）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple2.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                4.进入 USDATA 文件夹。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple3.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                5.根据文件名中的日期时间（红线标记部分）找出需要上传的ECD文件。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple1.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                6.右键 ECD文件 ，在菜单中点击复制（红线标记部分）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple5.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                7.回到 桌面 右键桌面，在菜单中点击粘贴（红线标记部分）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple6.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                8.使用浏览器进入
                                <a style="color: deepskyblue"
                                   href="https://hk-server.bisahealth.com/login">https://hk-server.bisahealth
                                    .com/login</a>
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                9.使用账号密码登录（忘记密码可使用免密登录）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple7.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                10.在左侧菜单中点击 报告管理 。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple8.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                11.点击 新建报告 按钮打开创建报告界面。
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                12.点击 上传ECD 按钮（红框标记部分）打开文件选择框。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple9.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                13.点击左侧 桌面（红框标记部分） 后找出并选中之前粘贴的ECD文件，点击右下角 打开 按钮。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple10.png" >
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                14.载入文件后请点击 预览 按钮，拖动下方圆形按钮查看并确保ECD文件中数据是为有效数据（请参照 正常波形图 与 杂乱波形图），查看完毕请关闭 预览 窗口。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple16.png">
                            </div>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple17.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                15.填写 姓名、年龄、性别等必选项 ，选填其他内容。
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                16.点击 创建报告 按钮（红框标记部分），用户完成所有上传操作。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple11.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                17.等待报告生成与查看报告生成状态（48小时内生成，请留意报告状态）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple12.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                18.报告状态处于 待查看 时，用户可查看、下载报告。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="../resources/img/news/HK-Instructions/apple13.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>
</body>
<script src="../resources/js/comm/jquery.validate.min.js"></script>
<script src="../resources/js/comm/jquery.validate.messages_zh.js"></script>
<script src="../resources/ctrl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../resources/ctrl/layui/layui.js"></script>
<script src="../resources/js/about/HK-Instructions.js"></script>

</html>