<div class="header">
    <link href='/resources/ctrl/bootstrap-3.3.7-dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='/resources/css/index/head.css' rel='stylesheet'>
    <link href='/resources/ctrl/font-awesome-4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <script src='/resources/js/comm/jquery.min.js'></script>
    <script src='/resources/js/index/head.js'></script>
    <!--[if lt IE 9]>
    　　 <script src="https://cdn.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src = "http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <nav class='navbar' style='background: #F1F1F1;'>
        <div class='container'>
            <div class='row'>
                <div class='col-md-6'>
                    <span>Hello, welcome to Bisa health!</span>
                    <span class='sep navTitle'>|</span>
                    <span>Language:</span>
                    <a id='lang-hk' href='/index?lang=zh_HK'>繁體</a>
                    <span  class="navTitle">|</span>
                    <a id='lang-cn' href='/index?lang=zh_CN'>简体</a>
                    <span  class="navTitle">|</span>
                    <a id='lang-us' href='/index?lang=en_US'>English</a>
                    <img src='/resources/img/HK_About/hk.png'>
                </div>
                <div class="col-md-3 col-md-offset-3 loginDiv">
                  
                </div>
            </div>
        </div>
    </nav>
    <div class='container head mb-20'>
        <div class='row pos-r navLogo'>
            <div class='col-md-2 pos-a'>
                <a href='index.html'>
                    <img class='img-responsive center-block' src='/resources/img/index/logov1.png' alt='bisahealth'>
                </a>
            </div>
            <span class="pull-left" style="display: inline-block;width: 2px;height: 80px;background:#F1F1F1;margin-right: 0px;"></span>
            <div class='pull-left' style='margin-left: 5px;margin-top: 10px;'>
                <p style='color: #204792;font-size:16px;font-weight:bold;'>Health,starting from your "heart"</p>
                <p style='font-size:14px;font-weight:400;color:rgba(14,48,115,1);'>Monitor ECG without leaving your home</p>
                <p style='font-size:14px;font-weight:400;color:rgba(14,48,115,1);'>Keep you indoors for ECG measurements</p>
            </div>
            <div class='pull-right'>
                <div class='pull-left  text-center' style='margin: 0 20px;'>
                    <img style='margin-bottom: 11px;margin-top: 9px;' src='/resources/img/index/logo1.png'
                         alt='CFDA certification'>
                    <p style='font-size: 12px;margin-bottom: 5px;'>National certification</p>
                    <p style='font-size: 12px;'>medical instruments</p>
                </div>
                <span class='inline-block pull-left' style='height:78px;border-left: 2px solid #F1F1F1;'></span>
                <div class='pull-left  text-center' style='margin: 0 20px;'>
                    <img style='margin-bottom: 11px' src='/resources/img/index/logo2.png' alt="EU CE certification">
                    <p style='margin-bottom: 5px;font-size: 12px;'>EU CE</p>
                    <p style='font-size: 12px;'>Certified products</p>
                </div>
                <span class='inline-block pull-left' style='height:78px;border-left: 2px solid #F1F1F1;'></span>
                <div class='pull-left  text-center' style='margin: 0 20px;'>
                    <img style='margin-bottom: 5px' src='/resources/img/index/logo3.png' alt="Intellectual property patent works">
                    <p style='font-size: 12px;margin-bottom: 5px;'>Intellectual Property Office</p>
                    <p style='font-size: 12px;'>Patent work</p>

                </div>
                <span class='inline-block pull-left' style='height:78px;border-left: 2px solid #F1F1F1;'></span>
                <div class='pull-left  text-center' style='margin: 0 20px;'>
                    <img style='margin-bottom: 7px;' src='/resources/img/index/logo4.png' alt="Bisa Health Health Hotline">
                    <p style='font-size: 12px;padding-bottom: 2px;'>Health Hotline</p>
                    <p class='phone' style='font-size: 18px;font-weight: bold;'>${company_phone}</p>
                </div>
            </div>
        </div>
    </div>
    <div style='background: #3592D0;'>
        <div class='container'>
            <div class='row'>
                <!--<%&#45;&#45;列表欄菜單&#45;&#45;%>-->
                <ul class='nav bisa-nav text-center head pull-left'>

 					<#list empList as item>
					 	 <li class='col-309DE2 pull-left ml-20'>
                        	<a class='navlist' href='${item.name}.html'>
                        	  ${item.column_name_US}
		                    </a>
		                 </li>
						 <#if (item_index == 0)>
		                    <li class='col-309DE2 pull-left ml-20 headList'>
		                        <a class='navlist pos-r ' href="javascript:void(0);">News </a>
		                        <ul class="pos-a">
		                            <li style="list-style: none;">
		                                <a class='navlist' href='news.html'>Bisa News</a>
		                            </li>
		                            <li style="list-style: none;">
		                                <a class="navlist" href='qa.html'>Q&A</a></li>
		                        </ul>
		                    </li>
						 </#if>
					
					</#list>
					<!-- 国内到淘宝和JD购买-->                   
                     <li class=' pull-left ml-20' style='background: #225185;'>
                        <a class='buy' href='shop.html'>
                            Product
                        </a>
                    </li>
                    <li class=' pull-left ml-20' style='background: #f40;'>
                        <a class='tb' target="_blank" href="https://shop194684580.taobao.com/?spm=a230r.7195193.1997079397.2.6815114b089AGi">
                            Taobao
                        </a>
                    </li>
                    <li class='pull-left ml-20' style='background: #D71C1E;'>
                        <a class='jd' target="_blank" href="https://mall.jd.com/index-10103348.html">
                            Jingdong
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <div class='home-right-bar J_homeRightBar'>
        <div class='bar-l '>
            <div id='J_rightbar_l' style='margin-bottom: 15px;'>
                <ul class='bar-top' style="list-style: none;">
                    <li class='bar-sortS'  style="list-style: none;">
                        <a href='instructions.html' class='bar-link pos-r'>
                            <img id='bar-sort3' src='/resources/img/index/Sidebar3.png' alt="Instructions for using Bisha ECG">
                            <span class='pos-a text-center' style='top: 64%;left: 19%;color: #fff;'>
                                Tutorial
                            </span>
                        </a>
                    </li>
                    <li class='bar-sortS' style="list-style: none;">
                        <a href='down.html' class='bar-link pos-r'>
                            <img id='bar-sort1' src='/resources/img/index/Sidebar1.png' alt="Download app">
                            <span class='pos-a' style='top: 64%;left: 5%;color: #fff;'>
                                Download
                            </span>
                        </a>
                    </li>
                    <li class='bar-sort'>
                        <a href='book.html' title='Leave message' styele='cursor:not-allowed;' class='bar-link pos-r'>
                            <img id='bar-sort2' src='/resources/img/index/Sidebar2.png' alt="Leave message">
                            <span class='pos-a' style='top: 56%;left:10%;color: #fff;'>
                                Message
                            </span>
                        </a>
                    </li>
                    <li class='bar-sort'>
                        <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=3299503761&site=qq&menu=yes' class='pos-r'>
                            <img id='bar-sort4' border='0' src='/resources/img/index/Sidebar4.png' alt="QQ Service"
                                 title='Click here to send me a message'/>
                            <span class='pos-a' style='top: 225%;left: 35%;color: #fff;'>
                                QQ
                            </span>
                        </a>
                    </li>
                </ul>
            </div>
            <a class='bar-totop bar-sort J_barToTop J_barToTopL  pos-r' href='javascript:;'>
                <img class='original-img' src='/resources/img/index/Sidebar5.png' alt="Top">
                <span class='pos-a' style='top: 90%;left: 32%;color: #fff;'>
                    Top
                </span>
            </a>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
            url: '/isLogin',
            type: "GET",
            async: false,
            success: function (data) {
            	if(data.code=="0"){
            	    $(".loginDiv").html("<a class='pull-left' href='/html/en_US/user.html'>"+data.data+"</a>"+
                      "<sapn class='pull-left navDivision'></sapn>"+
                      "<a class='pull-left navReg'  href='/logout?lang=en_US'>Exit</a>");
            	}else{
            	    $(".loginDiv").html("<a class='pull-left' href='/login?lang=en_US'>Login</a>"+
                      "<sapn class='pull-left navDivision'></sapn>"+
                      "<a class='pull-left navReg'  href='/login?lang=en_US'>Register</a>");
            	}
            	
            }
     });
	});
</script>
