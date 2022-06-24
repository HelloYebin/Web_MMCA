<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/qna/qna_list.css">
<style type="text/css">
.titleCell{
	text-align: left;
	text-indent: 10px;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
<h2>Q &amp; A</h2>
<br><hr><br>
<!-- 글 작성 화면 이동 -->
	<button type="button" onclick="location.href='qna_write.do'" id="list_write">등록</button>
	<br><br>
	<!-- 테이블 -->
	<table border="1">
		<!--  테이블 1번째줄 -->
		<tr>
			<th>No.</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
		</tr>
		<!--  Dummy Content -->
		<c:forEach var="vo" items="${list}">
		<tr>
			<td><c:if test="${vo.qGroup==0 }">${vo.qOrigin }</c:if></td>
			<td class="titleCell"><c:if test="${vo.qGroup!=0 }"><script>
				var depth=${vo.qDepth}; var i=0;
				for(i=0;i<depth;i++)document.write("&nbsp;&nbsp;");
				document.write("RE:");
			</script></c:if>
			<a href="qna_content.do?qId=${vo.qId }">${vo.qTitle }</a></td>
			<td><c:choose><c:when test="${vo.qUserId !=null}">${vo.qUserId }</c:when>
			<c:otherwise>비회원</c:otherwise>
			</c:choose>
			
			</td><td>${vo.qDate }</td><td>${vo.qHits }</td>
		</tr>		
		</c:forEach>
		
	</table>
	<br>
<!-- 페이지 표시 부분 -->
<div> &lt;&lt;&nbsp;&nbsp;&nbsp;
<script>
	var pageCount=${pageCount};
	var reqPage=${reqPage};
	var mode="${mode}";
	var searchtext="${searchtext}";
	var searchcategory="${searchcategory}";

	var i=0;
	for(i=1;i<=pageCount;i++){
		if(i==reqPage) document.write("<b>");   
		document.write("<a href='qna_"+mode+".do?rpage="+i);
		if(searchtext != ""){
			document.write("&searchcategory="+searchcategory+"&searchtext="+searchtext);
		}
		document.write("'>");
		document.write(i+"</a>");
		if(i==reqPage) document.write("</b>");
		document.write("&nbsp;&nbsp;&nbsp;");
	}
</script>
<!-- 
1&nbsp;&nbsp;&nbsp;
2&nbsp;&nbsp;&nbsp;
3&nbsp;&nbsp;&nbsp;
4 -->
&gt;&gt;</div>
<br>
<!-- 검색 입력폼 -->
<form method="get" action="qna_search.do">
	<input name="rpage" value="1" type="hidden">
	<select name="searchcategory">
		<option value="title">제목</option>
		<option value="content">본문</option>
		<option value="userid">작성자</option>
	</select>
	<input type="text" placeholder="내용을 입력해주세요" name="searchtext" ></input>
	<button type="submit">검색</button>
</form>
</section>

<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>

</body>
</html>