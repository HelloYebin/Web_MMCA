<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/online/online_colmov_info.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>
	
	$(document).ready(function(){
		
		var descBoxHeight=$("#descBox").css("height");
			
		$("#deleteBtn").click(function () {
			var del_confirm=confirm("삭제하시겠습니까");
			if (del_confirm==true){
				var id='${vo.dmId}';
				//var id=$("#id").text();
				
				location.href="digitalMovDelete.do?dmId="+id;
				//var id=${dmId};
				//alert('digitalMovDelete.do?dmid=');
				//location.href='digitalMovDelete.do?dmid='+id;
			}
		});
		
		$("#btnSlide").click(function(){
			
			var text=$("#btnSlide").text();
			text=text.substring(0,2);
			
			if(text == '접기'){
				$("#btnSlide").text('펼치기'+'\u00a0\u00a0\u00a0'+'▽');
				$("#descBox").animate({
					height:"50px"
				},400);
				
			}else{
				$("#btnSlide").text('접기'+'\u00a0\u00a0\u00a0\u00a0'+'△');
				$("#descBox").animate({
					height:descBoxHeight
				},400);
				
			}
		});
		
	});
</script>
</head>
<body>
	
	<jsp:include page="../header.jsp"></jsp:include>
	
	<hr>
	<section>
		<h1>${vo.dmTitle }</h1>
		<small>조회수 ${vo.dmHits } | 스크랩 <img alt="" src=""> | 마이갤러리 + | 좋아요 <img alt="" src=""> | <img alt="" src=""></small>
		<hr> 
		<div class="imgContentBox">
		
		<iframe width="560" height="315" src="${vo.embedUrl }"
		 title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		  
		
		</div>
		<div class="contentDesc">
		<table><tr><td colspan="2">
			<p id="descBox" style="overflow:hidden;">
			<div id="id" style="display: none;">${vo.dmId }</div>
			${vo.dmContent }
			<!-- 
				▶과천관 야외조각장<br> <br> <b>김창곤, ‹합 86-7›, 1986</b> 홍익대학교 조소과를
				졸업하고 이탈리아에서 유학한 김창곤(1955-)은 돌의 물성에 매료되어 거석(巨石)을 깎는 조각 작업을 오랫동안 지속해왔다
				. 그는 거대한 돌에서 단순함과 무게, 침묵과 영원성이라는 상징성을 발견하였으며, 조각 과정에서 작가의 개입을 최소화하여
				재료 자체의 속성과 에너지를 드러내는 데 집중했다. ‹합 86-7›(1986)은 사방에서 볼 때 각기 다른 형태의 입체감을
				드러내는 작품으로 안정감 있는 구도를 갖추고 있다. 인체를 머리와 몸통으로 단순화시킨 듯한 형상 속에서 부드러운 곡선이
				드러나며 표면을 정으로 쪼아 질감을 강조한 것이 특징이다. <br> <br> <b>김경옥,
					‹평화-99›, 1981</b> 김경옥(1943-)은 홍익대학교 조소과와 성신여자대학교 대학원을 졸업하였으며 다양한 재료를
				사용하여 조각 작품을 제작해 왔다. ‹평화-99›(1981)는 자연 속에서 놀고 있는 아이의 모습을 생동감 있게 표현한
				작품이다. 열매가 달려 있는 나뭇가지 사이에 양팔을 들고 있는 아이가 배치되어 있어, 인체의 곡선이 나뭇가지의 흐름과
				자연스럽게 연결된다. 화강석을 부드럽게 다듬은 표면은 아기의 고운 피부를 연상시킨다. ‘평화’라는 주제를 표현하기 위해
				자연과 어린이를 결합시킨 작품으로 시각적으로는 경쾌한 운동감이 돋보인다. -->
			</p>
			
		
		<button type="button" class="btnSlide" id="btnSlide">접기&nbsp;&nbsp;&nbsp;&nbsp;△</button>
		</td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<c:choose>
		<c:when test="${vo.prevId!='0' }">
		<tr onclick="location.href='digitalMovInfo.do?dmId=${vo.prevId}'" class="bottomTr">
			<td class="bottomBox">이전글</td><td><b>${vo.prevTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('첫 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">이전글</td><td><b>이전글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose>
		<tr><td colspan="2"><hr></td></tr>
		<c:choose>
		<c:when test="${vo.nextId!='0' }">
		<tr onclick="location.href='digitalMovInfo.do?dmId=${vo.nextId}'" class="bottomTr">
			<td class="bottomBox">다음글</td><td><b>${vo.nextTitle}</b></td>
		</tr></c:when>
		<c:otherwise>
		<tr onclick="alert('마지막 게시물입니다.')" class="bottomTr">
			<td class="bottomBox">다음글</td><td><b>다음글이 없습니다.</b></td>
		</tr>
		</c:otherwise></c:choose>
		<tr><td colspan="2"><hr></td></tr>
	</table>
	</div>
		
			
		<button type="button" onclick="location.href='digitalMovList.do?rpage=1'" class="btnList">목록</button>
		<c:if test="${id =='admin'}">
		<button type="button" class="btnList" id="deleteBtn">삭제</button>
		<button type="button" onclick="location.href='digitalMovUpdate.do?dmId=${vo.dmId}'" class="btnList">수정</button>
		</c:if>
	</section>
	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>