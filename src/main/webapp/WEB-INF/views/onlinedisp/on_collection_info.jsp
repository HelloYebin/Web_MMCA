<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<script type="text/javascript"></script>
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
	
	
	$("#deleteBtn").click(function () {
		var del_confirm=confirm("삭제하시겠습니까");
		if (del_confirm==true){
			var id='${vo.coId}';
			location.href="collectionDelete.do?coId="+id;
		}
	});
});
</script>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/online/online_colmov_info.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
<h1>${vo.coTitle }</h1>
<hr>
<div class="imgContentBox"><img src="http://localhost:9000/mygit/resources/upload/${vo.coSfile }" height="400px" id="dispImg"></div>
<hr>
<div class="contentDescTable">
<table>
	<tr>
		<th>작가명</th><td>${vo.coAuthorKor } ${vo.coAuthorEng }</td>
	</tr>
	<tr>
		<th>작품명</th><td>${vo.coName }</td>
	</tr>
	<tr>
		<th>제작연도</th><td>${vo.coYear }</td>
	</tr>
	<tr>
		<th>재료</th><td>${vo.coMaterial }</td>
	</tr>
	<tr>
		<th>규격</th><td>${vo.coDim }</td>
	</tr>
	<tr>
		<th>부문</th><td>${vo.coCategory }</td>
	</tr>
	<tr>
		<th>관리번호</th><td>${vo.coManageId }</td>
	</tr>
	<tr>
		<th>전시상태</th><td><div class="dispIcon">${vo.coIsDisp }</div></td>
	</tr>
	
	<tr><td colspan="2"><hr></td></tr>
	
	<tr><td colspan="2"><p>${vo.coContent }</p></td></tr>
	
	<tr><td colspan="2"><hr></td></tr>
		<c:choose>
		<c:when test="${vo.prevId!='0' }">
		<tr onclick="location.href='collectionInfo.do?coId=${vo.prevId}'" class="bottomTr">
			<td class="bottomBox">이전글</td><td><b>${vo.prevTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('첫 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">이전글</td><td><b>이전글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose>
		<tr><td colspan="2"><hr></td></tr>
		<c:choose>
		<c:when test="${vo.nextId!='0' }">
		<tr onclick="location.href='collectionInfo.do?coId=${vo.nextId}'" class="bottomTr">
			<td class="bottomBox">다음글</td><td><b>${vo.nextTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('마지막 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">다음글</td><td><b>다음글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose>
		<tr><td colspan="2"><hr></td></tr>
</table>
</div>
	<button type="button" onclick="location.href='collectionList.do?rpage=1'" class="btnList">목록</button>
	<c:if test="${id =='admin'}">
	<button type="button" class="btnList" id="deleteBtn">삭제</button>
	<button type="button" onclick="location.href='collectionUpdate.do?coId=${vo.coId}'" class="btnList">수정</button>	
	</c:if> 
</section>	

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>