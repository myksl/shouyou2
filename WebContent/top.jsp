<%@page import="factory.MessageFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
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
				<a href="user/out.jsp"> 注销 </a>|
			<%
				int count =MessageFactory.get().NoSee(name);
			%>
				<a href="user/showMessage.jsp">消息[<font color="red"><%=count %></font>]</a>
			<%
				}else{
			%>
				<a href="register.jsp"> 注册 </a>|
				<a href="login.jsp">登录</a>
			<%
				}
			%>
			</li>
			<li>	
				<a href="user/showBuyOrder.jsp"> 购买记录 |</a>
			</li>
			<li>
				<a href="user/geRenZhongXin.jsp"> 个人中心 |</a>
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
		<a href="user/showMessage.jsp"><span class="word">站内信</span></a>
		<input type="radio" id="radio_control_3" name="radio_set" />
		<a href="allProduct.jsp"><span class="word">商品</span></a>
		<input type="radio" id="radio_control_4" name="radio_set" />
		<a href="#"><span class="word">游戏专区</span></a>
		<input type="radio" id="radio_control_5" name="radio_set" />
		<a href="user/geRenZhongXin.jsp"><span class="word">个人中心</span></a>
		<input type="radio" id="radio_control_6" name="radio_set" />
		<a href="user/main.jsp"><span class="word">客服中心</span></a>
	</div>
</div>
  </body>
</html>
