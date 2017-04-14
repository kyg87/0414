<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<header>
		<a href="../index.html">Home</a>
		<c:if test="${empty sessionScope.id }">
		<a href="joinus/login">로그인</a>
		</c:if>
		<c:if test="${not empty sessionScope.id }">
		<a href="joinus/logout">${sessionScope.id }님 로그아웃</a>
		</c:if>
		<a href="">회원가입</a>
		<a href="customer/notice">고객센터</a>
	</header>
	<h1>홈페이지 환영</h1>

</body>
</html>