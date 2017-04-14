<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="../css/reset.css" type="text/css" rel="stylesheet" /> -->
<link href="/MavenPrj/resource/css/customer/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<!-- -------------header--------------------->
	<!-- 헤더부분 -->
	<tiles:insertAttribute name="header" />
	<!-- --------visual ----------------------->
	<!--  비주얼 부분 -->
	<tiles:insertAttribute name="visual" />
	<!-- ----------------body --------------->
	<div id="body">
		<div class="content-container clearfix">
			<!-- 어사이드 부분 -->
			<tiles:insertAttribute name="aside" />

	<!-- 메인부분 -->
			<tiles:insertAttribute name="main" />
		</div>
	</div>
	<!-- --------footer -------------------->
	<!-- 풋터 -->
	<tiles:insertAttribute name="footer" />
	<!-- 	<section id="quick-menu">
 	<h2>퀵메뉴</h2>
	
	</section> -->
</body>
</html>