<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
</script>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/admin.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<h1>관리자 페이지</h1>
<hr>
<table>
	<tr>
		<td><img src="http://localhost:9000/mygit/resources/images/admin/admin1.PNG" style="width:100px;height:100px"></td>
		<td><button type="button" onclick="location.href='admin/member_list.do'">회원관리</button>
	</tr>
	<tr>
		<td><img src="http://localhost:9000/mygit/resources/images/admin/admin2.PNG" style="width:100px;height:100px"></td>
		<td><button type="button" onclick="location.href='admin/reservation_list.do'">예약관리</button>
	</tr>
	<tr>
		<td><img src="http://localhost:9000/mygit/resources/images/admin/admin3.PNG" style="width:100px;height:100px"></td>
		<td><button type="button" onclick="location.href='admin/onlist.do'">전시관리</button>
	</tr>
</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>