<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon"/>
    <meta http-equiv="Content-Type" content="text/html;"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <!-- necessary -->
    <meta name="keywords" content="${html_keyWord}">
    <meta name="description" content="${html_description}">
    <title>${html_title}</title>
    <!-- description -->
    <meta name="renderer" content="webkit">
    <!-- base -->
    <link href="/resources/ctrl/layui/css/layui.css" rel="stylesheet">
    <link href="/resources/css/comm/base.css" rel="stylesheet">
    <link href="/resources/css/index/index.css" rel="stylesheet">
    <link href="/resources/css/index/board.css" rel="stylesheet">
    <script src="/resources/js/comm/jquery.min.js"></script>
  	<script src="/resources/ctrl/layui/layui.js"></script>
    <style>
        ul li{
            list-style: square;
        }
    </style>
</head>

<body>
<div id="header"></div>
<script>
    $("#header").load("header.html");
</script>
<div class="container-fluid">
    <div class="row">
        <img class="img-responsive " src="/resources/img/index/board.png">
    </div>
</div>
<div class="container">
    <div class="row contactInfo">
        <p class="boardTitle">我需要购买咨询</p>
        <div class="col-md-7 boardLeft">
            <div class="col-md-10">
                <p class="leftTitle">联系销售人员</p>
                <p>
                    <span>销售咨询(中国):</span>
                    <span>(86) 0755-2688 0962</span>

                </p>
                <p class="mb-20">
                    <span>销售咨询(香港):</span>
                    <span>(852) 2423 0600&nbsp;|&nbsp;(852) 2423 0791</span>
                </p>
                <p class="mb-20">
                    <span>传真:</span>
                    <span>(852) 2423 0148</span>
                </p>
                <p class="mb-30">
                    <span>直接致电销售人员,立即进行购买咨询,</span>
                    <span>工作日</span>
                    <span style="color: #E5481E;">早9:00—晚6:00</span>
                </p>
            </div>
            <div class="col-md-2 ">
                <img class="img-responsive center-block" src="/resources/img/index/board-1.png">
            </div>
        </div>
        <div class="col-md-5 boardRight">
            <div>
                <p>在线客服</p>
                <p>
                    即时回复，为您提供快速便捷的服务体验,工作时间早9:00—晚6:00
                </p>
                <button>
                    <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=3299503761&site=qq&menu=yes' >在线咨询</a>
                </button>
            </div>
        </div>
    </div>
    <p class="boardTitle ">您也可以留言给我们</p>
</div>
<div class="message" >
    <div class="container">
        <div class="row">
            <p >在线留言</p>
        </div>
    </div>
</div>
<div class="container">
    <div class="row messageTwo" >
        <p>温馨提示：如您对我们的产品或其他相关问题有疑问，均可在下方留言提交您的问题，我们的销售人员会回复您。</p>
    </div>
    <form class="layui-form" id="messageForm" action="">
        <div class="row messageThere" >
            <div class="form-group col-md-3" style="">
                <label for="name" class="control-label">姓名:</label>
                <input type="text" class="form-control" required  lay-verify="required" name="name" id="name" lay-reqText="请输入姓名" placeholder="请输入姓名">
            </div>
            <div class="form-group col-md-3">
                <label for="phone" class="control-label">电话:</label>
                <input type="text" class="form-control" required  lay-verify="required" name="phone" id="phone" lay-reqText="请输入电话" placeholder="请输入电话">
            </div>
            <div class="form-group col-md-3">
                <label for="email" class="control-label">邮箱:</label>
                <input type="email" class="form-control" required  lay-verify="required|email" name="mail" id="mail"  lay-reqText="请输入邮箱" placeholder="请输入邮箱">
            </div>
            <div class="form-group col-md-3">
                <label for="message_type" class="control-label">类别:</label>
                <select class="form-control" name="message_type" lay-reqText="请输入类别" lay-verify="required" id="category">
                    <option value="1">个人</option>
                    <option value="2">企业</option>
                    <option value="3">医院</option>
                </select>
            </div>

        </div>
        <div class="row messageFour" >
            <p>留言:</p>
            <textarea class="form-control" rows="5" name="message" lay-reqText="请输入留言" lay-verify="required" placeholder="请输入留言" ></textarea>
        </div>
        
        <div class="row pt-10">
        	  <div class="layui-input-inline">
      			<img alt="" id="imgCode" src="/common/kaptcha"> 
    		  </div> 
    		  <div class="layui-input-inline">
                   <input type="code" id="code" name="code" required lay-verify="required" lay-reqText="请输入验证码" placeholder="请输入验证码" autocomplete="off" class="layui-input">
    		  </div> 
    		   
    	</div>
    	<div class="row text-center pt-10 pb-10">
    		 <div class="layui-input-inline">
                    <button class="layui-btn f-20" lay-submit="" lay-filter="formDemo">立即提交</button>
    		  </div>
    	</div>
    </form>
</div>
<div id="footer"></div>
<script>
    $("#footer").load("footer.html");
</script>

<script type="text/javascript">
    //加载layui
    layui.use(['element','form'], function () {
        var layer = layui.layer,
                element = layui.element,
                form = layui.form,
                $=layui.jquery;
        
        $('#imgCode').click(function(){
        	var timestamp = Date.parse(new Date());
        	$("#imgCode").attr('src','/common/kaptcha?version='+timestamp);
        });

        form.on('submit(formDemo)', function(data){
            layer.load();
            var code=$('#code').val();
            $.ajax({
                type : "POST",
                dataType: "json",
                //contentType: "application/json;charset=UTF-8",
                url : '/book/ajax/add/'+code,
                data : data.field,
                success : function(data) {
                    $('#messageForm')[0].reset();
                    layer.closeAll();
                    layer.msg(data.msg);

                }
            });
            return false;

        });
    });
</script>
</body>

</html>