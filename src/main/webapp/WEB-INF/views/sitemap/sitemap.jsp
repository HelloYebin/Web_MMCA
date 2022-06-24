<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/sitemap.css">

</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
<h2>Site Map</h2>
<br>
<hr>
<br>
<div class="linkBlock" align="center">
	<h3>관람/참여</h3>
	<hr>
	<table class="list">
	<tr><td><a href="/mygit/notice_list.do?rpage=1">공지</a></td></tr>
	<tr><td><a href="/mygit/comment_list.do">관람후기</a></td></tr>
	<tr><td><a href="/mygit/faq_list.do">FAQ</a></td></tr>
	<tr><td><a href="/mygit/qna_list.do?rpage=1">Q&A</a></td></tr>
	</table>
</div>

<div class="linkBlock" align="center">
	<h3>전시</h3>
	<hr>
	<table class="list">
	<tr><td><a href="/mygit/off_now.do">현재전시</a></td></tr>
	<tr><td><a href="/mygit/off_future.do">예정전시</a></td></tr>
	<tr><td><a href="/mygit/off_past.do">과거전시</a></td></tr>
	</table>

</div>

<div class="linkBlock" align="center">
	<h3>디지털미술관</h3>
	<hr>
	<table class="list">
	<tr><td><a href="/mygit/online/on_show.do">온라인전시</a></td></tr>
	<tr><td><a href="/mygit/online/collectionList.do?rpage=1">소장품</a></td></tr>
	<tr><td><a href="/mygit/online/digitalMovList.do?rpage=1">온라인컨텐츠</a></td></tr>
	<tr><td><a href="/mygit/usergal/usergal_list.do">이용자갤러리</a></td></tr>
	</table>
</div>

<div class="linkBlock" align="center">
	<h3>예약</h3>
	<hr>
	<table class="list">
	<tr><td><a href="/mygit/reservation.do">전시예약</a></td></tr>
	</table>
</div>

<div class="linkBlock" align="center">
	<h3>서브메뉴</h3>
	<hr>
	<table class="list">
	<tr><td><a href="/mygit/join.do">회원가입</a></td></tr>
	<tr><td><a href="/mygit/login.do">로그인</a></td></tr>
	<c:if test="${id=='admin' }">
	<tr><td><a href="/mygit/admin.do">관리자페이지</a></td></tr>
	</c:if>
	</table>
</div>

</section>

<jsp:include page="../footer.jsp"></jsp:include>
 
</body>
</html>