<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/member_list.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/member_list.js"></script>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
	<br><br>
	<section>
		<h3>상세 검색</h3>
		<br>
		<form name="member_list" action="member_search.do" method="get">
			<table border="1">
				<tr>
					<th>ID
					<td><input type="text" name="id">
					<th>성명
					<td><input type="text" name="name">
					<th>성별
					<td>
						<label><input type="radio" name="gender" class="radio" value="남성"> 남성 </label>
						<label><input type="radio" name="gender" class="radio" value="여성"> 여성 </label>
						<label><input type="radio" name="gender" class="radio" value="기타"> 기타 </label>
					</td>
				</tr>
				<tr>
					<th>E-mail
					<td><input type="text" name="email">
					<th>주소
					<td><input type="text" name="address">
					<th>전화번호
					<td>
						<input type="number" name="phone">
					</td>
				</tr>
				<tr>
					<th>가입일
					<td colspan="5"><input type="date" name="startdate"> ~ <input type="date" name="enddate">
				</tr>
			</table>
			<br><br>
			<div>
				<button type="submit">검색</button>
				<button type="button" id="reset">초기화</button>
			</div>
		</form>
	</section><br><br>
	
	<section>
		<table border="1" id="res_table">
			<tr>
				<th>ID</th>
				<th>성명</th>
				<th>성별</th>
				<th>E-mail</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="vo" items="${list}">
			<tr class="row">
				<td class="id">${vo.id }</td>
				<td>${vo.name }</td>
				<td>${vo.gender }</td>
				<td>${vo.email }</td>
				<td>${vo.address }</td>
				<td>${vo.phone }</td>
				<td>${vo.joindate }</td>
			</tr>
			</c:forEach>
		</table>
	</section>
<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>