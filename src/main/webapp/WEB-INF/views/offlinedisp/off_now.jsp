<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {

	$(".category").css("background","white");
	$(".category").css("color","black");
	$(".category").css("border","black 1px solid");
	
	var category="${category}";
	
	if(category=="") {
		category="전체";
	}

		$(".category:contains('"+category+"')").css("background","black");
		$(".category:contains('"+category+"')").css("color","white");
		$(".category:contains('"+category+"')").css("border","white 1px solid");
	
		if(category=="전시"){

			$(".category:contains('해외전시')").css("background","white");
			$(".category:contains('해외전시')").css("color","black");
			$(".category:contains('해외전시')").css("border","black 1px solid");
		}
	
	$(".category").click(function(){
			if($(this).text()=='등록'){
				$(location).attr("href","offDispWrite.do");
			}else if($(this).text()=='전체'){
				$(location).attr("href","off_now.do?rpage=1");	
			}else{
				$(location).attr("href","off_now.do?rpage=1&category="+$(this).text());
			}	
			
	});
});
</script>
<link rel="stylesheet" type="text/css" href="resources/css/offline/offline.css">
<style type="text/css">
	table{
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 20px;
	overflow: hidden;
	min-width: 100%;
	text-align: center;
}

a{
		text-decoration: none;
		color: #111;
	}
	
	a:hover{
		color: #888;
	}

.category{
	cursor:pointer;
}	
</style>
</head>
<body>
   <!-- header -->
   <jsp:include page="../header.jsp"></jsp:include>
	<hr>
	<section>
			<div id="search">
			<h1 id="p_name">현재전시</h1>
			<form id="searchForm" method="get" action="offDispSearch.do">
				<input type="hidden" value="1" name="rpage">
				<input type="text" placeholder="콜렉션명을 검색해주십시오." id="searchbar" name="searchtext">
				<button type="submit" id="searchbutton">검색</button>
				<c:if test="${id=='admin' }">
				<button type="button" class="category" onclick="location.href='/mygit/offDispWrite.do'" style="cursor:pointer" >등록</button>
				</c:if>
			</form>
			</div>
			<hr>
			<div id="categorybtn"><!-- 카테고리 버튼 -->
			<button type="button" class="category" onclick=>전체</button>
			<button type="button" class="category">전시</button>
			<button type="button" class="category">필름앤비디오</button>
			<button type="button" class="category">다원예술</button>
			<button type="button" class="category">해외전시</button><br> 
			</div>
			<table><!-- 컨텐츠목록 -->
			<tr class="td1">
				<c:forEach var="vo" items="${list}"> 
				<td style="cursor: pointer;" onclick="location.href='http://localhost:9000/mygit/off_content_no.do?exId=${vo.exId}'">
					<div class="container">
					  <img src="http://localhost:9000/mygit/resources/upload/${vo.sFileArr[0] }" alt="image1" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">${vo.exTitle }</p>
						<p>${vo.exTermStart }~${vo.exTermEnd }</p>
					</div>
					<script>
						var count=document.getElementsByTagName("td").length;
						
						if(count ==4){
							document.write("</tr><tr>");
						}
					</script>
				</td>	
				</c:forEach>
				<script>
				var count=document.getElementsByTagName("td").length;
				while(count <8){
					document.write("<td class='emptyContainer'></td>");
					count++;
					
					if(count ==4){
						document.write("</tr><tr>");
					}
				}
				</script>	
			
			</tr>
		</table>
		<div class="pageNum" align="center"> <!-- 페이지 번호 -->
			<script>
				var pageCount=${pageCount};
				var reqPage=${reqPage};
				var mode='${mode}';
				var category='${category}';
				var searchtext='${searchtext}';
				var i=1;
				
				for(i=1;i<=pageCount;i++){
					if(i==reqPage) document.write("<b>");
					if(mode=='list'){
					document.write("<a href='http://localhost:9000/mygit/off_now.do?rpage="+i+"&category="+category);
					}
					else{
						document.write("<a href='http://localhost:9000/mygit/offDispSearch.do?rpage="+i+"&searchtext="+searchtext);
					}//if(searchtext!="") document.write("&searchtext="+searchtext);	
					document.write("'>");
					document.write(i+"</a>");
					if(i==reqPage) document.write("</b>");
					document.write("&nbsp;&nbsp;&nbsp;");
				}

			</script>	
		</div>
		<div><!-- 맨 위로 버튼 -->
			<img alt="" src="">
		</div>
		
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>