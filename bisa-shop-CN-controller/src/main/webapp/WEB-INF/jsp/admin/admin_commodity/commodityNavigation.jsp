<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 左侧导航区域 -->
<div class="layui-side layui-bg-black">
	<div class="layui-side-scroll">
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
			<li class="layui-nav-item"><a href="admin/commodity/commodityView">商品列表</a></li>
			<li class="layui-nav-item"><a href="admin/commodity/addCommodityPage">新增商品</a></li>
			<li class="layui-nav-item"><a href="admin/commodity/addCombo">添加套餐</a></li>
			<li class="layui-nav-item"><a href="admin/commodity/addCard">新增服务卡</a></li>
			<li class="layui-nav-item"><a href="admin/commodity/listCard">查看服务卡</a></li>
			<li class="layui-nav-item"><a href="admin/commodity/classifyView">类别管理</a></li>
			<shiro:hasAnyRoles name="ROLE_ADMIN">
				<li class="layui-nav-item"><a href="admin/commodity/freeCard">新增免费激活卡</a></li>
			</shiro:hasAnyRoles>
		</ul>
	</div>
</div>