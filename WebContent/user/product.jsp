<%@page import="factory.MessageFactory"%>
<%@page import="factory.ProductFactory"%>
<%@page import="vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="css/showBuyOrder.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/buyOrder.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易猫_手机游戏交易平台</title>
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="../top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>查看我的商品</span>
</div>
<%
	String listIndex = request.getParameter("listIndex");
	Product product = null;
	product = ProductFactory.get().findById(listIndex);
	if(product!=null){

%>
	<div class="product">
		<div class="productInclude">
			<div class="productTop">
				<span><%=product.getProductName() %></span>
				<span>商品价格：<%=product.getPrice() %></span>
				<span>保障服务：已通过支付宝实名认证</span>
				<span>出售次数:在交易猫已有 <%=product.getSellNumber() %> 次交易记录</span>
				<span>商品已售完</span>
				
				<span>等级 ：<%=product.getLevel() %></span>
				<span>操作系统 ：<%=product.getSystem() %></span>
				<span>所属游戏 ：<%=product.getGame() %></span>
				<span>描述 ：<%= product.getInformation()%></span>
				<span>帐号 ：<%=product.getAccount() %></span>
				<span>密码 ：<%=product.getPassword() %></span>
				<span>
					<s:fielderror  cssStyle="color: red">
		              			<s:param>product</s:param>
		        	</s:fielderror>
				</span>
				<span>
				<form action="Buy">
					<input type="hidden" name = "productListIndex" value="<%=product.getListIndex()%>">
					<input type="hidden" name="nowUser" value="${sessionScope.User}">
					<input class="button" type="submit" value ="购买">
				</form>
				</span>
			</div>
			<div>
			
			</div>
		</div>
		
	</div>
<%
	}
%>
<jsp:include page="../floor.jsp"></jsp:include>
</body>
</html>