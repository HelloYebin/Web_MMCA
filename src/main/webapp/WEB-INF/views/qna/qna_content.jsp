<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/qna/qna_content.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
	
	
	$("#deleteBtn").click(function () {
		var del_confirm=confirm("삭제하시겠습니까");
		if (del_confirm==true){
			var id='${vo.qId}';
			location.href="qna_delete.do?qId="+id;
		}
	});
});
</script>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
	<h2>Q &amp; A</h2>
	<br><hr><br>
	<table border="1">
		<tr>
			<th>제목</th>
			
			<td><span><c:if test="${ vo.qGroup!=0}">[RE]: </c:if>
			${vo.qTitle }</span></td>
			<th>조회수</th>
		</tr>
		<tr>
			<td colspan="2"><small>작성자 : ${vo.qUserId }  &nbsp; | &nbsp; 등록일 : ${vo.qDate }</small></td>
			<td id="hits"><small>${vo.qHits }</small></td>
		</tr>
		<tr>
			<td colspan="3">
				<p>${vo.qContent }</p>
			</td>
	 	</tr>
	 	<c:choose>
		<c:when test="${vo.prevId!='0' }">
		<tr onclick="location.href='qna_content.do?qId=${vo.prevId}'" class="bottomTr">
			<td class="bottomBox">이전글</td><td style="cursor:pointer;" colspan="2"><b>${vo.prevTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('첫 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">이전글</td><td style="cursor:pointer;" colspan="2"><b>이전글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose>
		<!-- <tr><td colspan="3"><hr></td></tr> -->
		<c:choose>
		<c:when test="${vo.nextId!='0' }">
		<tr onclick="location.href='qna_content.do?qId=${vo.nextId}'" class="bottomTr">
			<td class="bottomBox">다음글</td><td style="cursor:pointer;" colspan="2"><b>${vo.nextTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('마지막 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">다음글</td><td style="cursor:pointer;" colspan="2"><b>다음글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose><!-- 
	 	<tr onclick="location.href='qna_content.do'" style="cursor:pointer;">
	 	 	<th>이전글</th>
	 	 	<td colspan="2">제목2</td>
	 	</tr>
		 <tr onclick="location.href='qna_content.do'" style="cursor:pointer;">
		 	<th>다음글</th>
		 	<td colspan="2">제목3</td>
		</tr> -->
	 </table>
	 <br><br>
	 <div>
	 	<c:if test="${id==vo.qUserId || id=='admin' }">
		 <button type="button" onclick="location.href='qna_update.do?qId=${vo.qId}'">수정</button>
		 <button type="button" id="deleteBtn">삭제</button>
		</c:if>
		 <button type="button" onclick="location.href='qna_writeReply.do?qId=${vo.qId}'">답글</button>
		 <button type="button" onclick="location.href='qna_list.do?rpage=1'">목록</button>
	 </div>
</section>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>