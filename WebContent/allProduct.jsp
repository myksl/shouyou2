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
<div class="top">
	<div class="topinclude">
		<div class="topleft">
		<ul>
			<li>
			<b>电脑版</b>
			</li>
			<li>
			<a href="#">手机版</a>
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
				欢迎<%=name %>登录交易猫！
			<%}else{
			%>
				您好 欢迎访问交易猫
			<%
				}
			%>
			</li>

			<li>
			<% 
				if(sess.getAttribute("User")!=null){
			%>
				<a href="out.jsp"> 注销 |</a>
			<%
				int count =MessageFactory.get().NoSee(name);
			%>
				<a href="showMessage.jsp">消息[<font color="red"><%=count %></font>]</a>
			<%
				}else{
			%>
				<a href="register.jsp"> 注册 |</a>
				<a href="login.jsp">登录</a>
			<%
				}
			%>
			</li>
			<li>	
				<a href="showBuyOrder.jsp"> 购买记录 |</a>
			</li>
			<li>
				<a href="geRenZhongXin.jsp"> 个人中心 |</a>
			</li>
			<li>
				<a href="#" onmouseover="over()" onmouseout="out()">
					<div id="image2"><img src="./image/icons.png"></div>
					<div id="image1"><img src="./image/icons.png"></div>
					<span class="download">下载APP</span>
				</a>
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
		<input type="radio" id="radio_control_1" name="radio_set" checked="checked" />
		<a href="shouYe.jsp"><span class="word">首页</span></a>
		<input type="radio" id="radio_control_2" name="radio_set" />
		<a href="showMessage.jsp"><span class="word">站内信</span></a>
		<input type="radio" id="radio_control_3" name="radio_set" />
		<a href="allProduct.jsp"><span class="word">商品</span></a>
		<input type="radio" id="radio_control_4" name="radio_set" />
		<a href="#"><span class="word">游戏专区</span></a>
		<input type="radio" id="radio_control_5" name="radio_set" />
		<a href="geRenZhongXin.jsp"><span class="word">个人中心</span></a>
		<input type="radio" id="radio_control_6" name="radio_set" />
		<a href="main.jsp"><span class="word">客服中心</span></a>
	</div>
</div>

<div class="nav">
		<span class="span"><a href="shouye.jsp">首页</a></span><span class="span"><a href="#">游戏专区</a></span><span>我的账号</span>
</div>

<div class="product">
	<div class="product_title1">
		<span>价格选择：<a href="#">30元以下 </a><a href="#">30-100元 </a><a href="#">100-300元 </a><a href="#">300-500元 </a><a href="#">500以上</a></span>
	</div>
	<div class="product_title2" style="text-align: center;">
			<span>所有商品</span>
	</div>
	<div class="product_title3">
			<span><a href="#">最新发布</a><a href="#">按单价高到低排序</a><a href="#">按价格高到低排序</a><a href="#">按价格低到高排序</a></span>
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
<div class="footer">
	<div class ="footerInclude">
		<ul>
			<li>
				<span>新手入门</span><br>
				<a href="#">免费注册</a><br>
				<a href="#">如何购买商品</a><br>
				<a href="#">如何发布商品</a>
			</li>
			<li>
				<span>诚信服务</span><br>
				<a href="#">用户协议</a><br>
				<a href="#">免责声明</a><br>
				<a href="#">7*24小时服务</a>
			</li>
			<li>
				<span>交易保障</span><br>
				<a href="#">寄售交易</a><br>
				<a href="#">支付宝交易</a><br>
				<a href="#">建议与投诉</a>
			</li>
			<li>
				<span>售后服务</span><br>
				<a href="#">联系客服</a>
			</li>
			<li>
				<span>友情链接</span><br>
				<a href="#">九游游戏</a>
			</li>
		</ul>
		<span class="span1">Copyright © 2013 jiaoyimao.com    版权所有    ICP证：粤ICP备13009613号-2 </span>
	</div>
</div>
</body>
</html>