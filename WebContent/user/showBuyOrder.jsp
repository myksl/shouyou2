<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="factory.BuyOrderFactory"%>
<%@page import="vo.BuyOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="css/showBuyOrder.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="../top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>查看我的订单</span>
</div>

<div class="management">
	<div class="managementInclude">
		<div class="managementLeft">
			<br>
			<%	
				String name = (String)session.getAttribute("User");
				User user = UserFactory.get().findById(name);
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
			<div class="search">
				<span><b>查看我的订单</b></span>
						<hr>
				<div class="search1">
					<form action="">
						<section>
							选择游戏  
							<select>
								<option name=""></option>
							</select>
						</section>
						<section>
							商品类型 
							<select>
								<option name=""></option>
							</select>
						</section><br>
						<section>
							创建时间  
							<input type="text" name=""> 至 <input type="text" name="">
						</section>
						<section>
							商品状态 
						 	<select>
								<option name=""></option>
							</select>
						</section>
						<input type="submit" value="查找">
				</form>
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
					<div class="mycenter-sort">
						<span class="game-sort"><span class="title">订单排序</span>
						<select class="select" id="orderBySel">
							<option value="1" >按时间由近到远</option>
							<option value="2" >按时间由远到近</option>
						</select></span>
					</div>
					<div class="mycenter-head">
						<ul >
						<li class="title1">商品名称</li>
						<li class="title2">单价（元）</li>
						<li class="title3">库存</li>
						<li class="title4">商品状态</li>
						<li class="title5">操作</li>
						</ul>
					</div>
					<% 
						int index=1;
						if(request.getParameter("index")!=null){
							index = new Integer(request.getParameter("index"));
						}
						List<BuyOrder> list = null;
						list = BuyOrderFactory.get().findByOwn(name,index);
						for(BuyOrder buyOrder:list){
					%>						
						<div class="booking-table">
							<ul >
								<li class="item-info">
									<div class="con">
										<span class="name">
											<a href="product.jsp?listIndex=<%=buyOrder.getProductListIndex()%>"><%= 
												buyOrder.getOrderName()%></a>
										</span>
										<span class="unit"><%=buyOrder.getPrice() %></span>
										<span class="count">1</span>
										<span class="status">交易成功</span>
										<span>
											<a href="buyOrder.jsp?listIndex=<%=buyOrder.getListIndex()%>">查看订单</a>
										</span>
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
						<a href="showBuyOrder.jsp?index=<%=index-1 %>">上一页</a>
					<%
						}
						int count =BuyOrderFactory.get().countByOwn(name);
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
						<a href="showBuyOrder.jsp?index=<%=x+1 %>"><%=x+1 %></a>	
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
						<a href="showBuyOrder.jsp?index=<%=index+1 %>">下一页</a>
					<%
						}
					%>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../floor.jsp"></jsp:include>
</body>
</html>