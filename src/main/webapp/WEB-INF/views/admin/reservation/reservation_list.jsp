<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/reservation_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/rlist.js"></script>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
	<section>
		<form action="rsearch.do" method="get">
			<h3>예약 검색</h3>
			<br><hr><br>
			<table id="res_search">
				<tr><th>회원 ID		</th><td><input type="text" name="id"></td></tr>
				<tr><th>전시명		</th><td><input type="text" name="rtitle"></td></tr>
				<tr><th>방문 일자	</th>
					<td><input type="date" name="startdate"> ~ 
					<input type="date" name="enddate"></td>
				</tr>
				<tr><th>방문 시각	</th>
					<td><label><input type='radio' name='rtime' value='10:00 ~ 12:00'> 10:00 ~ 12:00 </label>&nbsp;&nbsp;&nbsp;
					<label><input type='radio' name='rtime' value='13:00 ~ 18:00'> 13:00 ~ 18:00 </label></td>
				</tr>
				<tr><th>방문 인원	</th>
					<td><input type="number" name="startrnum" id="rnum1"> ~ 
						<input type="number" name="endrnum" id="rnum2"></td>
				</tr>
			</table>
			<br><br>
			<div>
				<button type="submit" id="search">검색</button>
				<button type="button" id="reset">초기화</button>
			</div>
		</form>
		
		<br><hr><br>
		<table border="1" id="res_search_result">
			<tr>
				<th>예약번호
				<th>회원 ID
				<th>전시명
				<th>방문 일자
				<th>방문 시각
				<th>방문 인원
				<th>예약 취소
				<th>방문 완료
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.rid }
				<td>${vo.id }
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
				<c:choose>
					<c:when test="${vo.rvisited == 0 }">
						<td><button class="rvisited" value="완료">완료</button>
					</c:when>
					<c:otherwise>
						<td><button class="rvisited" value="완료 취소">완료 취소</button>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
	</section>
<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>