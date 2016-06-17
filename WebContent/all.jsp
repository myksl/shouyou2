<%@page import="factory.ChatFactory"%>
<%@page import="vo.Chat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Chat> list = null;
	list = ChatFactory.get().findAll();
	for(Chat chat:list){
%>
	<a href="kefu.jsp?username=<%=chat.getUser() %>">来自<%=chat.getUser() %>的客服请求</a><br>
<% 		
	}
%>
</body>
</html>