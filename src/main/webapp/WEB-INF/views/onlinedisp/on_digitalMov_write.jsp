<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/online/online_colmov_write.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/onlinedisp/digitalMovWriteForm.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>디지털컨텐츠 입력</h1>
	<hr>
	<form name="digitalMvInputForm" action="digitalMovWrite.do" method="post" class="content_layout" enctype="multipart/form-data" id="digitalMvForm">	
	<table id="inputTable" border="1">
	<tr>
		<th>제목</th><td colspan="3"><input type="text" name="dmTitle" class="longInput" id="dmTitle"></input></td>
	</tr>
	<tr>
		<th>이미지</th><td colspan="3"><input type="file" name="formFile" class="longInput" id="formFile"></td>
	</tr>
	<tr>
		<th>동영상링크</th><td colspan="3"><input type="text" name="dmUrl" class="longInput" id="dmUrl"></input></td>
	</tr>
	<tr>
		<th>프로그램</th><td><select name="formProgram">
		<option value="p1">관장이 들려주는 소장품 이야기</option>
		<option value="p2">큐레이터 전시 해설</option>
		<option value="p3">강의&amp;학술토론</option>
		<option value="p4">작품&amp;작가</option>
		<option value="p5">미술관 소식</option>
		<option value="p6">오늘, 이 작품</option></select></td>
		<th>영상구분</th><td><select name="formCategory">
		<option value="c1">전시연계</option>
		<option value="c2">전시감상</option>
		<option value="c3">진로탐색</option>
		<option value="c4">보존과학</option>
		<option value="c5">작가인터뷰</option>
		<option value="c6">전시소개</option></select></td>
	</tr>
	<tr>
		<th>내용입력</th><td colspan="3"><textarea rows="20" cols="80" name="dmContent" id="dmContent"></textarea></td>
	</tr>	
	</table>
	<hr>
	<button type="button" onclick="location.href='digitalMovList.do?rpage=1'" class="btnList">취소</button>
	<button type="button"  class="btnList" id="btnSubmit">등록</button>
	</form>		 
</section>		

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>