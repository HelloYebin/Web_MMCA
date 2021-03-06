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
<title>???????????????????????? ?????? ?????? ???????????????.</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<section>
		<h1>??????????????????</h1>
		<div id="submenu">
		<span class="listBtn" id="keywordMode" >????????? ??????</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="listBtn" id="categoryMode" >?????? ??????</span>
		</div>
		<div id="digitalForm">
		<form method="get" action="digitalMovSearch.do" class="content_layout" enctype="multipart/form-data" id="keywordForm">
		 	<input type="hidden" name="rpage" value="1">
			<input type="text" placeholder="???????????? ??????????????????" id=searchBar name="searchtext">
			<button type="button" class="btnCollectionSearch" id="keywordSearch">??????</button>						
		</form>
		</div>
		<div id="categorySelectForm">
		<form method="get" class="content_layout" enctype="multipart/form-data" id="categoryForm">
		 	<input type="hidden" name="rpage" value="1">
			<input type="hidden" name="searchprog" value="" id="searchprog">
			<input type="hidden" name="searchcate" value="" id="searchcate">
			
			<div id="selectArea">
			<table align="left" id="categorySelTable">
			<tr><th>????????????</th>
			<td><div class="selBtn progBtn">????????? ???????????? ????????? ?????????</div>
			<div class="selBtn progBtn">???????????? ?????? ??????</div>
			<div class="selBtn progBtn" id="btnTest">??????&amp;????????????</div>
			<div class="selBtn progBtn">??????&amp;??????</div>
			<div class="selBtn progBtn">????????? ??????</div>
			<div class="selBtn progBtn">??????, ??? ??????</div></td>
			
			</tr>
			<tr><th>??????</th>
			<td><div class="selBtn cateBtn">????????????</div>
			<div class="selBtn cateBtn">????????????</div>
			<div class="selBtn cateBtn">????????????</div>
			<div class="selBtn cateBtn">????????????</div>
			<div class="selBtn cateBtn">???????????????</div>
			<div class="selBtn cateBtn">????????????</div></td>
			</tr>
			</table>
			<button type="button" class="btnCollectionSearch" id="categorySearch">??????</button>	
			</div>								
		</form>
		</div>
		<c:if test="${id =='admin'}">
		<div id="btnArea">
		<button class="btnList" onclick="location.href='digitalMovWrite.do'">??????</button>
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
						<span class="itemDay">${vo.dmDate }|?????????:${vo.dmHits}</span>
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
		<div class="pageNum"> <!-- ????????? ?????? -->
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