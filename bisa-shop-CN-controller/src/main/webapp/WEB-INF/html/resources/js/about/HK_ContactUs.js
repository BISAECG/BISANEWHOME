$(document).ready(function() {
	

    // var path=$("base").attr("href");
    // /*留言部分的校验*/
    // $.validator.setDefaults({
    //     submitHandler: function() {
    //     	var cname = $(".cname").val();
    //     	var cphone = $(".cphone").val();
    //     	var cemail = $(".cemail").val();
    //     	var message = $("textarea").val();
    //        /* ajax提交留言到后台*/
    //        $.ajax({
    //     	   type:"POST",
    //     	   dataType:"text",
    //     	   url:http_request+'/contactUs',
    //     	   data:{name:cname,phone:cphone,mail:cemail,text:message},
    //     	   error:function (XMLHttpRequest, textStatus, errorThrown) { },
    //     	   success:function(data){
    //     		   if(data=="true"){
    //     			   layer.alert( "您的留言已经成功提交，两个工作日内会尽快处理，如果成功处理您的留言，我们会通过短信或者邮箱给您回复！", {
	// 		                icon: 0,
	// 		                title: '留言成功',
	// 		            });
    //     			   /*将输入框的内容清空*/
    //                    $(".cname").val("");
    //                    $(".cname").text("");
    //                    $(".cphone").val("");
    //                    $(".cphone").text("");
    //                    $(".cemail").val("");
    //                    $(".cemail").text("");
    //                    $("textarea").val("");
    //                    $("textarea").text("");
    //     		   }else{
    //     			   layer.alert("您的留言没有提交成功！请检查手机号和邮箱是否为空，然后再重新提交一次！", {
	// 		                icon: 2,
	// 		                title: '留言失败',
	// 		            });
    //     		   }
    //     	   }
    //        })
    //     }
    // });
    // $().ready(function() {
    //     // 在键盘按下并释放及提交后验证提交表单
    //     $(".contactus-form").validate({
    //         rules: {
    //             cname: {
    //                 required: true
    //             },
    //             cphone: {
    //                 required: true,
    //                 minlength:8
    //             },
    //             cabout: {
    //                 required: true
    //             },
    //             cemail:{
    //             	required: true
    //             },
    //         },
    //         messages: {
    //             cname: {
    //                 required: '请输入您的姓名'
    //             },
    //             cphone: {
    //                 required: '手机号不能为空',
    //                 minlength:'手机号最小长度8位'
    //             },
    //             cabout: {
    //                 required: '留言内容不能为空'
    //             },
    //             cemail:{
    //             	required: '邮箱不能为空'
    //             },
    //         }
    //     });
    // });
    /*--------------------我是一条华丽分割线----------------------------------*/
        // 百度地图API功能
        //创建和初始化地图函数：
        function initMap(){
            createMap();//创建地图
            setMapEvent();//设置地图事件
            addMapControl();//向地图添加控件
            addMarker();//向地图中添加marker
        }

    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(113.828452,22.76986);//定义一个中心点坐标
        map.centerAndZoom(point,18);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }

    //标注点数组
    var markerArr = [{title:"深圳市碧沙科技有限公司",content:"",point:"113.828376|22.769952",isOpen:1,icon:{w:21,h:21,l:23,t:0,x:6,lb:5}}
    ];
    //创建marker
    function addMarker(){
        for(var i=0;i<markerArr.length;i++){
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor:"#808080",
                color:"#333",
                cursor:"pointer"
            });

            (function(){
                var index = i;
                var _iw = createInfoWindow(i);
                var _marker = marker;
                _marker.addEventListener("click",function(){
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open",function(){
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close",function(){
                    _marker.getLabel().show();
                })
                label.addEventListener("click",function(){
                    _marker.openInfoWindow(_iw);
                })
                if(!!json.isOpen){
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }
    //创建InfoWindow
    function createInfoWindow(i){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
        return icon;
    }

    initMap();//创建和初始化地图


    /*选项卡js*/
    // $(".CU-list").click(function() {
    //     $(this).parent().find(".col-active").removeClass("col-active");
    //     $(this).addClass("col-active");
    // });
    // $(".CU-listv1").click(function() {
    //     $(".CU-tips").hide();
    //     $(".CU-tipsv1").show();
    // });
    // $(".CU-listv2").click(function() {
    //     $(".CU-tips").hide();
    //     $(".CU-tipsv2").show();
    // });
    // $(".CU-listv3").click(function() {
    //     $(".CU-tips").hide();
    //     $(".CU-tipsv3").show();
    // });
});

