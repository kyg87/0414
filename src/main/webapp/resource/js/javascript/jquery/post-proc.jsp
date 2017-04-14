<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String title = request.getParameter("title");
System.out.println(title);
%>

echo : <%=title%>