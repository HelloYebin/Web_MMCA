<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/comment/comment_list.css">

</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
<h2>관람후기</h2>
<h4>관람후기를 올려주세요</h4>
<hr>
<br>
<!-- 테이블 -->
<table border="1">
	<!--  테이블 1번째줄 -->
	<tr>
		<th>번호</th><th>제목</th><th>전시명</th><th>작성자</th><th>등록일</th><th>조회수</th>
	</tr>
	<!--  Dummy Content -->
	<c:forEach var="vo" items="${list}" >
	<tr>
		<td>${vo.cmNo}</td><td><a href="comment_content.do?cmId=${vo.cmId }">${vo.cmTitle }</a><td>${vo.cmDisp }</td><td> ${vo.cmUserId }</td><td>${vo.cmDate }</td><td>${vo.cmHits }</td>
	</tr>
	</c:forEach>
	
</table>

<!-- 검색 입력폼 -->
<div class="bottom">
<form method="get" action="comment_search.do">
<input name="rpage" value="1" type="hidden">
<select name="searchcategory">
	<option value="title">제목</option>
	<option value="content">본문</option>
	<option value="userid">작성자</option>
</select>
<input type="text" value="내용을 입력해주세요" name="searchtext" onclick="this.value=''"></input>
<button type="submit">검색</button>

<!-- 글 작성 화면 이동 -->
<button type="button" onclick="location.href='comment_write.do'" class="btn_normal">등록</button>
</form>
</div>
<div align="center">
<!-- 페이지 표시 부분 -->
&lt;&lt;&nbsp;&nbsp;&nbsp;
<script>
	var pageCount=${pageCount};
	var reqPage=${reqPage};
	var mode="${mode}";
	var searchtext="${searchtext}";
	var searchcategory="${searchcategory}";
	
	var i=0;
	for(i=1;i<=pageCount;i++){
		if(i==reqPage) document.write("<b>");
		document.write("<a href='comment_"+mode+".do?rpage="+i);
		if(searchtext != "") document.write("&searchcategory="+searchcategory+"&searchtext="+searchtext);
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
<!--  
<div class="pageBtn"><<&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;>></div>-->
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>