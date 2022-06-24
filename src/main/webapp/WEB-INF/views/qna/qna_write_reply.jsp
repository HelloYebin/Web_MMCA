<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/qna/qna_write_update.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/boards/qnaWriteForm.js"></script>
<script type="text/javascript"></script>
</head>

<jsp:include page="../header.jsp"></jsp:include>

<body>
	<section>
	<h2>Q &amp; A</h2>
	<br><hr><br>
	<form name="qna_write" action="qna_writeReply.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="qUserId" value="${id}"></input>
		<input type="hidden" name="qId" value="${qId}"></input>
	 	<table border="1">
		 	<tr>
			 	<th>제목</th>
			 	<td colspan="1"><input type="text" name="qTitle" value="${qtitle }" id="qTitle"></td>
		 	</tr>
		 	<tr>
		 		<td colspan="2"><textarea name="qContent" id="qContent"></textarea></td>
		 	</tr>
		 	<tr>
			 	<th>첨부파일</th>
			 	<td colspan="1"><input type="file" name="formFile"></td>
		 	</tr>
	 	</table>
	 	<br><br>
	 	<!-- 버튼 -->
	 	<div>
		 	<button type="button" id="btnSubmit">등록</button>
		 	<button type="button" onclick="location.href='qna_content.do?qId=${qId}'">취소</button>
	 	</div>
	 </form>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>