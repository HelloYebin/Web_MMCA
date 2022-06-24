<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/notice/notice_content.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
	
	
	$("#deleteBtn").click(function () {
		var del_confirm=confirm("삭제하시겠습니까");
		if (del_confirm==true){
			var id='${vo.nId}';
			location.href="notice_delete.do?nId="+id;
		}
	});
});
</script>
<style type="text/css">
* {
		margin: 0; padding: 0;
	}
	
	body{
		width:100%;
		height: 100%;
	}
	h2{
		display: block;
		font-size: 40px;
		text-indent: 20px;
		margin: 20px;
	}
	
	h3{
		display: block;
		font-size: 25px;
		text-indent: 20px;
		margin: 10px;
	}
	
	section {
		width: 900px;
		margin: 0 auto;
		padding: 50px 100px;
		box-sizing: border-box;
	}
	.titleSub{
		text-align: right;
		padding-top: 20px;
	}
	
	.contentBox{
		min-height: 300px;
		padding: 10px;
	}
	
	.pageMove{
		cursor:pointer;
		height: 50px;
	}
	
	button{
		background-color: #111;
		color:#eee;
	}
	
	.btn_normal{
		float:right;
		margin:10px;
		width:100px;
		height:40px;
		font-size: 20px;
	}
	
	table{
		width:100%;
		margin:0 auto;
	}
	
	.bottomBox{
	padding-left: 50px;
	width:100px;
	height:40px;	
}
</style>
<body>
<header>
<jsp:include page="../header.jsp"></jsp:include>
</header>
<section>

	<h2>공지사항</h2>
	<hr>
	<table>

	<tr>
		<td colspan="2"><h3>${vo.nTitle }</h3>	
	 	<small>담당 : ${vo.nWriter } | 등록일자 : ${vo.nDate }</small> </td>
	 	<td colspan="1" class="titleSub"><small>조회수:${vo.nHits }</small></td>
	 </tr>
	<tr><td colspan="3"><hr></td></tr>
	<tr>
			<td colspan="3"><p class="contentBox">${vo.nContent }</p></td>
	 </tr>
	 <tr><td colspan="4"><hr></td></tr>
	 <c:choose>
		<c:when test="${vo.prevId!='0' }">
		<tr onclick="location.href='notice_content.do?nId=${vo.prevId}'" class="bottomTr">
			<td class="bottomBox">이전글</td><td style="cursor:pointer;" colspan="2"><b>${vo.prevTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('첫 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">이전글</td><td style="cursor:pointer;" colspan="2"><b>이전글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose>
	 <!--  
	 <tr><td colspan="2"><hr></td></tr>
	 <tr onclick="location.href='notice_content.do'"  class="pageMove">
	 	 		<td  style="width:200px">이전글</td>
	 	 		<td colspan="3"><b>제목2</b></td>
	 </tr>-->
	 <tr><td colspan="4"><hr></td></tr>
	 <c:choose>
		<c:when test="${vo.nextId!='0' }">
		<tr onclick="location.href='notice_content.do?nId=${vo.nextId}'" class="bottomTr">
			<td class="bottomBox">다음글</td><td style="cursor:pointer;" colspan="2"><b>${vo.nextTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('마지막 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">다음글</td><td style="cursor:pointer;" colspan="2"><b>다음글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose>
	 <!--
	 <tr onclick="location.href='notice_content.do'"  class="pageMove">
	 	 		<td>다음글</td>
	 	 		<td colspan="3"><b>제목3</b></td>
	</tr>-->
	<tr><td colspan="4"><hr></td></tr>
	 </table>	 		
	
	 <div>
	 <c:if test="${id=='admin' }">
	 <button type="button" onclick="location.href='notice_update.do?nId=${vo.nId}'" class="btn_normal" style="float:left;">수정</button>
	 <button type="button" id="deleteBtn" class="btn_normal" style="float:left;">삭제</button>
	 </c:if> 
	 <button type="button" onclick="location.href='notice_list.do?rpage=1'" class="btn_normal">목록</button>
	 </div>
	
</section>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>