$(document).ready(function () {
    //刷新  页面按钮
    $(".btn-refresh").click(function () {
        window.location.reload();
    });

    $(".btn-generate").click(function () {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "admin/news/GenerateHTML",
            success: function (data) {
                //显示新闻数据，填充页面元素
                if(data.flag){
                    alert("创建成功")
                }else{
                    alert("创建失败")
                }
            }
        });
    });


    /*layui方面js*/
    layui.use(['form', 'table', 'element'], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            table = layui.table;

        //监听提交
        form.on('submit(search1)', function (data) {
            var incontent = data.field.incontent;
            var searchabout = data.field.searchabout;

            //执行重载
            table.reload('commentlist', {
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    key: {
                        incontent: incontent,
                        searchabout: searchabout
                    }
                }
            });
            return false;
        });
        //=================执行渲染==================
        table.render({
            elem: '#commentlist', //指定原始表格元素选择器（推荐id选择器）
            id: 'commentlist',
            url: 'admin/news/selectNewsList',
            limit: 10,
            page: true,
            cols: [
                [ //标题栏
                    {type: 'numbers'},
                    // {field: 'id', title: 'ID', width: 70, align: 'center'},
                    {field: 'author', title: '作者', width: 90, align: 'center'},
                    // {field: 'news_classify_id', title: '新闻类型', width: 150, align: 'center'},
                    {field: 'news_title', title: '新闻标题', width: 200, align: 'center'},
                    {field: 'news_subhead', title: '新闻副标题', width: 200, align: 'center', event: 'news_subhead'},
                    {field: 'read_quantity', title: '阅读量', width: 100, sort: true, align: 'center'},
                    {field: 'news_id', title: '新闻id', width: 100, sort: true, align: 'center'},
                    {field: 'news_keyWord', title: '新闻关键词', width: 200, align: 'center'},
                    {field: 'news_describe', title: '新闻描述', width: 200, align: 'center'},
                    {field: 'html_description', title: '新闻meat描述', width: 200, align: 'center'},
                    {field: 'html_title', title: '新闻meat标题', width: 200, align: 'center'},
                    {field: 'news_roofPlacement', title: '是否置顶', width: 100, sort: true, align: 'center'},
                    {field: 'release_time', title: '发布时间', width: 200, sort: true, align: 'center'},
                    {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
                ]
            ],
            done: function (res, curr, count) {
                console.log(res);
                $("[data-field = 'news_roofPlacement']").children().each(function (index) {
                    if (index == 1) {
                        var data = $(this).text("置顶");
                    }else{
                        var data = $(this).text("不置顶");
                    }
                })
                $("[data-field = 'release_time']").children().each(function (index) {
                    if (index != 0) {
                        var data = $(this).text();
                        $(this).text(getMyDate(data));
                    }
                })
                //
                // $("[data-field = 'news_classify_id']").children().each(function (index) {
                //     if (index != 0) {
                //         var data = $(this).text();
                //         $(this).text(getNewType(data));
                //     }
                // })
            }
            /*在这里使用的是静态数据，参考layui文档，使用服务器上的数据进行更替*/
            /*data: [
                { "id": 10005, "title": "新的模块上线啦6", "subtitle": "悉心心电仪的新模块6", "author": "BIS-责任编辑师", "release_time": "2017/10/12 9:55:52", "modificationtime": "2017/10/12 9:58:52","weight": "10",},
            ],*/
        });
        //===============监听工具条===================
        table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if (layEvent === 'detail') { //预览
                window.open(shopUrl + "/admin/news/newsInfo?news_id=" + data.id);
            } else if (layEvent === 'delarticle') { //删除
                var id = data.id;
                layer.confirm('需要要删除此文章么？', function (index) {
                    $.ajax({
                        url: 'admin/news/delectNews',
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
            }
            if (layEvent === 'edit') { //编辑
                window.location.href = "admin/news/newsContent?id=" + data.id;
            }
            if (obj.event === 'news_subhead') {
                layer.alert(data.news_subhead, {
                    title: '新闻ID 为 &nbsp;' + data.id + '&nbsp; 的副标题',
                });
            }
        });
    });
});

//获得年月日      得到日期oTime  
function getMyDate(data) {
    if (data == "") {
        return "- - - - - -";
    }
    data = parseInt(data);

    var oldTime = (new Date(data)).getTime(); //得到毫秒数
    var oDate = new Date(oldTime);
    oYear = oDate.getFullYear(),
        oMonth = oDate.getMonth() + 1,
        oDay = oDate.getDate(),
        oHour = oDate.getHours(),
        oMin = oDate.getMinutes(),
        oSen = oDate.getSeconds(),
        oTime = oYear + '年' + getzf(oMonth) + '月' + getzf(oDay) + '日     ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
    return oTime;
};

//补0操作  
function getzf(num) {
    if (parseInt(num) < 10) {
        num = '0' + num;
    }
    return num;
}

/*新闻类型转换 */
function getNewType(id) {
     var value;
     switch (id) {
         case '1':
             value='碧沙风采';
             break;
         case '2':
             value='心脏相关';
             break;
         case '3':
             value='摄像头相关';
             break;
         case '4':
             value='血压相关';
             break;
         case '5':
             value='血氧相关';
             break;
         case '6':
             value='其他';
             break;
     }
     return value;
}