$(document).ready(function() {
    var path=$("base").attr("href");
    layui.use(['element', 'layer'], function(){
        var element = layui.element;
        var layer = layui.layer;

    });
    /*    $(".layui-colla-item").click(function(){
            var speed = 200;
            $('body,html').animate({ scrollTop: 400 }, speed);
        });*/
    //选项卡
    $("#p1").click(function () {
        $("#instr2").hide();
        $("#instr1").show();
        $("#instr3").hide();
    });
    $("#p2").click(function () {
        $("#instr1").hide();
        $("#instr2").show();
        $("#instr3").hide();
    });
    $("#p3").click(function () {
        $("#instr1").hide();
        $("#instr3").show();
        $("#instr2").hide();
    })
});
