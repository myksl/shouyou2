<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	.top{
		width: 100%;
		height: 101px;
	}
	.top .topInclude{
		width: 80%;
		height: 101px;
		margin: 0 auto;
	}
	.top .topInclude .topLeft{
		float: left;
	}
	.top .topInclude .topRight{
		float: right;
	}
	.top .topInclude .topLeft span{
		padding-top:13px;
		display: block;
	}
	.top .topInclude .topLeft ul{
		list-style: none;
	}
	.top .topInclude .topLeft ul li{
		float: left;
	}
	.register{
		width: 100%;
		height: 101px;
	}
	.register.topInclude{
		width: 85%;
		height: 101px;
		margin: 0 auto;
	}
	.register .registerInclude .registerLeft{
		width:164px;
		height:190px;
		float: left;
	}
	.register .registerInclude .registerRight{
		width:806px;
		height:699px;
		float: right;
	}
	.register .registerInclude .registerRight .text{
		width: 306px;
		height: 26px;
	}
	.register .registerInclude .registerRight .submit{
		width: 128px;
		height: 30px;
		border: 0px;
		color:white;
		background-color: blue;
		margin-left: 140px;
		margin-top: 30px;
	}
	.register .registerInclude .registerRight .registerForm{
		padding-top: 100px;
	}



</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="top">
	<div class="topInclude">
		<div class="topLeft">
			<ul>
				<li>
					<img src="./image/logo3.png">
				</li>
				<li>
					<span>UC账号是UC各业务通行的账号。<br>
					拥有UC账号，你就可以玩转UC！</span>
				</li>
			</ul>
		</div>
		<div class="topRight">
			返回首页
		</div>
	</div>
</div>
<div class="register">
	<div class="registerInclude">
		<div class="registerLeft">
		
		</div>
		<div class="registerRight">
		提示：如果你已有UC账号，请直接  登录
		<s:form class="registerForm" action="register" validate="true">
			登录账号 ：<s:textfield class="text" label="用户名" name ="name"/>
			<s:fielderror cssStyle="color: red">
           		<s:param>name</s:param>
      		</s:fielderror><br>
			设置密码 ：<s:password class="text" label="输入密码" name="password"/>
			<s:fielderror cssStyle="color: red">
           		<s:param>password</s:param>
       		</s:fielderror><br>
			确认密码 ：<s:password class="text" label="确认密码" name="password2"/><br>
			Q Q 号码 ：<s:textfield class="text" label="QQ" name ="qq"/><br>
			电话号码 ：<s:textfield class="text" label="电话号码" name ="phone"/><br>
			<s:submit class="submit"  value="注册"/>
		</s:form>
		</div>
	</div>
</div>
</body>
</html>