<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/on_list.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/on_list.js"></script>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
<br><br>
<section>
	<h2>전시 목록</h2>
	<br><br><hr><br><br>
	
	<div id="list">
			<c:forEach var="vo" items="${list}">
			<div class="show_info">
				<img src="${vo.rimg }" class="show_poster">
				<input class="res_id" type="text" hidden="hidden" value="${vo.res_id }">
				<p class="show_title">${vo.rtitle }</p><br>
				<p class="show_desc">${vo.rdesc }</p>
				<c:choose>
					<c:when test="${vo.rstate == 1 }">
						<button class="rcancel" value="예약 가능">예약 가능</button>
					</c:when>
					<c:otherwise>
						<button class="rcancel" value="예약 불가">예약 불가</button>
					</c:otherwise>
				</c:choose>
			</div>
			</c:forEach>
		</div>
</section>
<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>