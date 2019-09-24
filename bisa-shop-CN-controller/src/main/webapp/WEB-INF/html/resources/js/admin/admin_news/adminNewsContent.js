$(document).ready(function () {

    /*layui方面js*/
    layui.use(['form', 'table', 'element'], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
             table = layui.table;


        //获取地址栏的  新闻表的id
        var url = document.location.href;
        var id = url.split("=")[1];

    /*定义ckeditor*/
    var editor = CKEDITOR.replace('newseditor', {
        customConfig: 'custom/ckeditor_config.js',
        height: 550,
    });

         var lang=2;

        $(".lang_btn button").click(function () {
            if ($(this).attr('data-num') == 1) {
                //繁体
                lang=2;
                $(this).removeClass("layui-btn-primary");
                $(".lang_btn button:eq(1)").addClass('layui-btn-primary');
                $(".lang_btn button:eq(2)").addClass('layui-btn-primary');
            } else if ($(this).attr('data-num') == 2) {
                //简体
                lang=1;
                $(this).removeClass("layui-btn-primary");
                $(".lang_btn button:eq(0)").addClass('layui-btn-primary');
                $(".lang_btn button:eq(2)").addClass('layui-btn-primary');
            } else {
                //英文
                lang=3;
                $(this).removeClass("layui-btn-primary");
                $(".lang_btn button:eq(0)").addClass('layui-btn-primary');
                $(".lang_btn button:eq(1)").addClass('layui-btn-primary');
            }
        })


        /*查询新闻类型标签*/
        $.ajax({
            url: 'admin/news/selectNewsClassify',
            type: "get",
            contentType: "application/json",
            async: false,
            success: function (data) {
                var html="";
                if (data!='') {
                    for(var i=0;i<data.length;i++){
                        html+= '<option value="'+data[i].id+'">'+data[i].new_classify+'</option>' ;
                    }
                    $(".newstype").append(html);
                    form.render();
                }else{
                    html+='<option value="0">请选择</option>'+
                        '<option value="1" >碧沙风采</option>'+
                        '<option value="2">心脏相关</option>'+
                        '<option value="3">摄像头相关</option>'+
                        '<option value="4">血压相关</option>'+
                        '<option value="5">血氧相关</option>'+
                        '<option value="6">其他</option>';
                        $(".newstype").html(html);
                        form.render();
                }
            },error:function () {
                layer.msg('新闻类型数据加载异常！重试或联系运维人员！', {icon: 5, time: 1000}, function () {});
            }
        });



    //异步加载 要编辑的数据
        $.ajax({
            url: 'admin/news/selectNewsInternationalizationById',
            type: "GET",
            data: {
                id: id,
                internationalization:2
            },

            success: function (data) {
                console.log(data)
                    document.getElementById("readings").style.display = "";
                    CKEDITOR.instances.newseditor.setData(data.news_content)
                    $("input[name='id']").val(data.id);
                    $("input[name='main_title']").val(data.news_title);
                    $("input[name='subheading']").val(data.news_subhead);
                    $("input[name='author']").val(data.author);
                    $("input[name='readings']").val(data.read_quantity);
                    $("input[name='code']").val(data.news_id);
                    $("input[name='photo_address']").val(data.img_url);
                    $(".newstype").val(data.news_classify_id);
                    $("input[name='keyWord']").val(data.news_keyWord);
                    $("input[name='html_description']").val(data.html_description);
                    $("input[name='html_title']").val(data.html_title);
                    $("input[name='describe']").val(data.news_describe);
                if (data.news_roofPlacement == 0){
                    $("input[value='0']").attr("checked", "checked");
                    $("input[value='0']").next().addClass("layui-form-radioed");
                    $("input[value='0']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                }else{
                    $("input[value='1']").attr("checked", "checked");
                    $("input[value='1']").next().addClass("layui-form-radioed");
                    $("input[value='1']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                }
                    form.render('select');
            }
        });

/*监听繁体的回显*/
        $("#hk").click(function () {
            $.ajax({
                url: 'admin/news/selectNewsInternationalizationById',
                type: "GET",
                data: {
                    id: id,
                    internationalization:2
                },
                async: false,
                success: function (data) {
                    console.log(data)
                    var editor = CKEDITOR.instances["newseditor"]; //你的编辑器的"name"属性的值
                    if (editor) {
                        editor.destroy(true);//销毁编辑器
                    }
                    CKEDITOR.replace(newseditor); //替换编辑器，editorID为ckeditor的"id"属性的值
                    $("#newseditor").val(data.news_content);
                    $("input[name='id']").val(data.id);
                    $("input[name='main_title']").val(data.news_title);
                    $("input[name='subheading']").val(data.news_subhead);
                    $("input[name='author']").val(data.author);
                    $("input[name='readings']").val(data.read_quantity);
                    $("input[name='code']").val(data.news_id);
                    $("input[name='photo_address']").val(data.img_url);
                    $(".newstype").val(data.news_classify_id);
                    $("input[name='keyWord']").val(data.news_keyWord);
                    $("input[name='html_description']").val(data.html_description);
                    $("input[name='html_title']").val(data.html_title);
                    $("input[name='describe']").val(data.news_describe);
                    if (data.news_roofPlacement == 0){
                        $("input[value='0']").attr("checked", "checked");
                        $("input[value='0']").next().addClass("layui-form-radioed");
                        $("input[value='0']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                    }else{
                        $("input[value='1']").attr("checked", "checked");
                        $("input[value='1']").next().addClass("layui-form-radioed");
                        $("input[value='1']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                    }
                    form.render();
                }
            });
        });
    /*异步加载简体的回显*/
    $("#china").click(function () {
        $.ajax({
            url: 'admin/news/selectNewsInternationalizationById',
            type: "GET",
            data: {
                id: id,
                internationalization:1
            },
            async: false,
            success: function (data) {
                console.log(data)
                document.getElementById("readings").style.display = "none";
                if (data.news_title != null && data.news_content!=null) {
                    var editor = CKEDITOR.instances["newseditor"]; //你的编辑器的"name"属性的值
                    if (editor) {
                        editor.destroy(true);//销毁编辑器
                    }
                    CKEDITOR.replace(newseditor); //替换编辑器，editorID为ckeditor的"id"属性的值
                    $("input[name='readings']").val(data.read_quantity);
                    $("#newseditor").val(data.news_content);
                    $("input[name='main_title']").val(data.news_title);
                    $("input[name='subheading']").val(data.news_subhead);
                    $("input[name='author']").val(data.author);
                    $("input[name='photo_address']").val(data.img_url);
                    $(".newstype").val(data.news_classify_id);
                    $("input[name='keyWord']").val(data.news_keyWord);
                    $("input[name='describe']").val(data.news_describe);
                    $("input[name='html_description']").val(data.html_description);
                    $("input[name='html_title']").val(data.html_title);
                    if (data.news_roofPlacement == 0){
                        $("input[value='0']").attr("checked", "checked");
                        $("input[value='0']").next().addClass("layui-form-radioed");
                        $("input[value='0']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                    }else{
                        $("input[value='1']").attr("checked", "checked");
                        $("input[value='1']").next().addClass("layui-form-radioed");
                        $("input[value='1']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                    }
                    form.render();
                }else {
                    layer.msg('没有简体语言版本，请添加后修改！', {icon: 5, time: 2000}, function () {
                    })
                }
            }
        });
    });
    /*异步加载英文的回显*/
    $("#english").click(function () {
        $.ajax({
            url: 'admin/news/selectNewsInternationalizationById',
            type: "GET",
            data: {
                id: id,
                internationalization:3
            },
            async: false,
            success: function (data) {
                document.getElementById("readings").style.display = "none";
                if (data.news_title != null && data.news_content!=null) {
                    var editor = CKEDITOR.instances["newseditor"]; //你的编辑器的"name"属性的值
                    if (editor) {
                        editor.destroy(true);//销毁编辑器
                    }
                    CKEDITOR.replace(newseditor); //替换编辑器，editorID为ckeditor的"id"属性的值
                    $("input[name='readings']").val(data.read_quantity);
                    $("#newseditor").val(data.news_content);
                    $("input[name='main_title']").val(data.news_title);
                    $("input[name='subheading']").val(data.news_subhead);
                    $("input[name='author']").val(data.author);
                    $("input[name='photo_address']").val(data.img_url);
                    $(".newstype").val(data.news_classify_id);
                    $("input[name='keyWord']").val(data.news_keyWord);
                    $("input[name='describe']").val(data.news_describe);
                    $("input[name='html_description']").val(data.html_description);
                    $("input[name='html_title']").val(data.html_title);
                    if (data.news_roofPlacement == 0){
                        $("input[value='0']").attr("checked", "checked");
                        $("input[value='0']").next().addClass("layui-form-radioed");
                        $("input[value='0']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                    }else{
                        $("input[value='1']").attr("checked", "checked");
                        $("input[value='1']").next().addClass("layui-form-radioed");
                        $("input[value='1']").next().find(".layui-anim").addClass("layui-anim-scaleSpring")
                    }
                    form.render();
                }else {
                    layer.msg('没有英文语言版本，请添加后修改！', {icon: 5, time: 2000}, function () {
                    })
                }
            }
        });
    });
        /*监听繁体的提交*/
        form.on('submit(updateCN)', function (data) {

            var main_title=document.getElementById('main_title').value;
            var subheading=document.getElementById('subheading').value;
            var author=document.getElementById('author').value;
            var photo_address=document.getElementById('photo_address').value;
            var readings=document.getElementById('readings1').value;
            var keyWord=document.getElementById('keyWord').value;
            var describe=document.getElementById('describe').value;
            var html_description=$('input[name="html_description"]').val();
            var html_title=$('input[name="html_title"]').val();
            var news_roofPlacement=$('input[name="roofPlacement"]:checked').val();
            var content=CKEDITOR.instances.newseditor.getData();
            var cid=$('.newstype').val();
            /*获取ck的数据*/
            var ck_val = CKEDITOR.instances.newseditor.getData();
            /*把ck的值推入到lay数组里面*/
            data.field.newseditor = ck_val;
            $.ajax({
                url: 'admin/news/updateNewsInternationalization',
                data: {
                    read_quantity:readings,
                    img_url:photo_address,
                    author:author,
                    news_content: ck_val,
                    news_subhead:subheading,
                    news_title: main_title,
                    id:id,
                    news_classify_id:cid,
                    news_keyWord: keyWord,
                    news_describe: describe,
                    html_description: html_description,
                    html_title: html_title,
                    news_roofPlacement:news_roofPlacement,
                    internationalization:lang
                },
                type: "POST",
                success: function (data) {
                    console.log(data)
                    if (data.flag == true) { //添加父级商品，需要添加图片；子级商品，加载图片
                        layer.msg('修改成功！', {icon: 6, time: 1000}, function () {
                        });
                    } else if (data.flag == false) {
                        layer.msg('还有未填写的信息，请核对后添加!', {icon: 5, time: 2000}, function () {

                        });
                    }
                }
            });

        });




    });
});


