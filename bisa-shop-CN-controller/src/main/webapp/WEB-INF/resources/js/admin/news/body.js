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
        customConfig: 'custom/ckeditor_config.js',
        height: 550,
    });


        $(".lang_btn button").click(function () {
        	switchBylangId($(this).attr('data-num'));
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

        /*监听繁体的回显*/
        $("#hk").click(function () {        
        	$('#lang_id').val($(this).data("num"));
        	ajaxLoadNews($(this).data("num"));
        });
        $("#zh_CN").click(function () {        
        	$('#lang_id').val($(this).data("num"));
        	ajaxLoadNews($(this).data("num"));
        });
        $("#en_US").click(function () {        
        	$('#lang_id').val($(this).data("num"));
        	ajaxLoadNews($(this).data("num"));
        });
        
        function switchBylangId(lang_id){
        	if ( lang_id== 1) {
                //繁体
        		$(".lang_btn button:eq(0)").removeClass("layui-btn-primary");
                $(".lang_btn button:eq(1)").addClass('layui-btn-primary');
                $(".lang_btn button:eq(2)").addClass('layui-btn-primary');
            } else if (lang_id == 2) {
                //简体
            	$(".lang_btn button:eq(1)").removeClass("layui-btn-primary");
                $(".lang_btn button:eq(0)").addClass('layui-btn-primary');
                $(".lang_btn button:eq(2)").addClass('layui-btn-primary');
            } else {
                //英文
            	$(".lang_btn button:eq(2)").removeClass("layui-btn-primary");
                $(".lang_btn button:eq(0)").addClass('layui-btn-primary');
                $(".lang_btn button:eq(1)").addClass('layui-btn-primary');
            }
        }
        
        function ajaxLoadNews(lang_id){
        	var news_id=$('#news_id').val();
            $.ajax({
                url: 'admin/news/loadNewsBylang/'+news_id+'/'+lang_id,
                type: "GET",
                async: false,
                success: function (data) {
                    
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
                    if(data!=""){
                    	$(".newstype").val(data.news_classify_id);
                    }
                    $("input[name='html_keyWord']").val(data.html_keyWord);
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
        }
        ajaxLoadNews(2);

        /*监听繁体的提交*/
        form.on('submit(updateCN)', function (data) {

            var main_title=document.getElementById('main_title').value;
            var subheading=document.getElementById('subheading').value;
            var author=document.getElementById('author').value;
            var photo_address=document.getElementById('photo_address').value;
            var readings=document.getElementById('readings1').value;
            var keyWord=document.getElementById('html_keyWord').value;
            var describe=document.getElementById('describe').value;
            var html_description=$('input[name="html_description"]').val();
            var html_title=$('input[name="html_title"]').val();
            var news_roofPlacement=$('input[name="roofPlacement"]:checked').val();
            var content=CKEDITOR.instances.newseditor.getData();
            var cid=$('.newstype').val();
            var lang_id=$('#lang_id').val();
            var news_id=$('#news_id').val();
            /*获取ck的数据*/
            var ck_val = CKEDITOR.instances.newseditor.getData();
            /*把ck的值推入到lay数组里面*/
            data.field.newseditor = ck_val;
            $.ajax({
                url: 'admin/news/addUpdateNews',
                data: JSON.stringify({
                    read_quantity:readings,
                    img_url:photo_address,
                    author:author,
                    lang_id: lang_id,
                    news_content: ck_val,
                    news_subhead:subheading,
                    news_title: main_title,
                    news_id:news_id,
                    news_describe: describe,
                    news_classify_id:cid,
                    html_keyWord: keyWord,
                    html_description: html_description,
                    html_title: html_title,
                    news_roofPlacement:news_roofPlacement
                }),
                type: "POST",
                contentType: "application/json",
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


