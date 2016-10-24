<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/title.css">
	<link rel="stylesheet" type="text/css" href="css/sell.css">
	<title>交易猫_手机游戏交易平台</title>
</head>

<body>
<script type="text/javascript" src="js/logo.js"></script>
<jsp:include page="../top.jsp"></jsp:include>
	<% 
		String listIndex = request.getParameter("listIndex");
		String name = 	(String)session.getAttribute("User");
	%>
	<div class="sell">
		<div class="progress">
			<span>选择游戏类型</span><span>填写游戏信息</span><span>发布成功</span>
		</div>
		<div class="sellInclude">
			<section>
				<span>常用分类：</span>
				<form action="">
					<select name="" id="">
						<option value="请选择">请选择</option>
					</select>
				</form>
			</section>

			<section>
				<s:form action="UpdateProduct" validate="true">
					<fieldset>
						<legend>出售商品信息</legend>
					<ul>
						<li>
							商品名称<s:textfield class="text"  name="productName"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>productName</s:param>
		        			</s:fielderror>
						</li>
						<li>
							<input  name="own" type="hidden" value="<%=name%>"/>
							<input  name="listIndex" type="hidden" value="<%=listIndex%>"/>
						</li>
						<li>
							账&nbsp;&nbsp;&nbsp;&nbsp;号<s:textfield class="text"  name="account"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>account</s:param>
		        			</s:fielderror>
						</li>
						<li>
							密&nbsp;&nbsp;&nbsp;&nbsp;码<s:textfield class="text"  name="password"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>password</s:param>
		        			</s:fielderror>
						</li>
						<li>
							所属游戏<s:textfield class="text"  name="game"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>game</s:param>
		        			</s:fielderror>
						</li>
						<li>
							操作系统<s:textfield class="text"  name="system"/>		
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>system</s:param>
		        			</s:fielderror>			
						</li>
						<li>
							等&nbsp;&nbsp;&nbsp;&nbsp;级<s:textfield class="text"  name="level"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>level</s:param>
		        			</s:fielderror>
						</li>
						<li>
							价&nbsp;&nbsp;&nbsp;&nbsp;格<s:textfield class="text"  name="price"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>price</s:param>
		        			</s:fielderror>
						</li>
						<li>
							描&nbsp;&nbsp;&nbsp;&nbsp;述<s:textarea  class="text" cols="70" rows="3"   name="information"/>
							<s:fielderror class="error"cssStyle="color: red">
		              			<s:param>information</s:param>
		        			</s:fielderror>
						</li>
						<li>
							<s:submit class="button"   value="出售"/>
						</li>
					</ul>
					</fieldset>
				</s:form>
			</section>
		</div>
	</div>

<jsp:include page="../floor.jsp"></jsp:include></body>

</html>