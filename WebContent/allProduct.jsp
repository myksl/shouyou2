<%@page import="factory.MessageFactory"%>
<%@page import="factory.ProductFactory"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易猫-游戏中心</title>
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/title.css">
<link rel="stylesheet" type="text/css" href="css/nav.css">
<link rel="stylesheet" type="text/css" href="css/allProduct.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.jsp">首页</a></span><span class="span"><a href="#">游戏专区</a></span><span>我的账号</span>
</div>

<div class="product">
	<div class="product_title1">
		<span>价格选择：<a href="allProduct.jsp?type=BT&start=0&end=30">30元以下 </a>
		<a href="allProduct.jsp?type=BT&start=30&end=100">30-100元 </a>
		<a href="allProduct.jsp?type=BT&start=100&end=300">100-300元 </a><a href="allProduct.jsp?type=BT&start=300&end=500">300-500元 </a>
		<a href="allProduct.jsp?type=BT&start=500&end=100000">500以上</a></span>
	</div>
	<div class="product_title2" style="text-align: center;">
			<span>所有商品</span>
	</div>
	<div class="product_title3">
			<span><a href="#">最新发布</a><a href="">按单价高到低排序</a><a href="#">按价格高到低排序</a><a href="allProduct.jsp?type=up">按价格低到高排序</a></span>
	</div>
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
			String type ="";
			int start = 0;
			int end = 0;
			if(request.getParameter("type")!=null){
				type= request.getParameter("type");
			}
			if(request.getParameter("index")!=null){
				index = new Integer(request.getParameter("index"));
			}
			List<Product> list = null;
			if(type.equals("")){
				list = ProductFactory.get().findAll(index);
			}else if(type.equals("BT")){
				start = new Integer(request.getParameter("start"));
				end = new Integer(request.getParameter("end"));
				list = ProductFactory.get().findAllBT(index, start,end);
			}else{
				list =  ProductFactory.get().findAllUp(index);
			}
			for(Product product:list){
		%>						
		<div class="main">
			<div class="title">
				<span ><a class="titleT" href="product.jsp?listIndex=<%=product.getListIndex()%>"><%= 
								product.getProductName()%></a></span>
				<span>所属游戏：<%=product.getGame() %></span>
			</div>
			<div class="price">
				<span style="font-size: 16px;"><%=product.getPrice() %></span>
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
			<a href="allProduct.jsp?index=<%=index+1 %>&type=<%=type%>&start=<%=start%>&end=<%=end%>">上一页</a>
		<%
			}
			int count =0;
			if(type.equals("BT")){
				count = ProductFactory.get().countByBt(start,end);
			}else{
				count = ProductFactory.get().count();
			}
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
			<a href="allProduct.jsp?index=<%=index+1 %>&type=<%=type%>&start=<%=start%>&end=<%=end%>"><%=x+1 %></a>	
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
			<a href="allProduct.jsp?index=<%=index+1 %>&type=<%=type%>&start=<%=start%>&end=<%=end%>">下一页</a>
		<%
			}
		%>
		</div>
	</div>
</div>
<jsp:include page="floor.jsp"></jsp:include>
</body>
</html>