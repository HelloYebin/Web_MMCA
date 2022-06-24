<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/faq/faq_write_update.css"></link> 
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/boards/faqUpdateForm.js"></script>
<script>
	$(document).ready(function(){
		
		
		var category='${vo.faCategory}';
		$("#categorySel").val(category);	

	
	});
</script>

</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
<form name="faq_write" action="faq_update.do" method="post" enctype="multipart/form-data">
		<input type="hidden" value="${vo.faId }" name="faId">
		<h2>FAQ</h2>
		<hr>
	 	<table>
	 		<tr>
	 		<td><span class="inputLabel">제목</span></td>
	 		<td><input type="text" name="faTitle"  class="titleTextBox" value="${vo.faTitle }" id="faTitle"></td>
	 		</tr>
	 	<tr>
	 	<td colspan="2"><hr></td>
	 	</tr>
	 	<tr>
	 	<td><span class="inputLabel" >유형</span></td>
	 	<td>
	 	<select style="width:80%" name="faCategory"  id="categorySel">
	 	<option value="관람">관람</option>
	 	<option value="예약">예약</option>
	 	<option value="홈페이지">홈페이지</option>
	 	<option value="기타">기타</option>
	 	</select></td>
	 	</tr>
	 	<tr>
	 	<td colspan="2"><hr></td>
	 	</tr>
	 	<tr>
	 	<td colspan="2" align="center"><textarea rows="20" cols="80" name="faContent" id="faContent">${vo.faContent }</textarea>
	 	</td>
	 	</tr>
	 	<tr>
	 	<td colspan="2"><hr></td>
	 	</tr>
	 	</table>
	 	<!-- 버튼 -->
	 	<button type="button" onclick="location.href='faq_list.do'" class="btn_normal">취소</button>
	 	<button type="button"  class="btn_normal" id="btnSubmit">등록</button>
	 </form>
</section>	 
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>