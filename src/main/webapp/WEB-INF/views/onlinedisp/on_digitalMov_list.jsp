<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/online/online_colmov_list.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		
		var progCount=0;
		var cateCount=0;
		var progTxt="";
		var cateTxt="";
		
		$("#keywordSearch").click(function () {
			$("#keywordForm").submit();
		});
		
		$("#categorySelectForm").hide();
		
		$("#submenu").css("color","#eee");
		
		$(".listBtn").css("cursor","pointer")
		$(".listBtn").first().css("color","#111")
		$(".listBtn").first().css("text-decoration","underline");
		
		
		$("#keywordMode").click(function(){
			$("#keywordMode").css("color","#111");
			$("#keywordMode").css("text-decoration","underline");
			$("#categoryMode").css("color","#eee");
			$("#categoryMode").css("text-decoration","none");
			$("#categorySelectForm").hide();
			$("#digitalForm").slideDown("fast");
			
		});
		
		$("#categoryMode").click(function(){
			$("#keywordMode").css("color","#eee");
			$("#keywordMode").css("text-decoration","none");
			$("#categoryMode").css("color","#111");
			$("#categoryMode").css("text-decoration","underline");
			$("#categorySelectForm").slideDown("fast");
			$("#digitalForm").hide();		
		});
		
		$(".progBtn").click(function(){
			if($(this).css("color")==="rgb(0, 0, 0)"){
				$(this).css("background","black");
				$(this).css("color","white");
				$(".progBtn").not(this).css("background","white");
				$(".progBtn").not(this).css("color","black");
				
				progTxt=$(this).text();
			
			}
			else{
				$(this).css("background","white");
				$(this).css("color","black");
				
				cateTxt="";
			}			
		});
		
		$(".cateBtn").click(function(){
			if($(this).css("color")==="rgb(0, 0, 0)"){
				$(this).css("background","black");
				$(this).css("color","white");
				$(".cateBtn").not(this).css("background","white");
				$(".cateBtn").not(this).css("color","black");
				
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
		
		
		$("#categorySearch").click(function () {
			
			$("#searchprog").val(progTxt);
			$("#searchcate").val(cateTxt);
		});

				
	});
</script>
<title>국립현대미술관에 오신 것을 환영합니다.</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<section>
		<h1>디지털동영상</h1>
		<div id="submenu">
		<span class="listBtn" id="keywordMode" >키워드 검색</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="listBtn" id="categoryMode" >조건 검색</span>
		</div>
		<div id="digitalForm">
		<form method="get" action="digitalMovSearch.do" class="content_layout" enctype="multipart/form-data" id="keywordForm">
		 	<input type="hidden" name="rpage" value="1">
			<input type="text" placeholder="검색어를 입력해주세요" id=searchBar name="searchtext">
			<button type="button" class="btnCollectionSearch" id="keywordSearch">검색</button>						
		</form>
		</div>
		<div id="categorySelectForm">
		<form method="get" class="content_layout" enctype="multipart/form-data" id="categoryForm">
		 	<input type="hidden" name="rpage" value="1">
			<input type="hidden" name="searchprog" value="" id="searchprog">
			<input type="hidden" name="searchcate" value="" id="searchcate">
			
			<div id="selectArea">
			<table align="left" id="categorySelTable">
			<tr><th>프로그램</th>
			<td><div class="selBtn progBtn">관장이 들려주는 소장품 이야기</div>
			<div class="selBtn progBtn">큐레이터 전시 해설</div>
			<div class="selBtn progBtn" id="btnTest">강의&amp;학술토론</div>
			<div class="selBtn progBtn">작품&amp;작가</div>
			<div class="selBtn progBtn">미술관 소식</div>
			<div class="selBtn progBtn">오늘, 이 작품</div></td>
			
			</tr>
			<tr><th>분류</th>
			<td><div class="selBtn cateBtn">전시연계</div>
			<div class="selBtn cateBtn">전시감상</div>
			<div class="selBtn cateBtn">진로탐색</div>
			<div class="selBtn cateBtn">보존과학</div>
			<div class="selBtn cateBtn">작가인터뷰</div>
			<div class="selBtn cateBtn">전시소개</div></td>
			</tr>
			</table>
			<button type="button" class="btnCollectionSearch" id="categorySearch">검색</button>	
			</div>								
		</form>
		</div>
		<c:if test="${id =='admin'}">
		<div id="btnArea">
		<button class="btnList" onclick="location.href='digitalMovWrite.do'">등록</button>
		</div>
		</c:if>
		<hr style="clear:both">
		<table>
			<tr>
				<c:forEach var="vo" items="${list}">
				<td onclick="location.href='digitalMovInfo.do?dmId=${vo.dmId}'"
					style="cursor: pointer" class="digitalMvBox">
					<div align="center" class="imgArea">
						<img src="http://localhost:9000/mygit/resources/upload/${vo.dmSfile }" class="digitalMvImg" style="margin:0 auto;">
					</div> <br>
					<div class="itemInfo"> 
						<span class="itemCategory">${vo.dmProgram}</span>
						<span class="itemTitle">${vo.dmTitle}</span>
						<span class="itemDay">${vo.dmDate }|조회수:${vo.dmHits}</span>
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
							document.write("<td class='digitalMvBox'></td>");
						}
					}
				</script>
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
					document.write("<a href='http://localhost:9000/mygit/online/digitalMov"+mode+".do?rpage="+i);
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