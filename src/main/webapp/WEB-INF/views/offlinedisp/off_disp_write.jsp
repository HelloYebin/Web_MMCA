<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>

<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/online/online_colmov_write.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/offdisp/offNowWriteForm.js"></script>
<script>
	
</script>
<style type="text/css">

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
	
	<h1>전시회 입력</h1>
	<hr>
	<form name="collectionInputForm" action="offDispWrite.do" method="post" class="content_layout" enctype="multipart/form-data">	
	<table id="inputTable" border="1">
	<tr>
		<th>제목</th><td colspan="3"><input type="text" name="exTitle" class="longInput" id="exTitle"></input></td>
	</tr>
	<tr>
		<th>이미지</th><td colspan="3"><input type="file" name="formFiles" multiple="multiple" class="longInput" id="formFiles"></td>
	</tr>
	<tr>
		<th>전시시작일</th><td><input type="date" name="exTermStart" class="shortInput" id="exTermStart"></td>
		<th>전시완료일</th><td><input type="date" name="exTermEnd" class="shortInput" id="exTermEnd"></td>
	</tr>
	<tr>
		<th>전시장소</th><td><input type="text" name="exPlace" class="shortInput" id="exPlace"></td>
		<th>주최/후원</th><td><input type="text" name="exHost" class="shortInput" id="exHost"></td>
	</tr>
	<tr>
		<th>관람료</th><td><input type="number" name="exPrice" class="shortInput" id="exPrice"></td>	
		<th>작품수</th><td><input type="number"  name="exPiece" class="shortInput" id="exPiece"></td>
	</tr>
	<tr>
		<th>작가</th><td colspan="3"><input type="text" name="exAuthor" class="doubleInput" id=exAuthor></td>
	</tr>
	<tr>
		<th>부문</th><td><select name="exCategory" class="longInput" id="categorySel">
		<option value="전시">전시</option>
		<option value="필름앤비디오">필름앤비디오</option>
		<option value="다원예술">다원예술</option>
		<option value="해외전시">해외전시</option>
		</select></td>
		
	</tr>
	<tr>
		<th>내용입력</th><td colspan="3"><textarea rows="20" cols="80" name="exContent" id="exContent"></textarea></td>
	</tr>	
	</table>
	<hr>
	<button type="button" onclick="location.href='off_now.do?rpage=1'" class="btnList">취소</button>
	<button type="button" class="btnList" id="btnSubmit">등록</button>
	</form>		 
</section>	

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>