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
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/about/HK_About.css" rel="stylesheet">
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
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
        <img class="full-w" src="/resources/img/news/HK_HowToShop/banner.jpg" alt="">
    </div>
    <div class="container mt-30 pl-0 pr-0 clear bg-f5f5f5 pt-30 pb-70 mb-60">
        <div class="col-sm-3 pl-30 pr-20">
            <div class="clear bg-white pd-40-10-ipad">
                <p class="mt-10 mb-10 col-212121 f-30 line-h-40 cur-d">
                    使用說明
                </p>
                <p id="p1"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list1">
                    悉心心電儀App
                </p>
                <p id="p2"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list2">
                    心電儀使用指南
                </p>
                <p id="p3"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list2">
                    蘋果用戶報告生成指南
                </p>
                <p id="p4"
                   class="col-757575 f-20-16-ipad line-h-25 mt-40 mb-20 cur-p hovecol-309DE2 col-active instructions-list2">
                    <a href="/resources/img/news/HK-Instructions/PECG.pdf" download="PECG.pdf">
                        PECG使用說明書下載</a>
            </div>
        </div>
        <div id="instr1" class=" clear col-sm-9 pr-30 pl-0">
            <div class="clear bg-white pb-60 pl-50 pr-50">
                <p class="pt-40-20-ipad f-50-40-ipad col-b0b0b0 line-h-70-50-ipad pb-20">
                    悉心心電儀App
                </p>
                <div class="clear bor bor-b bor-col-f5f5f5">
                </div>
                <div class="layui-collapse mt-40" lay-accordion="">
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            1.如何下載碧沙康健APP？
                        </h2>
                        <div class="layui-colla-content layui-show">
                            <p class="f-20 col-333 h-20 line-h-20 mt-30">
                                碧沙康健APP官網下載地址：
                            </p>
                            <p class=" h-20 line-h-20 mt-30">
                                <a download="bisahealth.apk"
                                   href="/resources/img/news/HK-Instructions/bishahealth.apk">點擊下載</a>
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-30">
                                二維碼下載：
                            </p>
                            <p class="f-20 col-aaa h-20 line-h-20 mt-20">
                                請使用手機截圖後在微信或瀏覽器掃描截圖二維碼進入碧沙康健APP下載地址。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="/resources/img/news/HK-Instructions/qr_code.png" alt="碧沙康健app下載">
                            </div>
                        </div>
                    </div>
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            2.如何註冊碧沙康健帳號？
                        </h2>
                        <div class="layui-colla-content">
                            <p class="f-20 col-333 line-h-30 mt-30">
                                （1）開啟碧沙康健APP在帳號登入界面填寫您的手機號，接收並填寫短信驗證碼， 點擊進入按鈕。
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （2）打開APP
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （3）直接在 快捷登錄 界面填寫您的手機號，接收並填寫短信驗證碼。
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （4）點擊進入就註冊成功了。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_register_tipsv1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （5）首次登錄需設置密碼，以後可選擇手機號和密碼登錄。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_register_tipsv2.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45;第三列&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            3.如何在APP中綁定和解綁心電儀器等產品？
                        </h2>
                        <div class="layui-colla-content">
                            <p class="f-20 col-333 line-h-30 mt-30">
                                1.綁定產品流程：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （1）打開手機藍牙和產品電源（長按心電儀操作鍵至綠燈亮起）
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （2）登錄碧沙康健APP進入 全部設備 界面 拷貝
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （3）點擊右上角 + 號進入 綁定設備 界面 拷貝
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_bound_tipsv1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （4）點擊 開始匹配 按鈕等待搜索附近的悉心產品
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （5）選中藍牙搜索展示的產品設備號後點擊確認添加設備
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_bound_tipsv2.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25 pl-30">
                                （6）綁定成功，您可正常使用碧沙康健APP監測心電了
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_bound_tipsv4.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-30">
                                2.解綁產品流程：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （1）登錄碧沙康健APP進入 全部設備 界面
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15 pl-30">
                                （2）點擊左上角 垃圾桶 按鈕開啟刪除模式
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_bound_tipsv5.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25 pl-30">
                                （3）勾選需要解綁的設備
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25 pl-30">
                                （4）點擊右下角 刪除 按鈕確認刪除
                            </p>
                            <div class="clear text-center mt-25 mb-35">
                                <img src="/resources/img/news/HK-Instructions/in_bound_tipsv6.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45;第四列&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            4.如何使用APP監測心電與生成查看報告？
                        </h2>
                        <div class="layui-colla-content">
                            <p class="f-20 col-333 line-h-30 mt-30 f-w">
                                15分鐘免費報告生成與查看：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-30">
                                （1）確保手機藍牙與心電儀電源已開啟
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （2）正確佩戴心電儀
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-15">
                                （3）登錄碧沙康健APP進入 全部設備 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_report_tipsv1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （4）點擊列表中已綁定的心電儀產品進入 心電監測 界面。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_report_tipsv2.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （5）點擊左下角 生成報告 按鈕選擇需要生成的報告類型（收費報告需提前充值）
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_report_tipsv3.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （6）點擊 開始監測 按鈕後根據所選報告監測時長持續佩戴心電儀
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_report_tipsv4.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （7）報告將在監測結束後生成並推送給您，您也可以點擊右下角 立即生成 按鈕立即生成與查看報告。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/shuomingimg_7.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （8）您也可以在 心電監測 界面右下角點擊 查看報告 按鈕查看歷史報告
                            </p>

                            <p class="f-20 col-333 line-h-30 mt-50 f-w">
                                24小時收費報告生成與查看（收費報告需提前充值）
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （1）確保手機藍牙與心電儀電源已開啟
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （2）保持正確佩戴持續最長不超過24小時（采集數據不足24小時也可以生成報告，建議佩戴前確保心電儀電量充沛）
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （3）登錄碧沙康健APP進入 全部設備 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/chargeInstructions_1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （4）點擊列表中已綁定的該心電儀產品進入 心電監測界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/chargeInstructions_2.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （5）使用OTG數據線將手機與心電儀設備連接並等待 註意事項提示，確認後進入 選擇數據 界面，如未彈出 註意事項提示 請在連接後點擊左下角 生成報告 按鈕選擇生成24小時收費報告並 開啟監測。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/chargeInstructions_3.png">
                            </div>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/in_report_tipsv3.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （6）在 選擇數據 界面勾選需要生成報告的心電數據（心電數據根據日期和時間排列，只能勾選壹個時間段）。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/chargeInstructions_4.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （7）點擊右下角 生成報告 按鈕上傳數據，所有操作完畢。（收費報告需要壹定時間進行人工審核，完成後將自動推送給您，請耐心等候）。
                            </p>
                            <!--<%&#45;&#45;所有歷史報告查看&#45;&#45;%>-->
                            <p class="f-20 col-333 line-h-30 mt-30 f-w">
                                所有歷史報告查看：
                            </p>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （1）登錄碧沙康健APP進入 全部設備 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/chargeInstructions_1.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （2）點擊列表中已綁定的心電儀產品進入 心電監控 界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/history2.png" >
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （3）點擊右下角 查看報告 按鈕進入日歷界面
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/history_3.png">
                            </div>
                            <p class="f-20 col-333 line-h-30 mt-25">
                                （4）您可以通過選中日期來篩選想要查看的歷史報告，點擊下方對應的報告類型即可查看報告詳情。
                            </p>
                            <div class="clear text-center mt-25">
                                <img src="/resources/img/news/HK-Instructions/history4.png" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="instr2" style="display: none;" class=" clear col-sm-9 pr-30 pl-0">
            <div class="clear bg-white pb-60 pl-50 pr-50">
                <p class="pt-40-20-ipad f-50-40-ipad col-b0b0b0 line-h-70-50-ipad pb-20">
                    心電儀使用指南
                </p>
                <div class="clear bor bor-b bor-col-f5f5f5">
                </div>
                <div class="layui-collapse mt-40" lay-accordion="">
                    <!--<%&#45;&#45; 第壹行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            1)	安裝壹次性使用心電電極片
                        </h2>
                        <div class="layui-colla-content layui-show">
                            <p class="col-333">
                                取出壹臺處於關閉狀態的動態心電記錄儀，將電極片與動態心電記錄儀四角對齊扣合並揭去電極片保護膜。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="/resources/img/news/HK-Instructions/diyihang.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第2行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            2)	貼戴動態心電記錄儀
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                建議剃掉在電極片安放位置（紅色橢圓區域）的體毛，徹底清潔電極片安裝位置的皮膚上的油脂和汙垢，保持動態心電記錄儀的操作鍵朝上的方向，將壹次性使用心電電極貼片緊密貼合皮膚，把電極片貼在圖中橢圓圈指定的位置，靠近心窩部兩側。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="/resources/img/news/HK-Instructions/dierhang_cn.png" >
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第3行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            3) 開始采集數據
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                啟動動態心電記錄儀, 長按操作鍵直至指示燈顯示為綠色，數秒後指示燈開始閃爍, 采集數據開始。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="/resources/img/news/HK-Instructions/disanhang_cn.png" >
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第4行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            4) 結束采集數據
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                待數據采集結束後（壹般為24小時），關閉動態心電記錄儀, 長按操作鍵直至指示燈顯示為綠色，數秒後指示燈熄滅, 采集數據結束。
                            </p>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第5行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            5) 取下動態心電記錄儀
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                采集數據結束後, 用手按著動態心電記錄儀, 如下圖所示，從電極片的A處開始, 然後由外向內慢慢揭下壹次性使用心電電極片，放下動態心電記錄儀，然後拔開電極片，將電極片棄置垃圾桶。取下時切勿用力撕扯電極片，以免損傷皮膚。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="/resources/img/news/HK-Instructions/diwuhang.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第6行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            6)	上傳數據
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                將動態心電記錄儀通過OTG數據線連接手機或者通過USB數據線連接電腦，上傳動態心電記錄儀數據請參考本公司官網最新說明書。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-180" src="/resources/img/news/HK-Instructions/diliuhang.png">
                                <img class="img-180" src="/resources/img/news/HK-Instructions/diliuhang_2.png">
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45; 第7行&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            7)	緊急求助操作
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                動態心電記錄儀在采集狀態下連按2下操作鍵觸發主動求助，蜂鳴器約2秒鳴叫3次， 同時將短信發給緊急聯系人（在有定制的APP服務情況下）。此時再按壹下操作鍵則取消求助，蜂鳴器停止鳴叫。
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
                                動態心電記錄儀在采集狀態下，若使用者發生心臟停搏事件動態心電記錄儀會觸發停搏求助，蜂鳴器約2秒鳴叫3次 ，同時將短信發給緊急聯系人（在有定制的APP服務情況下）。
                            </p>
                            <p class="col-333" style="color: red;">
                                **本公司壹次性使用心電電極片己通過生物性兼容測試, 若用戶佩戴壹次性使用心電電極片後出現皮膚不適或紅腫,請立即停止使用並取下動態心電記錄儀。若有需要, 請前往醫院就醫。
                            </p>
                        </div>
                    </div>
                    <!--<%&#45;&#45;動態心電記錄儀狀態說明&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            動態心電記錄儀狀態說明
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                動態心電記錄儀有三個狀態：工作狀態、關閉狀態、充電/USB連接狀態。當動態心電記錄儀處於關閉狀態時，長按操作鍵約3秒，綠燈會長亮約5秒, 然後進入工作狀態。動態心電記錄儀處於工作狀態時, 長按操作鍵約3秒，綠燈會長亮3～5秒，然後進入關閉狀態。動態心電記錄儀處於工作狀態或者關閉狀態時，使用USB數據線連接開機的電腦即進入充電/USB連接狀態。動態心電記錄儀 在充電/USB連接狀態下不能采集心電數據。
                            </p>
                            <p class="col-333">
                                以下表格為三個狀態的詳細說明：
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-360" src="/resources/img/news/HK-Instructions/zhuangtai_cn.png" >
                            </div>
                            <p class="col-333">
                                三個狀態切換方式如下圖所示：
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img class="img-360" src="/resources/img/news/HK-Instructions/qiehuan_cn.png" >
                            </div>
                            <p class="col-333">
                                註意事項 :
                            </p>
                            <p class="col-333">
                                1.在使用動態心電記錄儀前請仔細閱讀說明書。
                            </p>
                            <p class="col-333">
                                2.請將電極片放置在遠離高溫、潮濕和水浸的地方。
                            </p>
                            <p class="col-333">
                                3.電極片為壹次性消耗品，重復使用可能導致發炎或感染。
                            </p>
                            <p class="col-333">
                                請勿自行拆卸和更換電池，若有需要，請聯系本公司授權的售後維修部門或經銷商進行處理。
                            </p>
                        </div>
                    </div>
                    <!--<%&#45;&#45;常見的問題和解決方法&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            常見的問題和解決方法
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                符號:
                            </p>
                            <div>
                                <img class="img-360" src="/resources/img/news/HK-Instructions/fuhao_cn.png" >
                            </div>
                        </div>
                    </div>
                    <!--<%&#45;&#45;免責聲明&#45;&#45;%>-->
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            免責聲明
                        </h2>
                        <div class="layui-colla-content">
                            <p class="col-333">
                                本公司產品采集的心電數據只有經過本公司授權的醫療單位、專家或醫生解讀才能用於醫療診斷。
                            </p>
                            <p class="col-333">
                                用戶對於本公司產品采集的心電數據的自我解讀所造成的誤診誤導和損失，本公司不承擔任何責任。
                            </p>
                            <p class="col-333">
                                依據本公司產品采集的心電數據所做的風險評估並非完美。由於風險評估的指數偏高導致用戶心理負擔加重從而可能造成病情的惡化或由於風險評估的指數偏低但用戶實際病情的惡化等情況而造成的損失，本公司不承擔任何責任。
                            </p>
                            <p class="col-333">
                                本公司明確表示不對任何直接、間接或相關情況導致的損失負責，包括但不限於收入損失、利潤損失、業務中斷或數據丟失而帶來的損失，無論任何形式的行動或法律原則下的所宣稱的賠償責任，甚至包括事先已告知任何可能導致的損失。
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="instr3" style="display: none;" class=" clear col-sm-9 pr-30 pl-0">
            <div class="clear bg-white pb-60 pl-50 pr-50">
                <p class="pt-40-20-ipad f-50-40-ipad col-b0b0b0 line-h-70-50-ipad pb-20">
                    蘋果用戶報告生成指南
                </p>
                <div class="clear bor bor-b bor-col-f5f5f5">
                </div>
                <div class="layui-collapse mt-40" lay-accordion="">
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title f-18 title-color">
                            蘋果用戶報告生成指南
                        </h2>
                        <div class="layui-colla-content layui-show">
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                1.使用 micro USB 將監測完畢的 心電記錄儀 與 電腦 連接。
                            </p>
                            <p class="f-20 h-20 line-h-20 col-333 mt-20">
                                2. 打開 我的電腦。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple1.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                3.打開 HC3A250 盤（如找不到HC3A250盤，可能是記錄儀與電腦連接失敗，請再次拔插嘗試連接）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple2.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                4.進入 USDATA 文件夾。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple3.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                5.根據文件名中的日期時間（紅線標記部分）找出需要上傳的ECD文件。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple15.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                6.右鍵 ECD文件 ，在菜單中點擊複制（紅線標記部分）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple5.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                7.回到 桌面 右鍵桌面，在菜單中點擊粘貼（紅線標記部分）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple6.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                8.使用浏覽器進入
                                <a style="color: deepskyblue" href="https://hk-server.bisahealth.com/login">https://hk-server.bisahealth
                                    .com/login
                                </a>
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                9.使用賬號密碼登錄（忘記密碼可使用免密登錄）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple7.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                10.在左側菜單中點擊 報告管理 。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple8.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                11.點擊 新建報告 按鈕打開創建報告界面。
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                12.點擊 上傳ECD 按鈕（紅框標記部分）打開文件選擇框。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple9.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                13.點擊左側 桌面（紅框標記部分） 後找出並選中之前粘貼的ECD文件，點擊右下角 打開 按鈕。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple10.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                14.載入文件後請點擊 預覽 按鈕，拖動下方圓形按鈕查看並確保ECD文件中數據是為有效數據（請參照 正常波形圖 與 雜亂波形圖），查看完畢請關閉 預覽 窗口。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple16.png">
                            </div>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple17.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                15.填寫 姓名、年齡、性別等必選項 ，選填其他內容。
                            </p>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                16.點擊 創建報告 按鈕（紅框標記部分），用戶完成所有上傳操作。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple11.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                17.等待報告生成與查看報告生成狀態（48小時內生成，請留意報告狀態）。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple12.png">
                            </div>
                            <p class="f-20 col-333 h-20 line-h-20 mt-20">
                                18.報告狀態處于 待查看 時，用戶可查看、下載報告。
                            </p>
                            <div class="clear text-center mt-40 mb-40">
                                <img src="/resources/img/news/HK-Instructions/apple13.png">
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
<!--<script src="/resources/js/comm/jquery.validate.min.js"></script>-->
<!--<script src="/resources/js/comm/jquery.validate.messages_zh.js"></script>-->
<script src="/resources/ctrl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="/resources/ctrl/layui/layui.js"></script>
<script src="/resources/js/about/HK-Instructions.js"></script>

</html>