<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="factory.BuyOrderFactory"%>
<%@page import="vo.BuyOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/showBuyOrder.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/sellOrder.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易猫_手机游戏交易平台</title>
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="../top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>订单详情</span>
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
		<%
			String listIndex = request.getParameter("listIndex");
			BuyOrder buyOrder = null;
			buyOrder = BuyOrderFactory.get().findById(listIndex);
			if(buyOrder!=null){
		
		%>
		<div class="managementRight">
			<div class="search">
				<span>订单号：<%=buyOrder.getListIndex() %></span>
				<hr>
				<ul>
					<li><span class="title">订单详情</span></li>
					<li>商品名称：<%=buyOrder.getOrderName() %></li>
					<li>所属游戏：<%=buyOrder.getGame() %></li>
					<li>购买价格：<%=buyOrder.getPrice() %></li>
					<li>完成时间：<%=buyOrder.getTime() %></li>
					<li>目前状态： <%=buyOrder.getState() %></li>
					<li>账&nbsp;&nbsp;&nbsp;&nbsp;号： <%=buyOrder.getAccount()%></li>
					<li>密&nbsp;&nbsp;&nbsp;&nbsp;码： <%=buyOrder.getPassword() %></li>
				</ul>
				<ul>
					<li><span class="title">商品详情</span></li>
					
					<li>所属游戏：<%=buyOrder.getGame() %></li>
					<li>操作系统：<%=buyOrder.getSystem() %></li>
					<li>角色等级：<%=buyOrder.getLevel() %></li>
					<li>商品描述：<%=buyOrder.getInformation() %></li>
				
				</ul>
			</div>
		</div>
		<%
			}
		%>
	</div>
</div>
<jsp:include page="../floor.jsp"></jsp:include>
</body>
</html>