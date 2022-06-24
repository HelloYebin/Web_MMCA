<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/notice/notice_list.css">
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
<h2 align="left">공지사항</h2>
<hr>
<br>
<!-- 테이블 -->
<table border="1">
	<!--  테이블 1번째줄 -->
	<tr>
		<th class="ntype" >유형</th><th class="ntitle" align="center">제목</th><th class="ndate">등록일</th>
	</tr>
	<!--  Dummy Content -->
	<c:forEach var="vo" items="${list}">
	<tr>
		<td class="ntype">${vo.nCategory }</td><td class="ntitle"><a href="notice_content.do?nId=${vo.nId}">${vo.nTitle }</a></td><td class="ndate">${vo.nDate }</td>
	</tr>
	</c:forEach>
	
</table>
<br>


<div class="bottom">
	<form method="get" action="notice_search.do">
	<div class="searchBar">
		<input name="rpage" value="1" type="hidden">
		<select name="searchcategory">
		<option value="title">제목</option>
		<option value="content">본문</option>
		<option value="category">유형</option>
	</select>
	<input type="text" placeholder="내용을 입력해주세요" name="searchtext"  ></input>
	<button type="submit" class="btn_search">검색</button>
	<c:if test="${id=='admin' }">
	<button type="button" onclick="location.href='notice_write.do'" class="btn_normal">등록</button>
	</c:if>
	</div>
	
	</form>
</div>
<div align="center">
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
		document.write("<a href='notice_"+mode+".do?rpage="+i);
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