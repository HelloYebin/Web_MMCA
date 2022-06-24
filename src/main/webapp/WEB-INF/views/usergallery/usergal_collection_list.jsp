<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>

<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/usergal/usergal_detail_list.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		
		var contentCount=8;
		var slideMaxCount=5;
		var slideCurCount=0;
		var width=35 * contentCount+"%";
		var position=32.7*slideCurCount+"%";
		
		$("#itemList").css("border-bottom","2px black solid");
		$("#digigalList").css("color","#eee");
		
		$("#slides").css("width",width);
		
		$("#leftArrow").click(function name() {
			if(slideCurCount<5){
			slideCurCount++;
			position=-100/3*slideCurCount+"%";
			$("#slides").css("left",position);}
		});
		
		$("#rightArrow").click(function name() {
			if(slideCurCount>0){
			slideCurCount--;
			position=-100/3*slideCurCount+"%";
			$("#slides").css("left",position);}
			
		});
	
	});
	
</script>
<style type="text/css">
#slideWrapper{
	position: relative;
	width: 97.6%;
	height: 450px;
	overflow: hidden;
	padding: 0;
}

#slides{
	position:absolute;
	left:0;
	height: 450px;
}
.itemBox{
	float:left;
}

.arrow{
	position: absolute;
	top: 150px;
	cursor: pointer;
	z-index: 2;
	padding: 0px;
	margin: 0px;
}

.arrow img{
	width: 50px;
	height: 50px;
}
#leftArrow{
	left: 0px;
	transform:rotate(180deg);
}

#rightArrow{
	right: 10px;
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
<div id="middle">
<aside>
<h2 id="usergallTitle">봄이 오는 소리</h2>
<p id="usergalDesc">봄이 느껴지는 작품을 모았습니다.</p><br>
<button type="button" class="btnEmail" style="cursor: pointer;">codms95**@gmail.com 갤러리</button><br>
<small>조회수 78 | 스크랩 * | 좋아요 ♡</small>
</aside>

<section>
<h2>
	<span onclick="location.href='collectionList.do" class="subMenu" id="itemList">소장품</span>
	<span onclick="location.href='galleryList.do'" class="subMenu" id="digigalList">디지털미술관</span>
</h2>
<div id="slideWrapper">
	<div id="leftArrow" class="arrow"><img src="http://localhost:9000/mygit/resources/images/right.png"></div>
	<div id="rightArrow" class="arrow"><img src="http://localhost:9000/mygit/resources/images/right.png"></div>
	<div id="slides">
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">봄 풍경<br>오지호</div>
	</div>
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2_1.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">효자리 살구꽃<br>이동훈</div>
	</div>
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2_2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">꽃을 든 여인<br>천경자</div>
	</div>
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2_2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">꽃을 든 여인<br>천경자</div>
	</div>
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2_2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">꽃을 든 여인<br>천경자</div>
	</div>
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2_2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">꽃을 든 여인<br>천경자</div>
	</div>
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2_2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">꽃을 든 여인<br>천경자</div>
	</div>
	<div onclick="location.href='../online/collectionInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/user2_2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">꽃을 든 여인<br>천경자</div>
	</div>
	</div>
</div>
</section>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>