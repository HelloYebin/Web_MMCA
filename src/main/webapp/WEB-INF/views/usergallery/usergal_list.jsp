<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/usergal/usergal_main_list.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#modalOpenBtn").click(function () {
			$("#modalBackground").css("display","block");
		});
		
		$("#modalCloseBtn").click(function () {
			$("#modalBackground").css("display","none");
		});
		
		$("#createBtn").click(function () {
			var galleryTitle=$("#titleInputBar").val();
			var galleryUserId="${id}";
			
			$.ajax({
				url:"/mygit/usergal/usergalCreate.do",
				type:"POST",
				dataType:"json",
				data:{"galleryTitle":galleryTitle,"galleryUserId":galleryUserId},
				success:function(result){
					alert(result);
				}
			});
		});
		
	});
</script>
<style type="text/css">
#formArea{
	float:left;
	
	width: 70%
}

#btnArea{
	float:right;
	position: relative;
	
	width: 20%;
	height: 100px;
}

#modalOpenBtn{
position: absolute;
right: 0px;
bottom: 20px;
width: 180px;	
height: 50px;
color:white;
background-color: black;
border-radius: 25px;
width: 150px; font-size: 20px; 
margin:10px;

}

#modalBackground{
	position: fixed;
	left:0;
	top:0;
	width:100%;
	height: 100%;
	background-color:rgba(0,0,0,0.4);
	display:none;
}

#modalArea{
	position:fixed;
	left: 35%;
	top: 33%;
	width: 30%;
	height: 34%;
	display: block;
	background-color: white;
	padding: 50px;
}

#modalCloseBtn{
	position: absolute;
	right: 20px;
	bottom: 10px;
	width: 180px;	
	height: 50px;
	color:white;
	background-color: black;
	border-radius: 25px;
	width: 150px; font-size: 20px; 
	margin: 20px;
}

#createBtn{
	width: 180px;	
	height: 50px;
	color:white;
	background-color: black;
	border-radius: 25px;
	width: 150px; font-size: 20px; 
	margin:10px;
}
</style>
</head>
<body>
	
	<jsp:include page="../header.jsp"></jsp:include>
	
	
	<section>
		<h1>이용자갤러리</h1>
		<div id="formArea">
		<form id="colForm">
			<input type="text" placeholder="컬렉션명을 입력해주세요." id="searchBar" name="searchtext">
			<button type="button" class="btnCalModal">
				<img src="http://localhost:9000/mygit/resources/images/usergal/search1.PNG">
			</button>
			<button type="submit" onclick="" class="btnCollectionSearch">검색</button>
		</form></div>
		<c:if test="${id!=null }">
		<div id="btnArea">
		<button id="modalOpenBtn">마이갤러리 생성</button>
		</div>
		</c:if>
		<div id="modalBackground">
		<div id="modalArea">
		<h2 style="margin: 20px;">갤러리명을 입력하세요.</h2>
		<hr>
		<form id="createForm">
		<input type="text" placeholder="컬렉션명을 입력해주세요." id="titleInputBar" name="searchtext">
		<button type="button" id="createBtn">갤러리 생성</button>
		</form>
		<button id="modalCloseBtn">창닫기</button>
		</div>
		</div>
		<hr style="clear:both;">
		<table>
			<tr>
				<td onclick="location.href='collectionList.do'"
					style="cursor: pointer">
					<div align="center">
						<img src="http://localhost:9000/mygit/resources/images/usergal/user1.PNG" style="width: 200px; height: 200px;">
					</div> <br>
					<div class="itemInfo">
						<span class="itemTitle">[갤러리아미]셀피_작가의 자회상</span><br><small>mul-pu**@hanmail.net님
							갤러리<br> <span style="color:#888">조회수:55|좋아요:0</span>
						</small>
					</div>
				</td>
				<td onclick="location.href='collectionList.do'"
					style="cursor: pointer">
					<div align="center">
						<img src="http://localhost:9000/mygit/resources/images/usergal/user2.PNG" style="width: 200px; height: 200px;">
					</div> <br>
					<div class="itemInfo">
						<span class="itemTitle">봄이오는 소리</span><br> <small>comdms95**@gmail님 갤러리<br>
							<span style="color:#888">조회수:55|좋아요:0</span>
						</small>
					</div>
				</td>
				<td onclick="location.href='collectionList.do'"
					style="cursor: pointer">
					<div align="center">
						<img src="http://localhost:9000/mygit/resources/images/usergal/user3.PNG" style="width: 200px; height: 200px;">
					</div> <br>
					<div class="itemInfo">
						<span class="itemTitle">내가 좋아하는 작가님</span><br> <small>lethe**@korea.kr님
							갤러리<br> <span style="color:#888">조회수:142|좋아요:1</span>
						</small>
					</div>
				</td>
			
				<td onclick="location.href='collectionList.do'"
					style="cursor: pointer">
					<div align="center">
						<img src="http://localhost:9000/mygit/resources/images/usergal/user4.PNG" style="width: 200px; height: 200px;">
					</div> <br>
					<div class="itemInfo">
						<span class="itemTitle">꽃길만걸어요</span><br> <small>lethe**@korea.kr님 갤러리<br>
							<span style="color:#888">조회수:90|좋아요:0</span>
						</small>
					</div>
				</td>
				<td onclick="location.href='collectionList.do'"
					style="cursor: pointer">
					<div align="center">
						<img src="http://localhost:9000/mygit/resources/images/usergal/user5.PNG" style="width: 200px; height: 200px;">
					</div> <br>
					<div class="itemInfo">
						<span class="itemTitle">[갤러리아미]셀피_작가의 자회상</span><br> <small>lethe**@korea.kr님
							갤러리<br> <span style="color:#888">조회수:126|좋아요:0</span>
						</small>
					</div>
				</td>
				<td onclick="location.href='collectionList.do'"
					style="cursor: pointer">
					<div align="center">
						<img src="http://localhost:9000/mygit/resources/images/usergal/user6.PNG" style="width: 200px; height: 200px;">
					</div> <br>
					<div class="itemInfo">
						<span class="itemTitle">달이 있는 풍경</span><br> <small>lethe**@korea.kr님
							갤러리<br> <span style="color:#888">조회수:127|좋아요:1</span>
						</small>
					</div>
				</td>
			</tr>
		</table>
		<div class="pageNum"> <!-- 페이지 번호 -->
			<span><b>1</b></span>
			&nbsp;&nbsp;&nbsp;
			<span>2</span>
		</div>
		<hr>
		<footer>
		</footer>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>