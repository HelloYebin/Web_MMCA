<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/online/online_colmov_list.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {

	var cateTxt="";
	
	$(".colCatSelBtn").click(function(){
		if($(this).css("color")==="rgb(0, 0, 0)"){
			$(this).css("background","black");
			$(this).css("color","white");
			$(".colCatSelBtn").not(this).css("background","white");
			$(".colCatSelBtn").not(this).css("color","black");
			
			cateTxt=$(this).text();
			//cateCount=1;
			}
		else{
			$(this).css("background","white");
			$(this).css("color","black");
			
			cateTxt="";
			
			//cateCount=0;
		}			
	});
});
</script>
<style>
.colCatSelBtn{
	display: inline-block;
	background: white;
	font-size: 13px;
	font-weight:bolder;
	height: 30px;
	padding-top:9px;
	border: 1px solid black;
	border-radius: 20px;
	margin: 5px;
	float:left;
	width: 80px;
	cursor:pointer;
	text-align: center;
}

.cateBtnZone{
	clear:both;
	
}
</style> 

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<section>
		<h1>소장품</h1>
		<div id="digitalForm" >
		<form method="get" action="collectionSearch.do" id="keywordMode">
			<input type="hidden" value="1" name="rpage">
			<input type="text" placeholder="검색어를 입력해주세요" id=searchBar name="searchtext">
			<button type="submit" onclick="" class="btnCollectionSearch">검색</button>			
		</form>
		<form method="get" action=collectionCategorySearch.do>
		<div id="cateBtnZone">
		<div class="colCatSelBtn">한국화</div>
		<div class="colCatSelBtn">회화</div>
		<div class="colCatSelBtn">조각</div>
		<div class="colCatSelBtn">공예</div>
		<div class="colCatSelBtn">뉴미디어</div>
		<div class="colCatSelBtn">건축</div>
		<div class="colCatSelBtn">디자인</div>
		<div class="colCatSelBtn">드로잉/판화</div>
		<div class="colCatSelBtn">사진</div>
		<div class="colCatSelBtn">서예</div>
		</div>
		</form>
		</div>
		<c:if test="${id =='admin'}">
		<div id="btnArea">
		<button class="btnList" onclick="location.href='collectionWrite.do'">등록</button>
		</div>
		</c:if>		
		<hr style="clear:both">
		<table>
			<tr>
			<c:forEach var="vo" items="${list}">
				<td onclick="location.href='collectionInfo.do?coId=${vo.coId}'"
					style="cursor: pointer"  class="digitalColBox">
					<div align="center" class="imgArea">
						<img src="http://localhost:9000/mygit/resources/upload/${vo.coSfile }" class="digitalColImg">
					</div> <br>
					<div class="itemInfo">
						<span class="itemArtist">${vo.coAuthorKor}<br>${vo.coAuthorEng }</span>
						<span class="itemTitle">${vo.coTitle }</span>
						<span class="itemYear">${vo.coYear }</span>
					</div>
				</td>
				</c:forEach>
				<script>				
					var divLast=${divLast};
					var pageCount=${pageCount};
					var reqPage=${reqPage};
								
					if(divLast!=0 && (reqPage==pageCount)){
						var i=0;
						for(i=0;i<divLast;i++){
							document.write("<td class='digitalColBox'></td>");
						}
					}</script>
			</tr>
		</table>
		
		<div class="pageNum"> <!-- 페이지 번호 -->
			<script>
				var pageCount=${pageCount};
				var reqPage=${reqPage};
				var i=1;
				
				var mode='${mode}';
				var searchtext='${searchtext}';
								
				for(i=1;i<=pageCount;i++){
					if(i==reqPage) document.write("<b>");
					document.write("<a href='http://localhost:9000/mygit/online/collection"+mode+".do?rpage="+i);
					if(searchtext!="") document.write("&searchtext="+searchtext);	
					document.write("'>");
					document.write(i+"</a>");
					if(i==reqPage) document.write("</b>");
					document.write("&nbsp;&nbsp;&nbsp;");
				}
			</script>

		</div>
		<hr>
		
		
	</section>


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>