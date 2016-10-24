<%@page import="vo.Message"%>
<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="factory.ProductFactory"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易猫_手机游戏交易平台</title>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">

<link rel="stylesheet" type="text/css" href="css/message.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="../top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>信件</span>
</div>
<%
	String name = (String)session.getAttribute("User");
	User user = UserFactory.get().findById(name);
%>
<div class="management">
	<div class="managementInclude">
		<div class="managementLeft">
			<br>
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
			<div class="search">
				<div class="search1">
					<span><b>我的站内信</b></span>
				</div>
				<div class="search2">
					<ul>
						<li>
							全部商品
						</li>
						<li>
							待提交
						</li>
						<li>
							审核中
						</li>
						<li>
							已上架
						</li>
						<li>
							已下架
						</li>
						<li>
							库存为零
						</li>				
					</ul>
				</div>

				<div class="search4">
					<div class="mycenter-head">
						<ul >
							<li class="title1">类型</li>
							<li class="title2">标题</li>
							<li class="title3">时间</li>
						</ul>
					</div>
					<% 
						int index=1;
						if(request.getParameter("index")!=null){
							index = new Integer(request.getParameter("index"));
						}
						List<Message> list = null;
						list = MessageFactory.get().findByOwn(name,index);
						for(Message message:list){
					%>						
						<div class="booking-table">
							<ul >
								<li class="item-info">
									<div class="con">
										<span class="unit">
											<%= message.getType()%>
										</span>
										<span class="name"><a href="message.jsp?listIndex=<%=message.getListIndex()%>">
										<%=message.getTitle() %></a></span>
										<span class="count"><%= message.getTime()%></span>
									</div>
								</li>
							</ul>
						</div>
						<%
							}
						%>
				</div>
				<div class="index">
					<%
						if(index==1){
					%>
						无上页
					<%	
						}else{
					%>
						<a href="showMessage.jsp?index=<%=index-1 %>">上一页</a>
					<%
						}
						int count =MessageFactory.get().count(name);
						count =count/6+1;
						int i =0;
						if((index-5)<0){
							i=0;
						}else{
							i=index-5;
						}
						for(int x=i;x<Math.min(Math.max(10, index+5), count);x++){
							if(x!=index-1){
					%>
						<a href="showMessage.jsp?index=<%=x+1 %>"><%=x+1 %></a>	
					<% 		
							}else{
					%>
							<%=x+1 %>
					<% 			
							}
						}
					%>
					<%
						if(index==count){
					%>
						无下页
					<%	
						}else{
					%>
						<a href="showMessage.jsp?index=<%=index+1 %>">下一页</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../floor.jsp"></jsp:include>
</body>
</html>