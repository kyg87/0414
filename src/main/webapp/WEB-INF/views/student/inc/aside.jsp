<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
 
 <c:set var="root" value="${pageContext.request.contextPath}"/>   
<aside id="aside">
				<h1 class="aside-title aside-main-title aside-margin">MY PAGE</h1>
				<nav>
					<h1>마이페이지</h1>
					<ul>
					<security:authorize ifAllGranted="ROLE_ADMIN">
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="${root }/admin/index">관리자홈</a></li>
					</security:authorize>		
					<security:authorize ifAllGranted="ROLE_TEACHER">
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="${root }/teacher/index">선생님홈</a></li>
					</security:authorize>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="${root }/student/index">학생홈</a></li>	
					</ul>
				</nav>
				<nav>
					<h1>수강관리</h1>
					<ul>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">입금확인 대기자</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">입금확인 목록</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">학습안내</a></li>
					</ul>
				</nav>
				<nav>
					<h1>회원메뉴</h1>
					<ul>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">공지사항</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">1:1고객문의</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">학습안내</a></li>
					</ul>
				</nav>
				
				

				<nav>
					<h1 class="aside-title margin">추천사이트</h1>
					<ul class="margin"><%-- ${pageContext.request.contextPath} 리퀘스트를 얻어오는것 --%>
						<li><a href=""><img src="${root}/resource/images/answeris.png"
								alt="앤서이즈"></a></li>
						<li><a href=""><img src="${root}/resource/images/w3c.png" alt="w3c"></a></li>
						<li><a href=""><img src="${root}/resource/images/microsoft.png"
								alt="마이크로소프트"></a></li>
					</ul>
				</nav>
			</aside>