<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="factory.SellOrderFactory"%>
<%@page import="vo.SellOrder"%>
<%@page import="factory.BuyOrderFactory"%>
<%@page import="vo.BuyOrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
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
	.management{
		width: 100%;
		height: 1496px;
	}

	.management .managementInclude{
		width: 80%;
		height: 1496px;
		margin: 0 auto;
	}

	.management .managementInclude .managementLeft{
		margin-top:30px;
		width: 185px;
		height: 1496px;
		float: left;
	}
	.management .managementInclude .managementRight{
		margin-top:30px;
		width: 740px;
		height: 1496px;
		float: right;
	}
	.management .managementInclude .managementLeft .title{
		color: red;
	}
	.management .managementInclude .managementRight .search ul{
		margin-top:20px;
		list-style: none;
	}
	.management .managementInclude .managementRight .search .title{
		color: red;
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
<div class="management">
	<div class="managementInclude">
		<div class="managementLeft">
			<br>
			<%
				User user = UserFactory.get().findById(name);
			%>
			<span class="title">登录用户信息</span><br>
			<br>
			<hr>
			账号：<%=user.getName()%><br>
			<br>
			QQ号码：<%=user.getQq()%><br>
			<br>
			手机号码：<%=user.getPhone()%><br>
			<br>
			<hr>
			<br>
			<span class="title">我是买家</span><br>
			<br>
			<hr>			
			我要买<br>
			<br>
			<a href="showBuyOrder.jsp">查看我的订单</a><br>
			<br>
			<hr>
			<br>
			<span class="title">我是卖家</span><br>
			<br>
			<hr>
			<a href="sell.jsp">我要卖</a><br>
			<br>
			<a href="showProduct.jsp">管理我的商品</a><br>
			<br>
			<a href="showSellOrder.jsp">查看我的订单</a><br>
			<br>
			<hr>
		</div>
		<%
			String listIndex = request.getParameter("listIndex");
			SellOrder sellOrder = null;
			sellOrder = SellOrderFactory.get().findById(listIndex);
			if(sellOrder!=null){
		
		%>
		<div class="managementRight">
			<div class="search">
				订单号：1464585058765561
				<ul>
					
					<li><span class="title">订单详情</span></li>
					
					<li>商品名称：<%=sellOrder.getOrderName() %></li>
					<li>所属游戏：<%=sellOrder.getGame() %></li>
					<li>购买价格：<%=sellOrder.getPrice() %></li>
					<li>完成时间：<%=sellOrder.getTime() %></li>
					<li>目前状态： <%=sellOrder.getState() %></li>
				</ul>
				<ul>
					<li><span class="title">商品详情</span></li>
					
					<li>所属游戏：<%=sellOrder.getGame() %></li>
					<li>操作系统：<%=sellOrder.getSystem() %></li>
					<li>角色等级：<%=sellOrder.getLevel() %></li>
					<li>商品描述：<%=sellOrder.getInformation() %></li>
				
				</ul>
			</div>
		</div>
		<%
			}
		%>
	</div>
</div>
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