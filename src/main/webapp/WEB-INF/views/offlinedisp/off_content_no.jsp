<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css"href="resources/css/offline/offcontent.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
	
	
	$("#deleteBtn").click(function () {
		var del_confirm=confirm("삭제하시겠습니까");
		if (del_confirm==true){
			var id='${vo.exId}';
			location.href="offDispDelete.do?exId="+id;
		}
	});
	
});
</script>
<style type="text/css">
.managebtn{ 
	float: left;
	width: 100px;
	height: 46px;
	background-color: #000;
	color: #fff;
	border-radius: 23px;
	margin: 40px 0;
	font-size: 1em;
	font-weight: bolder;
	margin-right: 50px;
}


</style>
</head>
<body>
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<section>
		<!-- 본문 -->
		<div class="clearfix" id="title">
			<!-- 제목부분 -->
			<div id="title_left">
				<!-- 왼쪽 --> 
				<p id="titletext">${vo.exTitle }<br>
					<span>${vo.exTermStart }~${vo.exTermEnd }|${vo.exPlace }</span>
				</p>
			</div>
			<div id="title_right">
				<!-- 오른쪽 -->
				<button id="reservebtn" onclick="location.href='/mygit/reservation.do'" style="cursor:pointer">예약하기</button>
				<br> <span>조회수 ${vo.exHits }회 | 스크랩 <a><img
						alt="bookmark" src="resources/images/offline/icon_bookmark.png" width="18px" height="18px"></a> |  <a><img
						alt="share" src="resources/images/offline/icon_share02.png" width="18px" height="18px"></a></span>
			</div>
		</div>
		<hr>
		<article>
			${vo.exContent }
		</article>
		<hr>
		<div id="infodiv" class="clearfix">
			<!-- 정보란 -->
			<div id="info_left">
				<div class="infoclass">
					<p class="infotag">기간</p>
					<p>${vo.exTermStart }~${vo.exTermEnd }</p>
				</div>
				<div class="infoclass">
					<p class="infotag">주최/후원</p>
					<p>${vo.exHost }</p>
				</div>
				<div class="infoclass">
					<p class="infotag">장소</p>
					<p>${vo.exPlace }</p>
				</div>
				<div class="infoclass">
					<p class="infotag">관람료</p>
					<p>${vo.exPrice }원</p>
				</div>
			</div>
			<div id="info_right">
				<div class="infoclass">
					<p class="infotag">작가</p>
					<p>${vo.exAuthor }</p>
				</div>
				<div class="infoclass">
					<p class="infotag">작품수</p>
					<p>${vo.exPiece }점</p>
				</div>
			</div>
		</div>
		<hr>
		<div id="imgdiv" class="clearfix">
			<!-- 전시 이미지 -->
			<p id="imgtext">전시이미지</p>
			<c:if test="${vo.sFileArr[0]!=null}">
			<img class="exhibitimg" alt="img1"
				src="http://localhost:9000/mygit/resources/upload/${vo.sFileArr[0] }"> </c:if>
				<c:if test="${vo.sFileArr[1]!=null}">
				<img class="exhibitimg" alt="img2"
				src="http://localhost:9000/mygit/resources/upload/${vo.sFileArr[1] }"></c:if> 
				<c:if test="${vo.sFileArr[2]!=null}">
				<img class="exhibitimg" alt="img3"
				src="http://localhost:9000/mygit/resources/upload/${vo.sFileArr[2] }"></c:if> 
				<c:if test="${vo.sFileArr[3]!=null}"> <img id="lastimg" alt="img4"
				src="http://localhost:9000/mygit/resources/upload/${vo.sFileArr[3] }"></c:if>
		</div>
		<div>
			<!-- 글목록 -->
			<table id="litable">
				<c:choose>
				<c:when test="${vo.prevId!='0' }">
				<tr style="cursor:pointer">
					<td class="t1">이전글</td>
					<td class="t2" onclick="location.href='off_content_no.do?exId=${vo.prevId}'">
					${vo.prevTitle }</td>
				</tr>
				</c:when>
				<c:otherwise>
					<tr>
					<td class="t1">이전글</td>
					<td class="t2">이전글이 없습니다.</td>
				</tr>
				</c:otherwise>
				</c:choose>
				<c:choose>
				<c:when test="${vo.nextId!='0' }">
				<tr  style="cursor:pointer">
					<td class="t1">다음글</td>
					<td class="t2" onclick="location.href='off_content_no.do?exId=${vo.nextId}'">
					${vo.nextTitle }</td>
				</tr>
				</c:when>
				<c:otherwise>
					<tr>
					<td class="t1">다음글</td>
					<td class="t2" onclick="">다음글이 없습니다.</td>
				</tr>
				</c:otherwise>
				</c:choose>
			</table>
			<div id="list">
				<!-- 목록버튼 -->
				<button id="listbtn" onclick="location.href='http://localhost:9000/mygit/off_now.do?rpage=1'">목록</button>
				<c:if test="${id=='admin'}" >
				<button type="button" class="managebtn" id="deleteBtn">삭제</button>
				<button type="button" onclick="location.href='offDispUpdate.do?exId=${vo.exId}'" class="managebtn">수정</button>
				</c:if>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>