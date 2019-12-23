<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon/favicon.ico" type="image/x-icon"/>
    <link rel="bookmark" href="/favicon/favicon.ico" type="image/x-icon"/>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html;"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <!-- necessary -->
    <meta name="keywords" content="${html_description}">
    <meta name="description" content="${html_keyWord}">
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
        <p class="boardTitle">Purchase consultaiton</p>
        <div class="col-md-7 boardLeft">
            <div class="col-md-10">
                <p class="leftTitle">Contact sales</p>
                <p>
                    <span>Sales consulting(China):</span>
                    <span>(86) 0755-2688 0962</span>

                </p>
                <p class="mb-20">
                    <span>Sales consulting(Hongkong):</span>
                    <span>(852) 2423 0600&nbsp;|&nbsp;(852) 2423 0791</span>
                </p>
                <p class="mb-20">
                    <span>Fax:</span>
                    <span>(852) 2423 0148</span>
                </p>
                <p class="mb-20">
                    <span>Contact the sales staff to buy immediately.</span>                  
                </p>
                <p class="mb-30">                 
                    <span>Workday</span>
                    <span style="color: #E5481E;">9:00 AM—6:00 PM</span>
                </p>
            </div>
            <div class="col-md-2 ">
                <img class="img-responsive center-block" src="/resources/img/index/board-1.png">
            </div>
        </div>
        <div class="col-md-5 boardRight">
            <div>
                <p>Online customer service</p>
                <p>
                  Workday 9:00 AM—5:30 PM
                </p>
                <button>
                    <a target='_blank' href='http://wpa.qq.com/msgrd?v=3&uin=3299503761&site=qq&menu=yes' >Click to consult</a>
                </button>
            </div>
        </div>
    </div>
    <p class="boardTitle ">You can also leave a message for us</p>
</div>
<div class="message" >
    <div class="container">
        <div class="row">
            <p >Leave message</p>
        </div>
    </div>
</div>
<div class="container">
    <div class="row messageTwo" >
        <p>Warm tips：If you have any questions about our products, please leave us a message。</p>
    </div>
    <form class="layui-form" id="messageForm" action="">
        <div class="row messageThere" >
            <div class="form-group col-md-3" style="">
                <label for="name" class="control-label">Name:</label>
                <input type="text" class="form-control" required  lay-verify="required" name="name" id="name" lay-reqText="Name cannot be blank" placeholder="Please enter your name">
            </div>
            <div class="form-group col-md-3">
                <label for="phone" class="control-label">Tel:</label>
                <input type="text" class="form-control" required  lay-verify="required" name="phone" id="phone" lay-reqText="Number cannot be blank" placeholder="Please enter your number">
            </div>
            <div class="form-group col-md-3">
                <label for="email" class="control-label">Email:</label>
                <input type="email" class="form-control" required  lay-verify="required|email" name="mail" id="mail"  lay-reqText="Email cannot be blank" placeholder="Please enter your email">
            </div>
            <div class="form-group col-md-3">
                <label for="message_type" class="control-label">Type:</label>
                <select class="form-control" name="message_type" lay-reqText="Please enter your type" lay-verify="required" id="category">
                    <option value="1">User</option>
                    <option value="2">Business</option>
                    <option value="3">Hospital</option>
                </select>
            </div>

        </div>
        
         <div class="row messageFour" >
            <p>Message content:</p>
            <textarea class="form-control" rows="5" name="message" lay-reqText="Please enter message content" lay-verify="required" placeholder="Please enter message content" ></textarea>
        </div>
        
        <div class="row pt-10">
        	  <div class="layui-input-inline">
      			<img alt="" id="imgCode" src="/common/kaptcha"> 
    		  </div> 
    		  <div class="layui-input-inline">
                   <input type="code" id="code" name="code" required lay-verify="required" lay-reqText="PIN cannot be empty" placeholder="Please enter PIN" autocomplete="off" class="layui-input">
    		  </div> 
    		   
    	</div>
    	<div class="row text-center pt-10 pb-10">
    		 <div class="layui-input-inline">
                    <button class="layui-btn f-20" lay-submit="" lay-filter="formDemo">Submit now</button>
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