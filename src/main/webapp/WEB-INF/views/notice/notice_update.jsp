<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<script type="text/javascript"></script>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/notice/notice_write_update.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/boards/noticeUpdateForm.js"></script>
<script>
	$(document).ready(function(){
		
		var category='${vo.nCategory}';
		$("#categorySel").val(category);
		
		
	});
</script>
<style type="text/css">
.FileName{
		display: block;
		position: relative;
		width:50%;
		height: 20px;
		margin-top: -22px;
		margin-left: 75px;
		background: white;
	}
</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
<form name="notice_write_form" action="notice_update.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="nId" value="${vo.nId }">
	<input type="hidden" name="nSfile" value="${vo.nSfile }">
		<h2>공지사항</h2>
		<hr>
	 	<table>
	 	<tr>
	 		<td><span class="inputLabel">제목</span></td>
	 		<td colspan="4"><input type="text" name="nTitle" class="titleTextBox" value="${vo.nTitle }" id="nTitle"></td>
	 		</tr>
	 		
	 	<tr>
	 	<td colspan="5"><hr></td>
	 	</tr>
	 	
	 	<tr>
	 	<td><span class="inputLabel">첨부파일</span></td>
	 	<td colspan="2"><input type="file" name="formFile" id="fileSelect">
	 	<div class="FileName">${vo.nFile } </div></td>
	 	
	 	<td><span class="inputLabel">유형</span></td>
	 	<td>
	 	<select name="nCategory" id="categorySel">
	 	<option value="공통">공통</option>
	 	<option value="서울">서울</option>
	 	<option value="미술은행">미술은행</option>
	 	<option value="어린이박물관">어린이박물관</option>
	 	</select></td>
	 	</tr>
	 	
	 	<tr>
	 	<td colspan="5"><hr></td>
	 	</tr>
	 	
	 	<tr>
	 	<td colspan="5" align="center"><textarea rows="20" cols="80" name="nContent" id="nContent">${vo.nContent }</textarea>
	 	</td>
	 	</tr>
	 	</table>
	 	<!-- 버튼 -->
	 	<button type="button" onclick="location.href='notice_list.do?nId=${vo.nId}'" class="btn_normal">취소</button>
	 	<button type="button" class="btn_normal" id="btnSubmit">등록</button>
	 </form>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>