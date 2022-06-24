<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/reservation.css"></link>
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/reservation.js"></script>
<script type="text/javascript">
	var res_result = "${res_result}";
	if(res_result=="succ") {
		alert("예약 완료");
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<br><br>
	<section>
		<div id="list">
			<c:forEach var="vo" items="${list}">
			<div class="show_info">
				<img src="${vo.rimg }" class="show_poster">
				<p class="show_title">${vo.rtitle }</p><br>
				<p class="show_desc">${vo.rdesc }</p>
				<c:if test="${vo.rstate==1 }">
					<span class="open_close">예약중</span>		
				</c:if>
			</div>
			</c:forEach>
		</div>
		
		<div id="reserve_menu">
			<form action="reservation.do" method="post">
				<input type="text" name="rtitle" hidden="hidden">
				<input type="text" name="id" hidden="hidden" value="${sessionScope.id }">
				<h3 id="reserve_h3">예약</h3>
				<div class="reserve_menu_item1">방문 일자 &nbsp;&nbsp;&nbsp;<input type="date" name="rdate"></div>
				<div class="reserve_menu_item1" id="reserve_time">방문 시각</div>
				<section id='reserve_time_box'>
					<label><input type='radio' name='rtime' value='10:00 ~ 12:00'>10:00 ~ 12:00</label><br>
					<label><input type='radio' name='rtime' value='13:00 ~ 18:00'>13:00 ~ 18:00</label>
				</section>
				<div class="reserve_menu_item1" id="rn">
					방문 인원 &nbsp;&nbsp;&nbsp;<input type="number" name="rnum">
				</div>
				<div id="confirm">
					<input type="submit" id="reserve_confirm" value="예약 확정">
				</div>
			</form>
		</div>
	</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>