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
		width:100%;
		height: 81px;
	}
	.top .topInclude{
		width:80%;
		height: 81px;
		margin: 0 auto;
	}
	.login{
		background-color:#E0E0E0;
		width:100%;
		height: 547px;
	}
	.login .loginInclude{
		background-color:white;
		width: 1000px;
		height: 547px;
		margin:0 auto;
	}
	.login .title{
		border:1px solid;
		background-color:#E0E0E0;
	}
	.login h3{
		font-size: 15px;
		margin-top: 25px;
	}
	.login .loginMain{
		padding-left:50px;
		padding-top:35px;
		width: 503px;
		height: 514px;
		float: left;
	}
	.login .friend{
		margin-right:200px;
		margin-top:65px;
		float: right;
	}

	.login .loginMain .text{
		margin-top: -8px;
		width: 300px;
		height: 30px;
	} 
	.login .loginMain .left{
		margin-top: 20px;
		float: left;
	}
	.login .loginMain .right{
		margin-top: 20px;
		float: right;
		margin-right: 203px;		
	}
	
	.login .loginMain .button{
		margin-top:20px;
		width: 300px;
		height: 30px;
		color: white;
		border: 0px;
		background-color: blue;
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
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="top">
	<div class="topInclude">
		<img src="./image/logo.png">
		<img src="./image/logo2.png">
	</div>
</div>
<div class="login">
	<div class="loginInclude">
		<div class="title">
			使用UC账号登录交易猫
		</div>
		<div>
			<div class="loginMain">
			<s:form action="login" >
				<h3>账号:</h3><br>
				<s:textfield class="text" name="name" label="用户名"/> <br>
				<s:fielderror cssStyle="color: red">
              		<s:param>name</s:param>
        		</s:fielderror>
        		<h3>密码:</h3><br>
				<s:password class="text" name="password" label=" 密 码 "/><br>
				<s:fielderror cssStyle="color: red">
              		<s:param>password</s:param>
        		</s:fielderror><br>
				<s:submit class="button" value="登录"></s:submit>
			</s:form>	
			<span class="left">忘记密码 | 遇到问题</span>  <span class="right">免费注册</span>
			</div>
			<div class="friend">
				使用合作网站账号登录：<br>
				<button >腾讯QQ</button>
			</div>
		</div>
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