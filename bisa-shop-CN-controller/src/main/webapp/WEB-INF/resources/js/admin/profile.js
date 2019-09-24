
$(document).ready(function () {
    /*layui方面js*/
    layui.use(['form', 'table','upload', 'element'], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            table = layui.table;
        var  upload = layui.upload;

        //=================执行渲染==================
        table.render({
            elem: '#keywordlist', //指定原始表格元素选择器（推荐id选择器）
            id: 'keywordlist',
            url: 'admin/listnav',
            limit: 10,
            method:'get',
            page: true,
            cols: [
                [ //标题栏
                    {type: 'numbers'},
                    {field: 'id', title: 'id', width: 100,sort: true, align: 'center'},
                    {field: 'name', title: '跳转地址', width: 200, align: 'center'},
                    {field: 'column_name_CN', title: '页面栏目简体', width: 200, align: 'center'},
                    {field: 'html_title_CN', title: '页面简体标题', width: 200, align: 'center'},
                    {field: 'html_title_HK', title: '页面繁体标题', width: 200, align: 'center'},
                    {field: 'html_title_US', title: '页面英文标题', width: 200, align: 'center'},
                    {field: 'update_time', title: '修改时间', width: 200, sort: true, align: 'center'},
                    {field: 'order_id', title: '排序', width: 200,  align: 'center'},
                    {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
                ]
            ],
            done: function (res, curr, count) {
                // $("[data-field = 'creation_time']").children().each(function (index) {
                //     if (index != 0) {
                //         var data = $(this).text();
                //         $(this).text(getMyDate(data));
                //     }
                // })
            }
        });
        
        // ===============监听工具条===================
        table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; // 获得当前行数据
            var layEvent = obj.event; // 获得 lay-event 对应的值
            var tr = obj.tr; // 获得当前行 tr 的DOM对象
            console.log(data.id)
            if (layEvent == 'edit') {
                // 编辑
            	openDialog(data);
                
            }else if(layEvent == 'delete'){
                // 删除
                var id = data.id;
                layer.confirm('需要要删除此页面么？', function (index) {
                    $.ajax({
                        url: 'admin/delectHtmlInfoById',
                        data: {
                            id: id
                        },
                        type: "POST",
                        success: function (data) {
                            if (data.flag == true) {
                                layer.msg('删除 成功!', {icon: 6, time: 1000}, function () {
                                    obj.del();
                                    layer.close(index);
                                });
                                if (data.flag == false) {
                                    layer.msg('系统故障!', {icon: 5, time: 1000}, function () {
                                        window.location.reload();
                                    });
                                }
                            }
                        }
                    });
                });
            }else if(layEvent == 'generate'){
            	// 删除
                var id = data.id;
                layer.confirm('需要要生成静态页面？', function (index) {
                    $.ajax({
                        url: 'admin/addHtmlInfoById',
                        data: {
                            id: id
                        },
                        type: "POST",
                        success: function (data) {
                            if (data.flag == true) {
                                layer.msg('生成 成功!', {icon: 6, time: 1000}, function () {
                                    obj.del();
                                    layer.close(index);
                                });
                                if (data.flag == false) {
                                    layer.msg('系统故障!', {icon: 5, time: 1000}, function () {
                                        window.location.reload();
                                    });
                                }
                            }
                        }
                    });
                });
            }
        });
        
        function openDialog(data){
       	 layer.open({
                title: '页面设置'//弹框标题
                , content: $(".formsetting").html()//也可以是一个html
                , area: ['680', '600']
                , btn: ['关闭']
                , yes: function (index, layero) {
                    //按钮【按钮知道了】的回调
                    layer.close(index);
                }

            });
       	 
       	 
       	 if(data!=null){
       		 form.val("formServer", {
                    "html_description_CN": data.html_description_CN,
                    "html_description_HK": data.html_description_HK,
                    "html_description_US": data.html_description_US,
                    "html_keyWord_CN": data.html_keyWord_CN,
                    "html_keyWord_HK": data.html_keyWord_HK,
                    "html_keyWord_US": data.html_keyWord_US,
                    "html_title_CN": data.html_title_CN,
                    "html_title_HK": data.html_title_HK,
                    "html_title_US": data.html_title_US,
                    "column_name_CN": data.column_name_CN,
                    "column_name_HK": data.column_name_HK,
                    "column_name_US": data.column_name_US,
                    "order_id": data.order_id,
                    "name": data.name,
                    "id":data.id
                }); 
       	 }
       	 
            form.render();
       }
        
     	 
        $("#addPage").click(function(){
        	openDialog(null);
        });
        
    });
    

// 一键生成全部静态文件
    $("#allhtml").click(function () {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "admin/generateAllHTML",
            success: function (data) {
                    alert("创建成功");

            }
        });
    })
    // 一键生成底部文件
    $("#foothtml").click(function () {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "admin/generateFooterHTML",
            success: function (data) {
                    alert("创建成功")
            }
        });
    })

// 一键生成头部文件
    $("#headhtml").click(function () {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "admin/generateHeaderHTML",
            success: function (data) {
                    alert("创建成功")
            }
        });
    })

    
});