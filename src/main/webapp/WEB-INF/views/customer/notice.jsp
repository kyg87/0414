<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<main id="main">

			<h2 class="main-title">
				공지사항[${size}]
				<%-- 공지사항[<%=size%>] --%>
			</h2>

			<div class="breadcrumb">
				<h3 class="hidden">현재</h3>
				<ul>
					<li>home</li>
					<li>고객센터</li>
					<li>공지사항</li>
				</ul>
			</div>
			<form class="main-margin">
				<fieldset>
					<legend class="hidden">검색필드</legend>
					<label class="hidden">검색분류</label> <select name="f">
						<c:if test="${param.f=='TITLE'}">
							<d:set var="selTitle" value="selected" />
						</c:if>
						<c:if test="${param.f=='CONTENT'}">
							<d:set var="selContent" value="selected" />
						</c:if>

						<option value="TITLE" ${setTitle}>제목</option>
						<option value="CONTENT" ${setContent}>내용</option>
						<!--  --------------------------------------------------->
						<%-- <option value="TITLE" 
						<%if(field.equals("TITLE")){ %>
						selected <%} %>>제목</option> --%>

						<%-- 
						<option value="CONTENT" <%if(field.equals("CONTENT")){%> selected
							<% } %>>내용</option> --%>
						<!--  --------------------------------------------------->

					</select> <label class="hidden">검색어</label> <input name="q" type="text"
						value="${param.q}" placeholder="검색어를 입력하세요" /> <input
						class="btn btn-search" type="submit" value="검색" /> <input
						type="hidden" name="p" value="1" />
				</fieldset>
			</form>

			<div class="notice margin">
				<h3 class="hidden">공지목록</h3>
				<script>
               window.addEventListener("load", function(e) {


               		
               		var moreBtn =document.querySelector("#more-button");
               		
            	  	var notices= [
            	  		{code:"1", title:"오오오"},
  						{code:"2", title:"요요요"},
  						{code:"3", title:"유유윱"}
  						];
               		moreBtn.onclick = function(){
                   		var template=document.querySelector("#notice-row");
                   		for(var i in notices){
                       		var tbody=document.querySelector(".notice-table tbody");
                       		var tds = template.content.querySelectorAll("td");
                       		
                       		tds[0].innerText=notices[i].code;
                       		tds[1].innerText=notices[i].title;
                       		
                       		var clone =document.importNode(template.content, true);
                       		tbody.appendChild(clone);
                   		}
               		};              		
               });
               
               </script>
				<table class="table notice-table">
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>

					<tbody>
						<template id="notice-row">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</template>

						<c:forEach var="v" items="${list}">
							<%-- <%for(NoticeView v : list){%> --%>
							<tr>
								<td>${v.code}</td>
								<td><a href="notice-detail?c=${v.code}">${v.title}</a></td>
								<td>${v.writer}</td>
								<td>${v.regDate}</td>
								<td>${v.hit}</td>
							</tr>
							<%-- <%} %> --%>
						</c:forEach>
					</tbody>
				</table>
				<c:set var="last" value="${(size % 10) > 0 ? size / 10+1 : size / 10}"/>
			</div>
			<!--  --------------------------------------------------->
			<%-- 	<%		
			int last = (size % 10) > 0 ? size / 10+1 : size / 10;
		    %> --%>
			<!--  --------------------------------------------------->
			
			<div class="margin">${param.p}/${last}
				pages
			</div>



			<div class="margin">
				<div>
					<a href="">이전</a>
				</div>
				<ul>

					<%-- <%for(int i=0;i<last;i++){ %>
					<li><a href="?p=<%=i+1 %>&f=<%=field%>&q=<%=query%>"><%=i+1 %></a></li>
					<%} %> --%>


				</ul>
				<div>
					<a href="">다음</a>
				</div>
			</div>

			<div>
				<a href="notice-reg">글쓰기</a> <span id="more-button">더보기</span>
			</div>
			</main>