<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/reservation_check.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/reservation_check.js"></script>
<script type="text/javascript">
	var res_result = "${res_result}";
	if(res_result=="succ") {
		alert("예약 성공");
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br>
<section>
	<h2>내 예약 내역</h2>
		<br><br><hr>
	<c:choose>
		<c:when test="${sessionScope.id == null }">
			<br><br><br><br><br><br><br><br>
			<span id="warning">로그인이 필요한 서비스입니다.<br>로그인 후에 이용해 주세요.</span>
		</c:when>
		<c:when test="${sessionScope.id != null }">
			<br><br>
			<table border="1">
				<tr>
					<th>예약번호
					<th>전시명
					<th>방문 일자
					<th>방문 시각
					<th>방문 인원
					<th>예약 취소
				</tr>
				<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.rid }
					<td>${vo.rtitle }
					<td>${vo.rdate }
					<td>${vo.rtime }
					<td>${vo.rnum }
				<c:choose>
					<c:when test="${vo.rcancel == 0 }">
						<td><button class="rcancel" value="취소">취소</button>
					</c:when>
					<c:otherwise>
						<td><button class="rcancel" value="복원">복원</button>
					</c:otherwise>
				</c:choose>
				</tr>
				</c:forEach>
			</table>
		</c:when>
	</c:choose>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>