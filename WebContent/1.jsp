<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
	 ul{
		list-style: none;
		float: left;
	}
	 ul li{
		float: left;
	}
	.mycenter-head{
		width: 100%;
		height: 23px;
	}
	 .mycenter-head .title1{
		padding-left: 50px;
	}
	 .mycenter-head .title2{
		margin-left: 150px;
	}
	 .mycenter-head .title3{
		margin-left: 20px;
	}
	 .mycenter-head .title4{
		margin-left: 20px;
	}
	 .mycenter-head .title5{
		margin-left: 20px;
	}
	 .con span{
		display: inline-block;
	}
	.booking-table{
		clear:both;
		width: 100%;
		height: 120px;
	}
	 .con .name{
		width: 240px;
		height: 80px;
	}
	 .con .unit{
		width: 90px;
		height: 80px;
		text-align: center;
	}
	 .con .count{
		width: 50px;
		height: 80px;		
		text-align: center;
	}
	 .con .status{
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
	<div class="mycenter-head">
		<ul >
		<li class="title1">商品名称</li>
		<li class="title2">单价（元）</li>
		<li class="title3">库存</li>
		<li class="title4">商品状态</li>
		<li class="title5">操作</li>
		</ul>
	</div>
	<div class="booking-table">
		<ul >
			<li class="item-info">
				<div class="head">
					<span>寄售</span>
				</div>
				<div class="con">
					<span class="name">
						<a href="">1111</a>
					</span>
					<span class="unit">560</span>
					<span class="count">1</span>
					<span class="status">交易成功</span>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>