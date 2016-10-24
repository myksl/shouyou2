<%@page import="factory.MessageFactory"%>
<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
<link rel="stylesheet" type="text/css" href="css/updateUser.css">
</head>
<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="../top.jsp"></jsp:include>
<div class="nav">
		<span class="span"><a href="shouye.html">首页</a></span><span class="span"><a href="geRenZhongXin.html">个人中心</a></span><span>查看我的商品</span>
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
		
			<div class="register">
				<div class="registerInclude">
				<span><b>修改账号信息</b></span>
					<hr>			
					<s:form class="registerForm" action="UpdateUser" validate="true">
						<input type="hidden" name="name" value="<%=user.getName()%>">
						设置密码 ：<s:textfield class="text" label="输入密码" name="password"/>
						<s:fielderror  class="error" cssStyle="color: red">
			           		<s:param>password</s:param>
			       		</s:fielderror><br><br>
						确认密码 ：<s:textfield class="text" label="确认密码" name="password2"/><br><br>
						Q Q号 码  ：<s:textfield class="text" label="QQ" name ="qq"/><br><br>
						电话号码 ：<s:textfield class="text" label="电话号码" name ="phone"/><br><br>
						<s:submit class="submit"  value="提交"/>
					</s:form>
					</div>
			</div>

		</div>
	</div>
</div>
<jsp:include page="../floor.jsp"></jsp:include>
</div>
</body>
</html>