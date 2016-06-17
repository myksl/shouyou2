<%@page import="factory.UserFactory"%>
<%@page import="vo.User"%>
<%@page import="factory.ProductFactory"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
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
	.management .managementInclude .managementRight .search .search2{
		margin-top: 20px;
	}
	.management .managementInclude .managementRight .search .search2 ul{
		list-style: none;
		float: left;
	}
	.management .managementInclude .managementRight .search .search2 ul li{
		float: left;
	}
	.management .managementInclude .managementRight .search .search3{
		margin-top: 50px;
	}
	.management .managementInclude .managementRight .search .search3 ul{
		list-style: none;
		float: right;
	}
	.management .managementInclude .managementRight .search .search3 ul li{
		float: left;
	}
	.management .managementInclude .managementRight .search .search4{
		margin-top: 50px;
	}
	.management .managementInclude .managementRight .search .search4  ul{
		list-style: none;
		float: left;
	}
	.management .managementInclude .managementRight .search .search4  ul li{
		float: left;
	}
	.management .managementInclude .managementRight .search .search4 .mycenter-head .title1{
		padding-left: 50px;
	}
	.management .managementInclude .managementRight .search .search4 .mycenter-head .title2{
		margin-left: 150px;
	}
	.management .managementInclude .managementRight .search .search4 .mycenter-head .title3{
		margin-left: 20px;
	}
	.management .managementInclude .managementRight .search .search4 .mycenter-head .title4{
		margin-left: 20px;
	}
	.management .managementInclude .managementRight .search .search4 .mycenter-head .title5{
		margin-left: 20px;
	}
	.management .managementInclude .managementRight .search .search4 .con span{
		display: inline-block;
	}
	.management .managementInclude .managementRight .search .search4 .con .name{
		width: 240px;
		height: 80px;
	}
	.management .managementInclude .managementRight .search .search4 .con .unit{
		width: 90px;
		height: 80px;
		text-align: center;
	}
	.management .managementInclude .managementRight .search .search4 .con .count{
		width: 50px;
		height: 80px;		
		text-align: center;
	}
	.management .managementInclude .managementRight .search .search4 .con .total{
		margin-left:10px;
		width: 74x;
		height: 80px;		
		text-align: center;
	}
	.management .managementInclude .managementRight .search .search4 .con .status{
		margin-left:30px;
		width: 86x;
		height: 80px;		
		text-align: center;
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
		<div class="managementRight">
			<div class="search">
				<div class="search1">
					<form action="">
						管理我的商品<br>
						选择游戏 
						<select>
							<option name="">
							</option>
								</select>
						</select> 
						商品类型
						 <select>
							<option name="">
							</option>
						</select><br>
						创建时间 
						<input type="text" name="">
						商品状态
						 <select>
							<option name="">
							</option>
						</select>
						<input type="submit" value="查找">
					</form>
				</div>
				<div class="search2">
					<ul>
						<li>
							全部商品
						</li>
						<li>
							待提交
						</li>
						<li>
							审核中
						</li>
						<li>
							已上架
						</li>
						<li>
							已下架
						</li>
						<li>
							库存为零
						</li>				
					</ul>
				</div>

				<div class="search4">
					<div class="mycenter-sort">
						<span class="game-sort"><span class="title">订单排序</span>
						<select class="select" id="orderBySel">
							<option value="1" >按时间由近到远</option>
							<option value="2" >按时间由远到近</option>
						</select></span>
					</div>
					<div class="mycenter-head">
						<ul >
						<li class="title1">商品名称</li>
						<li class="title2">单价（元）</li>
						<li class="title3">库存</li>
						<li class="title4">商品状态</li>
						<li class="title5">操作</li>
						</ul>
					</div>
					<% 

						List<Product> list = null;
						list = ProductFactory.get().findByOwn(name);
						for(Product product:list){
					%>						
						<div class="booking-table">
							<ul >
								<li class="item-info">
									<div class="head">
										<span>寄售</span>
									</div>
									<div class="con">
										<span class="name">
											<a href="product.jsp?listIndex=<%=product.getListIndex()%>"><%= 
												product.getProductName()%></a>
										</span>
										<span class="unit"><%=product.getPrice() %></span>
										<span class="count">1</span>
										<span class="status">交易成功</span>
										<span>
											<a href="updateProduct.jsp?listIndex=<%=product.getListIndex()%>">修改</a>
											<a href="DeleteProduct?listIndex=<%=product.getListIndex()%>">删除</a>
										</span>
									</div>
								</li>
							</ul>
						</div>
						<%
						}
						%>
				</div>
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