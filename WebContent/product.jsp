<%@page import="factory.ProductFactory"%>
<%@page import="vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	.top{
		width: 100%;
		height: 36px;
	}
	.top .topinclude{
		width: 80%;
		height: 36px;
		margin: 0 auto;
	}
	.top .topleft ul{
		list-style: none;
		float: left;
	}
	.top .topleft ul li{
		float: left;
		margin-right: 5px;
	}
	.top .topright ul {
		list-style: none;
		float: right;
	}
	.top .topright ul li{
		float: left;
		margin-right: 5px;
	}
	.logo{
		width: 100%;
		height: 61px;
	}
	.logo .logoinclude{
		width: 80%;
		height: 61px;
		margin: 0 auto;
	}
	.logo .search{
		float: right;
	}
	.logo .logopic{
		float: left;
	}
	.logo .search .text{
		width:340px;
		height:26px;
	}
	.logo .search .button{
		width:70px;
		height:30px;
		font-size: 15px;
		color: white;
		background-color: blue;
		border: 0px;
	}
	.navigation{
		clear:both;
		width: 100%;
		background-color:gray;
		height: 36px;
		color: white;
		font-size: 25px;
	}
	.navigation ul{
		list-style: none;
	}
	.navigation ul li{

		margin-top:5px;
		float: left;
		margin-right: 30px;
	}
	.navigationinclude{
		width: 830px;
		height: 36px;
		margin: 0 auto;

	}
	.footer{
		color:white;
		background-color:gray;
		width: 100%;
		height: 230px;
	}
	.footer .footerInclude{
		width: 80%;
		height: 230px;
		margin:  0 auto;
	}
	.footer ul{
		padding-left:100px;
		list-style: none;
		float: left;
	}
	.footer ul li{
		margin-top:30px;
		margin-right:100px;
		float: left;
	}
	.product {
		width: 100%;
		height: 500px;
	}
	.product .productInclude {
		width: 80%;
		height: 500px;
		margin: 0 auto;
	}
	.product .productInclude .productTop span{
		display: block;
		margin-top: 5px;
	}
	.product .productInclude .productTop .button{
		width:70px;
		height:30px;
		font-size: 15px;
		color: white;
		background-color: blue;
		border: 0px;
	}	
	
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="top">
	<div class="topinclude">
		<div class="topleft">
		<ul>
			<li>
			手机版
			</li>
			<li>
			电脑版
			</li>
		</ul>
		</div>
		<div class='topright'>
			<ul>
			<li>
			<% 
				HttpSession sess =request.getSession();
				String name = "";
				if(sess.getAttribute("User")!=null){
				name = 	(String)sess.getAttribute("User");
			%>
				欢迎<%=name %>登录交易猫
			<%}else{
			%>
				您好 欢迎访问交易猫
			<%
				}
			%>
			</li>
			<li>
				<a href="register.jsp">注册</a>
			</li>
			<li>
			<% 
				if(sess.getAttribute("User")!=null){
			%>
				<a href="out.jsp">注销</a>
			<%
				}else{
			%>
				<a href="login.jsp">登录</a>
			<%
				}
			%>
			</li>
			<li>	
				购买记录
			</li>
			<li>
				<a href="geRenZhongXin.jsp">个人中心</a>
			</li>
			<li>
				下载APP
			</li>
			</ul>
		</div>
	
	</div>
</div>
<div class="logo">
	<div class="logoinclude">
		<div class="logopic">
			<img src="./image/logo.png">
			<img src="./image/logo2.png">
		</div>
		<div class="search">
			<from>
				<input class="text" type ="text" name ="search">
				<input class="button" type="submit" value="搜索">
			</from>
		</div>
	</div>
</div>
<div class="navigation">
	<div class="navigationinclude">
		<ul>
			<li>
				首页
			</li>
			<li>
				首充号
			</li>
			<li>
				苹果代充
			</li>
			<li>
				游戏专区
			</li>
			<li>
				个人中心
			</li>
			<li>
				帮助中心
			</li>
			
		</ul>
	</div>
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
				<span>商品价格： <%=product.getPrice() %></span>
				<span>保障服务：</span>
				 
				<span>已通过支付宝实名认证</span>
				<span>出售次数:在交易猫已有 <%=product.getSellNumber() %> 次交易记录</span>
				<span>商品已售完</span>
				
				<span>等&nbsp;&nbsp;&nbsp;&nbsp;级 ：<%=product.getLevel() %></span>
				<span>操作系统 ：<%=product.getSystem() %></span>
				<span>所属游戏 ：<%=product.getGame() %></span>
				<span>描&nbsp;&nbsp;&nbsp;&nbsp;述 ：<%= product.getInformation()%></span>
				<span>帐&nbsp;&nbsp;&nbsp;&nbsp;号 ：<%=product.getAccount() %></span>
				<span>密&nbsp;&nbsp;&nbsp;&nbsp;码 ：<%=product.getPassword() %></span>
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
<div class="footer">
	<div class ="footerInclude">
		<ul>
			<li>
				新手入门<br>
				免费注册<br>
				如何购买商品<br>
				如何发布商品
			</li>
			<li>
				诚信服务<br>
				用户协议<br>
				免责声明<br>
				7*24小时服务
			</li>
			<li>
				交易保障<br>
				寄售交易<br>
				支付宝交易<br>
				建议与投诉
			</li>
			<li>
				售后服务<br>
				联系客服
			</li>
			<li>
				友情链接<br>
				九游游戏
			</li>
		</ul>
	</div>
</div>
</body>
</html>