<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String jspUrl = request.getServletPath();
%>

<header class="clear full-w min-h-120 header dip-n ">
    <div class="site-topbar ">
        <div class="container pl-0 pr-0">
            <div class="topbar-nav">
                <span style="color: #b0b0b0;"><spring:message code="name984" /></span>
                <span class="sep">|</span>
                <span style="color: #b0b0b0;">
                <spring:message code="name967" /> ：</span>
                <a id="lang-hk" href="${pageContext.request.contextPath}/index_news?lang=zh_HK">
                    <spring:message code="language.hk" />
                </a> |
                <a id="lang-cn" href="${pageContext.request.contextPath}/index_news?lang=zh_CN">
                    <spring:message code="language.cn" />
                </a> |
                <a id="lang-us" href="${pageContext.request.contextPath}/index_news?lang=en_US">
                    <spring:message code="language.us" />
                </a>
                <span><img src="<%=request.getContextPath()%>/resources/img/HK_About/hk.png" alt=""></span>
            </div>

            <div class="topbar-cart" id="J_miniCartTrigger">
                <a rel="nofollow" class="cur-d cart-mini" id="J_miniCartBtn" href="<%=request.getContextPath() %>/web/call/toCart"><i
                        class="icon-shopping-cart pr-5 f-14 " style="color: #fff;"></i>
                    <spring:message code="shopCar" />
                    <span class="cart-mini-num J_cartNum layui-badge car-blue ml-5"></span>
                </a>
                <div class="cart-menu" id="J_miniCartMenu" style="display: none;">
                    <div class="loading">
                        <div class="loader"></div>
                    </div>
                </div>
            </div>
            <div class="topbar-info" id="J_userInfo">
                <shiro:guest>
                    <a rel="nofollow" class="link" href="${pageContext.request.contextPath}/login">
                        <spring:message code="login" />
                        <span class="sep">|</span>
                            <%--<spring:message code="register"/>--%>
                    </a>
                    <a rel="nofollow" class="link" href="https://192.168.1.74/reg">
                        <spring:message code="register" />
                    </a>
                </shiro:guest>

                <shiro:user>
                    <a rel="nofollow" class="link" id="xixin" href="<%=request.getContextPath()%>/user/userCenter">
                        <shiro:principal />
                        <span class="sep">|</span>
                        <a rel="nofollow" class="link" href="<%=request.getContextPath()%>/logout">退出</a>

                        <div class="clear pos-a l-0 bg-white full-w z--1 bor bor-col-ccc userCenter dis-n">
                            <p class="h-30 line-h-30 text-center f-14">
                                <a class="hovecol-black" style="color: #333" href="<%=request.getContextPath()%>/user/orderCenter">
                                    <spring:message code="orderCenter" /></a>
                            </p>
                            <p class="h-30 line-h-30 text-center f-14">
                                <a class="hovecol-black" style="color: #333" href="<%=request.getContextPath()%>/user/userCenter">
                                    <spring:message code="userCenter" /></a>
                            </p>
                        </div>
                    </a>
                </shiro:user>

                <span class="sep">|</span>

                <a id="appDown" rel="nofollow" href="javascript:void(0)">
                    <spring:message code="appdownload" />
                    <div class="clear pos-a z-99 bg-white h-150 z--1 bor bor-col-ccc t-29 appDown dis-n" style="width:160px;height: auto;">
                        <div class="clear full-w pt-10 pl-10 pr-10 text-center">
                            <img class="img-80" src="<%=request.getContextPath()%>/resources/img/index/app_qr.png" alt="">
                        </div>
                        <p class="h-30 line-h-30 text-center f-14">
                            <spring:message code="scandownload" />
                        </p>
                        <p class="line-h-20 f-12 text-center">
                            <spring:message code="WXscan" />
                        </p>

                    </div>
                </a>
            </div>
        </div>
    </div>


    <div class="container">

        <div class="col-xs-2 pt-25 pb-25 pl-0 pr-0">
            <a href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath()%>/resources/img/index/logov1.png"
                                                               alt=""></a>
        </div>
        <div class="clear col-xs-10 pl-0 pr-0 mt-40">


            <!--产品与服务-->
            <div class="col-xs-12 pt-15 pl-0 pr-0 mgl-2">
                <ul class="col-xs-10 clo-md-9 pull-left mainnav clear dis-ib pl-0 pr-0" style="width: 100%;">
                    <li class="col-xs-2 text-center f-14 cur-p pd-10 f-w">
                        <a id="1000A" class="col-309DE2 t-nonehove <% if(jspUrl.contains(" index")){ %>navborpitch
							<% } %> pb-7" href="
							<%=request.getContextPath()%>/index">
                            <spring:message code="homepage" /></a>
                    </li>
                    <li class="col-xs-2 text-center f-14 cur-p pd-10 f-w ">
                        <a id="2000A" class="col-309DE2 t-nonehove <% if(jspUrl.contains(" menuList")){ %>navborpitch
							<% }%> pb-7" href="
							<%=request.getContextPath()%>/menuList">
                            <spring:message code="Services" /></a>
                        <!--鼠标经过context-->
                        <div class="mainnav_list mainnav_list_w-mc" style="display: none;" id="menuList">
                            <div class="mainnav_li">
                                <div class="mainnav_list_left">
									<span class="mainnav_list_title"><a href="<%=request.getContextPath()%>/menuList?class_id=1">
											<spring:message code="name810" /></a></span>
                                    <span>|</span>
                                    <ul>
                                        <li><a href="<%=request.getContextPath()%>/web/call/goodsDetail?goodsNumber=BISA201812212041499694">
                                            <spring:message code="name811" /></a></li>
                                        <li><a href="<%=request.getContextPath()%>/web/call/goodsDetail?goodsNumber=BISA201812212045364724">
                                            <spring:message code="name812" /></a></li>
                                        <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                                        <%--<spring:message code="name815" /></a></li>--%>
                                        <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                                        <%--<spring:message code="name816" /></a></li>--%>
                                    </ul>
                                </div>
                                <div class="mainnav_list_right">
									<span class="mainnav_list_title"><a href="<%=request.getContextPath()%>/menuList?class_id=5
">
											<spring:message code="name856" /></a></span>
                                    <span>|</span>
                                    <ul>
                                        <li><a href="<%=request.getContextPath()%>/web/call/goodsDetail?goodsNumber=BISA201812212002536092">
                                            <spring:message code="name857" /></a></li>
                                        <li><a href="<%=request.getContextPath()%>/web/call/goodsDetail?goodsNumber=BISA201812212007406365">
                                            <spring:message code="name858" /></a></li>
                                    </ul>
                                </div>

                                <div class="mainnav_list_hr"></div>
                            </div>
                            <%--摄像头产品区--%>
                            <div class="mainnav_li">
                                <div class="mainnav_list_left">
									<span class="mainnav_list_title">
                                        <a href="<%=request.getContextPath()%>/menuList?class_id=2">
											<spring:message code="name859" />
											<spring:message code="name871" />
                                        </a>
                                    </span>
                                    <span>|</span>
                                    <ul>
                                        <li>
                                            <a href="<%=request.getContextPath()%>/web/call/goodsDetail?goodsNumber=BISA201905311118472520">
                                                <spring:message code="name860"/>
                                            </a>
                                        </li>
                                        <%--<li>--%>
                                            <%--<a href="<%=request.getContextPath()%>/certificateing">--%>
                                                <%--<spring:message code="name975"/>--%>
                                            <%--</a>--%>
                                        <%--</li>--%>
                                    </ul>
                                </div>

                                <div class="mainnav_list_hr"></div>
                            </div>

                            <%--<div class="mainnav_li">--%>
                            <%--<div class="mainnav_list_left">--%>
                            <%--<span class="mainnav_list_title"><a href="<%=request.getContextPath()%>/menuList?class_id=3--%>
                            <%--">--%>
                            <%--<spring:message code="name862" />--%>
                            <%--<spring:message code="name871" /></a></span>--%>
                            <%--<span>|</span>--%>
                            <%--<ul>--%>
                            <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                            <%--<spring:message code="name863" /></a></li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>

                            <%--<div class="mainnav_list_hr"></div>--%>
                            <%--</div>--%>

                            <%--<div class="mainnav_li">--%>
                            <%--<div class="mainnav_list_left">--%>
                            <%--<span class="mainnav_list_title"><a href="<%=request.getContextPath()%>/menuList?class_id=17">--%>
                            <%--<spring:message code="name864" />--%>
                            <%--<spring:message code="name871" /></a></span>--%>
                            <%--<span>|</span>--%>
                            <%--<ul>--%>
                            <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                            <%--<spring:message code="name865" /></a></li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>

                            <%--<div class="mainnav_list_hr"></div>--%>
                            <%--</div>--%>

                            <%--<div class="mainnav_li">--%>
                            <%--<div class="mainnav_list_left">--%>
                            <%--<span class="mainnav_list_title"><a href="<%=request.getContextPath()%>/menuList?class_id=19--%>
                            <%--">--%>
                            <%--<spring:message code="name866" />--%>
                            <%--<spring:message code="name871" /></a></span>--%>
                            <%--<span>|</span>--%>
                            <%--<ul>--%>
                            <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                            <%--<spring:message code="name867" /></a></li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>
                            <%--</div>--%>


                            <%--</div>--%>

                            <%--</li>--%>


                    <li class="col-xs-2 text-center f-14 cur-p pd-10 f-w">
                        <a id="3000A" class="col-309DE2 t-nonehove pb-7 <% if(jspUrl.contains(" solution")){ %>navborpitch
							<% } %> " href="
							<%=request.getContextPath()%>/solution">
                            <spring:message code="solution" /></a>
                        <div class="mainnav_list mainnav_list_w-mc" style="display: none;" id="solution">
                            <div class="mainnav_li">
                                <div class="mainnav_list_left">
									<span class="mainnav_list_title">
										<spring:message code="solution" /></span>
                                    <span>|</span>
                                    <ul>
                                        <li>
                                            <spring:message code="name868" />
                                            <spring:message code="solution" />
                                        </li>
                                        <li>
                                            <spring:message code="name869" />
                                            <spring:message code="solution" />
                                        </li>
                                        <li>
                                            <spring:message code="name870" />
                                            <spring:message code="solution" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%--健康咨询--%>
                    <li class="col-xs-2 text-center f-14 cur-p pd-10 f-w">
                        <a id="4000A" class="col-309DE2 t-nonehove   pb-7" href="<%=request.getContextPath()%>/web/call/healthInquiry">
                            <spring:message code="information" /></a>
                        <div class="mainnav_list mainnav_list_w-mc" style="display: none;" id="certificate">
                            <%--<div class="mainnav_li">--%>
                                <%--<div class="mainnav_list_left">--%>
									<%--<span class="mainnav_list_title">--%>
										<%--<spring:message code="information" /></span>--%>
                                    <%--<span>|</span>--%>
                                    <%--<ul>--%>
                                        <%--<li><a href="<%=request.getContextPath()%>/web/call/healthInquiry">--%>
                                            <%--<spring:message code="information" /></a></li>--%>
                                        <%--<li><a href="<%=request.getContextPath()%>/certificate">--%>
                                            <%--<spring:message code="name982" /></a></li>--%>
                                    <%--</ul>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                    </li>
                    <%--产品证书--%>
                    <li class="col-xs-2 text-center f-14 cur-p pd-10 f-w">
                        <a id="5000A" class="col-309DE2 t-nonehove  <% if(jspUrl.contains(" certificate")){ %>navborpitch
							<% }%> pb-7" href="
							<%=request.getContextPath()%>/certificate">
                            <spring:message code="certificate" /></a>
                        <div class="mainnav_list mainnav_list_w-mc" style="display: none;" id="certificate">
                            <div class="mainnav_li">
                                <div class="mainnav_list_left">
									<span class="mainnav_list_title">
										<spring:message code="certificate" /></span>
                                    <span>|</span>
                                    <ul>
                                        <li><a href="<%=request.getContextPath()%>/certificate">
                                            <spring:message code="name880" /></a></li>
                                        <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                                        <%--<spring:message code="name859" />--%>
                                        <%--<spring:message code="certificate" /></a></li>--%>
                                        <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                                        <%--<spring:message code="name862" />--%>
                                        <%--<spring:message code="certificate" /></a></li>--%>
                                        <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                                        <%--<spring:message code="name864" />--%>
                                        <%--<spring:message code="certificate" /></a></li>--%>
                                        <%--<li><a href="<%=request.getContextPath()%>/certificateing">--%>
                                        <%--<spring:message code="name866" />--%>
                                        <%--<spring:message code="certificate" /></a></li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>

                    <li class="col-xs-2 text-center f-14 cur-p pd-10 f-w">
                        <a id="6000A" class="col-309DE2 t-nonehove  <% if(jspUrl.contains(" ContactUs")){ %>navborpitch
							<% } %> pb-7" href="
							<%=request.getContextPath()%>/contactUs">
                            <spring:message code="relation" /></a>
                    </li>
                    <li class="dis-n">
                        <a id="7000A" class="dis-n <% if(jspUrl.contains(" user")||
						 jspUrl.contains("shopping")||jspUrl.contains("order")||jspUrl.contains("solution")||jspUrl.contains("active")){
						 %>
							<% } %>" href="javascript:;"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<div class="home-right-bar J_homeRightBar">
    <div class="bar-l">
        <div id="J_rightbar_l">
            <ul class="bar-top">
                <li class="bar-sort bar-sort-qr"> <a href="javascript:;" class="bar-link">
                    <div class="bar-img">
                        <img class="original-img" src="https://i8.mifile.cn/b2c-mimall-media/98a23aae70f25798192693f21c4d4039.png">
                        <img class="hover-img dis-n" src="https://i8.mifile.cn/b2c-mimall-media/74c4fcb4475af8308e9a670db9c01fdf.png">
                    </div>
                    <p class="bar-text">
                        <spring:message code="name985" />
                    </p>
                    <div class="bar-pop">
                        <div class="bar-pop-content dis-n">
                            <img src="<%=request.getContextPath() %>/resources/img/index/app_qr.png" class="bar-pop-qr">
                            <p class="bar-pop-text">
                                <spring:message code="scandownload" />
                                <spring:message code="WXscan" />
                            </p>
                        </div>
                    </div>
                </a> </li>
                <li class="bar-sort"> <a href="<%=request.getContextPath() %>/user/userCenter" class="bar-link">
                    <div class="bar-img">
                        <img class="original-img" src="https://i8.mifile.cn/b2c-mimall-media/55cad219421bee03a801775e7309b920.png">
                        <img class="hover-img dis-n" src="https://i8.mifile.cn/b2c-mimall-media/41f858550f42eb1770b97faf219ae215.png">
                    </div>
                    <p class="bar-text">
                        <spring:message code="name30" />
                    </p>
                </a>
                </li>
                <li class="bar-sort"> <a href="<%=request.getContextPath() %>/user/orderCenter" class="bar-link">
                    <div class="bar-img">
                        <img class="original-img" src="https://i8.mifile.cn/b2c-mimall-media/55cad219421bee03a801775e7309b920.png">
                        <img class="hover-img dis-n" src="https://i8.mifile.cn/b2c-mimall-media/41f858550f42eb1770b97faf219ae215.png">
                    </div>
                    <p class="bar-text">
                        <spring:message code="name28" />
                    </p>
                </a> </li>
                <li class="bar-sort bar-l-car"> <a href="<%=request.getContextPath() %>/web/call/toCart" class="bar-link">
                    <div class="bar-img">
                        <img class="original-img" src="https://i8.mifile.cn/b2c-mimall-media/d7db56d1d850113f016c95e289e36efa.png">
                        <img class="hover-img dis-n" src="https://i8.mifile.cn/b2c-mimall-media/692a6c3b0a93a24f74a29c0f9d68ec71.png">
                        <span class="bar-car hidden J_barLMum J_homeRightbarCarNum">0</span> </div>
                    <p class="bar-text">
                        <spring:message code="shopCar" />
                        <span class="cart-mini-num J_cartNum layui-badge layui-bg-blue ml-5"></span>
                    </p>
                    <div class="pop"></div>
                </a> </li>
            </ul>
        </div>
        <a class="bar-totop bar-sort J_barToTop J_barToTopL" href="javascript:;">
            <div class="bar-img">
                <img class="original-img" src="//i1.mifile.cn/f/i/2018/home/totop.png">
                <img class="hover-img  dis-n" src="//i1.mifile.cn/f/i/2018/home/totop_hover.png">
            </div>
            <p class="bar-text">
                <spring:message code="name986" />
            </p>
        </a>
    </div>

</div>
<style>
    .car-blue{
        background: #1E9FFF;
        color: #ffffff;
    }
    .site-topbar a:hover {
        color: #309DE2;
    }
    .mainnav_list a:hover{

        color: #309DE2;
    }

    #J_miniCartBtn:hover {
        cursor: pointer;
    }
    .site-topbar {
        position: relative;
        z-index: 30;
        height: 40px;
        font-size: 12px;
        color: #b0b0b0;
        background: #333;
    }
    .site-topbar .topbar-nav {
        float: left;
        height: 40px;
        line-height: 40px;
    }
    .site-topbar a {
        /*color: #fff;*/
        color: #b0b0b0;
        line-height: 40px;
        display: inline-block;
        *zoom: 1;
        *display: inline;
    }
    .site-topbar .sep {
        margin: 0 .5em;
        color: #b0b0b0;
    }
    .site-topbar .topbar-cart {
        width: 145px;
        margin-left: 15px;
    }
    .site-topbar .topbar-cart, .site-topbar .topbar-info {
        position: relative;
        float: right;
        _display: inline;
        height: 40px;
    }
    .site-topbar .cart-mini {
        position: relative;
        z-index: 32;
        display: block;
        height: 40px;
        line-height: 40px;
        text-align: center;
        color: #fff;
        background: #424242;
    }

    .site-topbar .cart-mini i {
        margin-right: 4px;
        font-size: 20px;
        line-height: 20px;
        vertical-align: -4px;

    }

    .home-right-bar {
        position: fixed;
        bottom: 70px;
        right: 0;
        z-index: 999999;
    }
    .home-right-bar .bar-top {
        padding: 0;
        margin: 0;
        border-top: 1px solid #f5f5f5;
    }
    .home-right-bar .bar-sort {
        position: relative;
        display: block;
        width: 82px;
        height: 90px;
        list-style: none;
        background-color: #fff;
        border: 1px solid #f5f5f5;
        border-top: none;
    }
    .home-right-bar .bar-link {
        display: block;
        height: 100%;
    }
    .home-right-bar .bar-img {
        position: relative;
        width: 30px;
        height: 30px;
        padding-top: 20px;
        margin: 0 0 0 27px;
    }
    .home-right-bar .bar-img .original-img {
        background-color: #fff;
    }
    .home-right-bar .bar-img img {
        width: 30px;
        height: 30px;
        border: none;
    }
    .home-right-bar .bar-text {
        margin: 28px 0 0 0;
        color: #757575;
        font-size: 14px;
        text-align: center;
    }
    .home-right-bar .bar-pop {
        position: absolute;
        left: -137px;
        top: 0;
        display: block;
        height: 187px;
    }
    .home-right-bar .bar-pop .bar-pop-content {
        float: left;
        overflow: hidden;
        background: #fff;
        border: 1px solid #f5f5f5;
    }
    .home-right-bar .bar-pop .bar-pop-qr {
        width: 100px;
        height: 100px;
        margin: 20px 14px;
        background: #fff;
        border: 0;
    }
    .home-right-bar .bar-sort-qr .bar-pop .bar-pop-text {
        width:130px;
        margin: -10px auto 0;
        color: #757575;
        font-size: 14px;
        text-align: center;
        margin: 0;}
</style>
<script>
window.onload = function(){
/*app二维码显示隐藏*/
    $("#appDown").mouseenter(function() {
        $(".appDown").removeClass("dis-n")
    });
    $("#appDown").mouseleave(function() {
        $(".appDown").addClass("dis-n")

    });
    $(".bar-sort-qr").mouseenter(function() {
        $(".bar-pop-content").removeClass("dis-n")
    });
    $(".bar-sort-qr").mouseleave(function() {
        $(".bar-pop-content").addClass("dis-n")

    });

    $(".cat-item-title").mouseenter(function() {
        $(this).find(".cat-item-hidden-children").css("display", "block");
    });
    $(".cat-item-title").mouseleave(function() {
        $(this).find(".cat-item-hidden-children").css("display", "none");
    });
    $(".cat-item-hidden-children").mouseenter(function() {
        $(this).css("display", "blcok");
    });
    $(".cat-item-hidden-children").mouseleave(function() {
        $(this).css("display", "none");
    });
}


</script>