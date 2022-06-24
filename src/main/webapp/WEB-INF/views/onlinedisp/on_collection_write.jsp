<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/online/online_colmov_write.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/onlinedisp/collectionWriteForm.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	<h1>소장품 입력</h1>
	<hr>
	<form name="collectionInputForm" action="collectionWrite.do" method="post" class="content_layout" enctype="multipart/form-data">	
	<table id="inputTable" border="1">
	<tr>
		<th>제목</th><td colspan="3"><input type="text" name="coTitle" class="longInput" id="coTitle"></input></td>
	</tr>
	<tr>
		<th>이미지</th><td colspan="3"><input type="file" name="formFile" class="longInput" id="formFile"></td>
	</tr>
	<tr>
		<th>작가명(한글)</th><td><input type="text" name="coAuthorKor" class="shortInput" id="coAuthorKor"></td>
		<th>작가명(영어)</th><td><input type="text" name="coAuthorEng" class="shortInput" id="coAuthorEng"></td>
	</tr>
	<tr>
		<th>작품명</th><td><input type="text" name="coName" class="shortInput" id="coName"></td>
	
		<th>제작연도</th><td><input type="text" name="coYear" class="shortInput" id="coYear"></td>
	</tr>
	<tr>
		<th>재료</th><td><input type="text" name="coMaterial" class="shortInput" id="coMaterial"></td>
	
		<th>규격</th><td><input type="text" name="coDim" class="shortInput" id="coDim"></td>
	</tr>
	<tr>
		<th>부문</th><td><select name="formCategory" class="shortInput" id="categorySel">
		<option value="ko">한국화</option>
		<option value="pa">회화</option>
		<option value="sc">조각</option>
		<option value="cr">공예</option>
		<option value="nm">뉴미디어</option>
		<option value="ar">건축</option>
		<option value="de">디자인</option>
		<option value="dp">드로잉/판화</option>
		<option value="ph">사진</option>
		<option value="ca">서예</option>
		</select></td>
		<th>전시여부</th><td>
				<input type="radio" name="coIsDisp" value="전시중" checked="checked">전시중
				<input type="radio" name="coIsDisp" value="비전시">비전시</td>
	</tr>
	<tr>
		<th>내용입력</th><td colspan="3"><textarea rows="20" cols="80" name="coContent" id="coContent"></textarea></td>
	</tr>	
	</table>
	<hr>
	<button type="button" onclick="location.href='collectionList.do'" class="btnList">취소</button>
	<button type="button" class="btnList" id="btnSubmit">등록</button>
	</form>		 
</section>	

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>