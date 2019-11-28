<div class="header">
    <link href='../resources/ctrl/bootstrap-3.3.7-dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='../resources/css/index/head.css' rel='stylesheet'>
    <link href='../resources/ctrl/font-awesome-4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <script src='../resources/js/comm/jquery.min.js'></script>
    <script src='../resources/js/index/head.js'></script>
    <!--[if lt IE 9支持html5代碼]-->
    <script src='https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js'></script>
    <script src='https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js'></script>
    <nav class='navbar' style='background: #F1F1F1;'>
        <div class='container'>
            <div class='row'>
                <div class='col-md-6'>
                    <span style='color: #b0b0b0;'>
                    Hello, welcome to Bisa health!
                    </span>
                    <span class='sep'>|</span>
                    <span style='color: #b0b0b0;'>
                        Language:</span>
                    <a id='lang-hk' href='/index.html?lang=zh_HK'>
                        Traditional
                    </a> |
                    <a id='lang-cn' href='/index.html?lang=zh_CN'>
                        Simplified
                    </a> |
                    <a id='lang-us' href='/index.html?lang=en_US'>
                        English
                    </a>
                    <span><img src='../resources/img/HK_About/hk.png'></span>
                </div>
                <div class="col-md-3 col-md-offset-3">
                    <a class="pull-left " href="/login">
                        login
                    </a>
                    <sapn class="pull-left"
                          style="display: inline-block;width:1px;height: 15px;margin:8px 8px 0px 8px;background:#666666;"></sapn>
                    <a class="pull-left " style="color:red;" href="reg.html">
                        res
                    </a>
                </div>
            </div>

        </div>
    </nav>
    <div class='container head mb-10'>
        <div class='row pos-r'>
            <div class='col-md-2 pos-a' style='height: 100px;left: 0;padding-right: 0px;'>
                <a href='index.html' >
                    <img class='img-responsive center-block'  src='../resources/img/index/logov1.png'  alt='碧沙康健logo'>
                </a>
            </div>
            <span class="pull-left" style="display: inline-block;width: 2px;height: 80px;background:#F1F1F1;margin-right: 15px;"></span>
            <div class='pull-left' style='margin-left: 5px;margin-top: 10px;'>
                <p style='color: #204792;font-size:16px;font-weight:bold;' >Health, starting from your "heart"</p>
                <p style='font-size:14px;font-weight:400;color:rgba(14,48,115,1);'>Monitor ECG without leaving your home</p>
                <p style='font-size:14px;font-weight:400;color:rgba(14,48,115,1);'>Keep you indoors for ECG measurements</p>
            </div>
            <div class='pull-right'>
                <div class='pull-left  text-center'  style='margin: 0 20px;'>
                    <img style='margin-bottom: 11px;margin-top: 9px;'  src='../resources/img/index/logo1.png'
                         alt='CFDA certification'>
                    <p style='font-size: 12px;margin-bottom: 5px;'>National certification</p>
                    <p style='font-size: 12px;'>medical instruments</p>
                </div>
                <span class='inline-block pull-left' style='height:78px;border-left: 2px solid #F1F1F1;'></span>
                <div class='pull-left  text-center' style='margin: 0 20px;'>
                    <img style='margin-bottom: 11px' src='../resources/img/index/logo2.png'  alt="EU CE certification">
                    <p  style='margin-bottom: 5px;font-size: 12px;'>EU CE</p>
                    <p style='font-size: 12px;'>ertified products</p>
                </div>
                <span class='inline-block pull-left' style='height:78px;border-left: 2px solid #F1F1F1;'></span>
                <div class='pull-left  text-center' style='margin: 0 20px;'>
                    <img style='margin-bottom: 5px' src='../resources/img/index/logo3.png'  alt="Intellectual property patent works">
                    <p style='font-size: 12px;margin-bottom: 5px;'>Intellectual Property Office</p>
                    <p style='font-size: 12px;'>Patent work</p>

                </div>
                <span class='inline-block pull-left' style='height:78px;border-left: 2px solid #F1F1F1;'></span>
                <div class='pull-left  text-center' style='margin: 0 20px;'>
                    <img style='margin-bottom: 7px;' src='../resources/img/index/logo4.png' alt="Bisha Kangjian Health Hotline">
                    <p style='font-size: 12px;'>Health Hotline</p>
                <#--公司地址-->
                    <p class='phone' style='font-size: 16px;font-weight: bold;'>${company_phone}</p>
                </div>
            </div>
        </div>
    </div>
    <div style='background: #3592D0;'>
        <div class='container'>
            <div class='row'>
                <!--<%&#45;&#45;列表欄菜單&#45;&#45;%>-->
                <ul class='nav bisa-nav text-center head pull-left'>
                    <#list empList! as emp>
					 
					 
						<#if emp_index = empList?size-1>
							  <li class='col-309DE2  text-center head_list pull-left ml-20'>
                        		<a class='navlist' href='${emp.name!}.html'>
                        			${emp.column_name_US!}
                        		</a>
                    		  </li>
						<#else>
							 <li class='col-309DE2 pull-left ml-20'>
		                        <a class='navlist' href='${emp.name!}.html'>
		                        	${emp.column_name_US!}
		                        </a>
                       		</li>
						</#if>
					</#list>
                    <li class=' pull-left ml-20' style='background: #f40;'>
                        <a class='tb'>
                            淘寶商城
                        </a>
                    </li>
                    <li class='pull-left ml-20' style='background: #D71C1E;'>
                        <a class='jd'>
                            京東自營
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
                    <li class='bar-sortS'>
                        <a href='Instructions' class='bar-link pos-r'>
                            <img id='bar-sort1' src='../resources/img/index/Sidebar1.png' alt="Download app">
                            <span class='pos-a' style='top: 64%;left: 5%;color: #fff;' >
                                Download
                            </span>
                        </a>
                    </li>
                    <li class='bar-sort' >
                        <a href='#;' title='Message board is still under construction' styele='cursor:not-allowed;' class='bar-link pos-r'>
                            <img id='bar-sort2' src='../resources/img/index/Sidebar2.png'  alt="message board">
                            <span class='pos-a' style='top: 56%;left: 25%;color: #fff;'>
                                board
                            </span>
                        </a>
                    </li>
                    <li class='bar-sort' >
                        <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=3299503761&site=qq&menu=yes' class='pos-r'>
                            <img id='bar-sort4' border='0' src='../resources/img/index/Sidebar4.png'  alt="QQ Service"
                                 title='Click here to send me a message'/>
                            <span class='pos-a' style='top: 225%;left: 35%;color: #fff;'>
                                QQ
                            </span>
                        </a>
                    </li>
                </ul>
            </div>
            <a class='bar-totop bar-sort J_barToTop J_barToTopL  pos-r' href='javascript:;'>
                <img class='original-img' src='../resources/img/index/Sidebar5.png'  alt="Top">
                <span class='pos-a' style='top: 90%;left: 32%;color: #fff;'>
                    Top
                </span>
            </a>
        </div>
    </div>
</div>
