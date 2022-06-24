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
		
		$("#itemList").css("color","#eee");
		$("#digigalList").css("border-bottom","2px black solid");
	});
	
</script>
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
			<span onclick="location.href='collectionList.do'" class="subMenu" id="itemList">소장품</span>
			<span onclick="location.href='galleryList.do'" class="subMenu" id="digigalList">디지털미술관</span>
		</h2>
		<table>
	<tr align="center">
	<td onclick="location.href='../online/digitalMovInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/userdgal1.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">[오늘, 이 작품]봄,과천|야외조각장</div>
	</td>
	<td onclick="location.href='../online/digitalMovInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/userdgal2.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">[오늘, 이 작품]폴아이즈피리|정물,<br>1955|꽃, 연도미상</div>
	</td>
	<td onclick="location.href='../online/digitalMovInfo.do'" class="itemBox" style="cursor: pointer;">
	<div align="center" class="itemImg"><img src="http://localhost:9000/mygit/resources/images/usergal/userdgal3.PNG" style="width:250px; height:250px"></div>
	<div class="itemDesc">[오늘, 이 작품]미술관에서 만난 꽃</div>
	</td>
	</tr>
	<tr><td colspan="3"><hr></td></tr>
</table>
	
	</section>
	</div>
	<hr>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>