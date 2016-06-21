<%@page import="factory.ChatFactory"%>
<%@page import="vo.Chat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <title>管理员中心</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>
<div class="topbar-wrap white">
    <!--<div class="topbar-inner clearfix">-->
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">管理员中心</a></h1>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="user.jsp"><i class="icon-font">&#xe008;</i>用户管理</a></li>
                        <li><a href="kefu.jsp"><i class="icon-font">&#xe005;</i>客服服务</a></li>
                        <li><a href="order.jsp"><i class="icon-font">&#xe006;</i>订单查询</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.html" color="#white">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">客服请求</span></div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th style="text-align: center;">客服请求</th>
                        </tr>
                        <%
							List<Chat> list = null;
							list = ChatFactory.get().findAll();
							for(Chat chat:list){
						%>
							<tr>
                          	  <td><a href="kefuMain.jsp?username=<%=chat.getUser() %>">来自<%=chat.getUser() %>的客服请求</a><br></td> 
                        	</tr>
						<% 		
							}
						%>
                    </table>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>