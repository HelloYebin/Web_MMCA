<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/qna/qna_write_update.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/boards/qnaUpdateForm.js"></script>

<style type="text/css">
.FileName{
		display: block;
		position: relative;
		width:40%;
		height: 20px;
		margin-top: -25px;
		margin-left: 80px;
		background: white;
		text-align: left;
	
	}
</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
	<h2>Q &amp; A</h2>
	<br><hr><br>
	<form name="qna_write" action="qna_update.do" method="post" enctype="multipart/form-data">
	 	<input type="hidden" name="qId" value="${vo.qId }" id="qTitle">
	<input type="hidden" name="qSfile" value="${vo.qSfile }">
	 	<table border="1">
	 	<tr>
		 	<th>제목</th>
		 	<td colspan="1"><input type="text" name="qTitle" value="${vo.qTitle }"></td>
		 	</tr>
		 	<tr>
		 		<td colspan="2"><textarea name="qContent" id="qContent">${vo.qContent }</textarea></td>
		 	</tr>
		 	<tr>
			 	<th>첨부파일</th>
			 	<td colspan="1"><input type="file" name="formFile" id="fileSelect">
			 	<div class="FileName">${vo.qFile } </div></td>
	 	</tr>
	 	</table>
	 	<br><br>
		 <!-- 버튼 -->
		 <div>
		 	<button type="button" id="btnSubmit">등록</button>
		 	<button type="button" onclick="location.href='qna_content.do?qId=${vo.qId}'">취소</button>
	 	</div>
	 </form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>