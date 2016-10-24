<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="factory.MessageFactory"%>
<%@page import="factory.ProductFactory"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/shouye.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<title>首页</title>
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="top.jsp"></jsp:include>

<div class="product">
	<div class="productInclude">
		<div class="head">
			<ul >
			<li class="title1">商品名称</li>
			<li class="title2">单价（元）</li>
			<li class="title3">库存</li>
			</ul>
		</div>
		<% 
			int index=1;
			if(request.getParameter("index")!=null){
				index = new Integer(request.getParameter("index"));
			}
			List<Product> list = null;
			list = ProductFactory.get().findAll(index);
			for(Product product:list){
		%>						
		<div class="main">
			<div class="title">
				<span><a href="product.jsp?listIndex=<%=product.getListIndex()%>"><%= 
								product.getProductName()%></a></span>
				<span>所属游戏：<%=product.getGame() %></span>
			</div>
			<div class="price">
				<span><%=product.getPrice() %></span>
			</div>
			<div class="remaining">
				<span><%=product.getRemaining()%></span>
			</div>
		</div>
		<%
			}
		%>
		<div class="index">
		<%
			if(index==1){
		%>
			无上页
		<%	
			}else{
		%>
			<a href="shouYe.jsp?index=<%=index-1 %>">上一页</a>
		<%
			}
			int count =ProductFactory.get().count();
			count =count/8+1;
			int i =0;
			if((count-10)<0){
				i=0;
			}else{
				i=count-10;
			}
			for(int x=i;x<count;x++){
				if(x!=index-1){
		%>
			<a href="shouYe.jsp?index=<%=x+1 %>"><%=x+1 %></a>	
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
			<a href="shouYe.jsp?index=<%=index+1 %>">下一页</a>
		<%
			}
		%>
		</div>
	</div>
</div>
<jsp:include page="floor.jsp"></jsp:include>
</body>
</html>