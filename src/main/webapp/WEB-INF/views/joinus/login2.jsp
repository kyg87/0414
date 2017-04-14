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
		<a href="">로그인</a>
		<a href="agree.html">회원가입</a>
		<a href="../customor/notice.html">고객센터</a>
	</header>
	<h1>로그인</h1>
	<form method="post">
		<fieldset>
			<table>
			<tr>
			<c:if test = "${not empty validate && not validate }">
			<tr>
			<td colsapn="2" style="color="red""> 아이디 또는 비밀번호가 유효하지 않습니다.</td>
			</tr>
			
			</c:if>
				<td>아이디 :</td>
				<td><input name="id" type="text"/></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input name="pwd"  type="password"/></td>
			</tr>
			<tr>
				<td><input type="submit" vale="로그인"/></td>
			</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>