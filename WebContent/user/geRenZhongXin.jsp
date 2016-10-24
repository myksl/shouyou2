<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" pageout="1">
<title>交易猫_手机游戏交易平台_个人中心</title>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="../top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>管理我的商品</span>
</div>
		
<div class="management">
	<div class="managementInclude">
		<div class="managementLeft">
			<br>
			<%	
				User user = UserFactory.get().findById((String)session.getAttribute("User"));
			%>
			<span class="title">登录用户信息</span>
			<hr>
			<span>账号：<%=user.getName()%></span><br>
			<span>QQ号码：<%=user.getQq()%></span><br>
			<span>手机号码：<%=user.getPhone()%></span><br>
			<a href="user/updateUser.jsp"><span>修改用户信息</span></a><br><br>
			<span class="title">我是买家</span>
			<hr>			
			<a href="user/allProduct.jsp"><span>我要买</span></a><br>
			<a href="user/showBuyOrder.jsp"><span>查看我的订单</span></a><br>
			<span class="title">我是卖家</span>		
			<hr>
			<a href="user/sell.jsp"><span>我要卖</span></a>			
			<a href="user/showProduct.jsp"><span>管理我的商品</span></a>			
			<a href="user/showSellOrder.jsp"><span>查看我的订单</span></a>
		</div>
		<div class="managementRight">
			<span><b>管理我的商品</b></span>
			<hr>
		</div>
	</div>
</div>
<jsp:include page="../floor.jsp"></jsp:include>
</body>
</html>