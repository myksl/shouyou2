<%@page import="vo.Product"%>
<%@page import="factory.ProductFactory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
	.product{
		width: 100%;
		height: 920px;
	}
	.product .productInclude{
		width: 90%;
		height: 920px;
		margin-top: 50px;
	}
	.product .productInclude  ul{
		list-style: none;
		float: left;
	}
	.product .productInclude  ul li{
		float: left;
	}
	.product .productInclude .head{
		width: 740px;
		height: 30px;
		margin: 0 auto;
	}
	.product .productInclude .mycenter-head .title1{
		padding-left: 50px;
	}
	.product .productInclude .head .title2{
		margin-left: 270px;
	}
	.product .productInclude .head .title3{
		margin-left: 60px;
	}
	.product .productInclude .main{
		width: 740px;
		height: 90px;
		margin: 0 auto;
		margin-top: 40px;
		border: 1px solid black; 
	}
	.product .productInclude .main .title span{
		margin-top:20px;
		display: block;
	}
	.product .productInclude .main .title{
		width:400px;
		float: left;
	}
	.product .productInclude .main .price{
		color:red;
		margin-top:20px;
		width:110px;
		float: left;
	}
	.product .productInclude .main .remaining{
		margin-top:20px;
		width:80px;
		float: left;
	}


</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		
		List<Product> list = null;
		list = ProductFactory.get().findAll();
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
	
	</div>
</div>
</body>
</html>