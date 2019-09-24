$(document).ready(function () {
    //刷新  页面按钮
    $(".btn-refresh").click(function () {
        window.location.reload();
    });
    $("#search2").click(function () {
        var inner_chain_url = $('input[name="inner_chain_url"]').val();
        var inner_chain_text_CN = $('input[name="inner_chain_text_CN"]').val();
        var inner_chain_text_EN = $('input[name="inner_chain_text_EN"]').val();
        var inner_chain_text_HK = $('input[name="inner_chain_text_HK"]').val();
        var creation_time= new Date();
        console.log(inner_chain_url)
        console.log(inner_chain_text_CN)
        console.log(inner_chain_text_EN)
        console.log(inner_chain_text_HK)
        console.log(creation_time)
        $.ajax({
            url: 'admin/news/addInnerChain',
            data: {
                inner_chain_url:inner_chain_url,
                inner_chain_text_HK:inner_chain_text_HK,
                inner_chain_text_CN:inner_chain_text_CN,
                inner_chain_text_EN:inner_chain_text_EN,
                creation_time:creation_time
            },
            type: "POST",
            success: function (data) {
                console.log(data);
                if (data.flag == true) {
                    layer.msg('添加 成功!', {icon: 6, time: 1000}, function () {
                        layer.close(index);
                    });
                    if (data.flag == false) {
                        layer.msg('系统故障!', {icon: 5, time: 1000}, function () {
                            window.location.reload();
                        });
                    }
                }
            }
        })
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
            table.reload('keywordlist', {
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
            elem: '#keywordlist', //指定原始表格元素选择器（推荐id选择器）
            id: 'keywordlist',
            url: 'admin/news/selectInnerChainList',
            limit: 10,
            page: true,
            cols: [
                [ //标题栏
                    {type: 'numbers'},
                    {field: 'inner_chain_text_CN', title: '内链中文文本', width: 200, align: 'center'},
                    {field: 'inner_chain_text_EN', title: '内链英文文本', width: 200, align: 'center'},
                    {field: 'inner_chain_text_HK', title: '内链繁体文本', width: 200, align: 'center'},
                    {field: 'inner_chain_url', title: '内链路径', width: 200, sort: true, align: 'center'},
                    {field: 'creation_time', title: '创建时间', width: 200, sort: true, align: 'center'},
                    {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
                ]
            ],
            done: function (res, curr, count) {
                $("[data-field = 'creation_time']").children().each(function (index) {
                    if (index != 0) {
                        var data = $(this).text();
                        $(this).text(getMyDate(data));
                    }
                })
            }
        });
        // ===============监听工具条===================
        table.on('tool(test)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if (layEvent === 'delarticle') { //删除
                var id = data.id;
                layer.confirm('需要要删除此内联关键词吗？', function (index) {
                    $.ajax({
                        url: 'admin/news/delectInnerChain',
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