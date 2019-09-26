$(document).ready(function () {
    /*layui方面js*/
    layui.use(['form', 'table', 'element','upload'], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            table = layui.table,
        	upload = layui.upload;
        
        

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: 'admin/common/uppic'
            ,done: function (data) {
                //如果上传失败
                if (data.flag == false) {
                    return layer.msg('上传失败');
                }
                //上传成功
                if (data.flag == true) {
                	$('#photo_address').val(data.msg);
                    layer.msg('图片上传成功!', {icon: 6, time: 1000}, function () {
                    });
                }
            }
            , error: function () {
                layer.msg('图片上传失败！', {icon: 5, time: 1000}, function () {
                });
            }
        });

    /*定义ckeditor*/
    var editor = CKEDITOR.replace('newseditor', {
        customConfig: '../../../resources/ctrl/ckeditor/config.js',
        height: 550,
    });

        /*查询新闻类型标签*/
        $.ajax({
            url: 'admin/news/selectNewsClassify',
            type: "get",
            contentType: "application/json",
            success: function (data) {
                var html;
                if (data!='') {
                    for(var i=0;i<data.length;i++){
                       html+= '<option value="'+data[i].id+'">'+data[i].new_classify+'</option>' ;
                         }
                    $(".newstype").append(html);
                    form.render();
                }else{
                    html+='<option value="">请选择</option>'+
                          '<option value="1">碧沙风采</option>'+
                          '<option value="2">心脏相关</option>'+
                          '<option value="3">摄像头相关</option>'+
                          '<option value="4">血压相关</option>'+
                          '<option value="5">血氧相关</option>'+
                          '<option value="6">其他</option>';
                        $(".newstype").html(html);
                }
            },error:function () {
                layer.msg('新闻类型数据加载异常！重试或联系运维人员！', {icon: 5, time: 1000}, function () {});
            }
        });


    //获取地址栏的  新闻表的id
    var url = document.location.href;
    var id = url.split("=")[1];
    /*添加新闻*/
        form.on('submit(addNews)', function (data) {
            console.log(data)
            /*获取ck的数据*/
            var ck_val = CKEDITOR.instances.newseditor.getData();
            /*把ck的值推入到lay数组里面*/
            data.field.newseditor = ck_val;
            if(ck_val=='' || ck_val==undefined  || ck_val==null){
                layer.msg('新闻内容不能为空!', {icon: 5, time: 2000});
                return false;
            }
            $.ajax({
                url: 'admin/news/addUpdateNews',
                data: JSON.stringify({
                    id: data.field.id,
                    img_url: data.field.photo_address,
                    author: data.field.author,
                    lang_id: data.field.lang_id,
                    news_title: data.field.main_title,
                    news_subhead: data.field.subheading,
                    news_content: data.field.newseditor,
                    read_quantity: data.field.readings,
                    html_keyWord: data.field.html_keyWord,
                    html_description:data.field.html_description,
                    html_title:data.field.html_title,
                    news_describe: data.field.describe,
                    news_roofPlacement:$('input[name="roofPlacement"]:checked').val(),
                    news_classify_id:$('.newstype').val(),
                }),
                type: "POST",
                contentType: "application/json",
                success: function (data) {
                    console.log(data)
                    if (data.flag == false) {
                        layer.msg('异常！重试或联系运维人员！', {icon: 5, time: 2000}, function () {
                        });
                    }
                    if (data.msg == "100") {
                        layer.msg('添加新闻  成功!', {icon: 6, time: 2000}, function () {
                            window.location.href = "admin/news/listNews";
                        });
                    } else if (data.msg == "200") {
                        layer.msg('添加新闻  成功!', {icon: 6, time: 2000}, function () {
                            window.location.href = "admin/news/listNews";
                        });
                    }
                }
            });
            return false;
        });
    });
});


