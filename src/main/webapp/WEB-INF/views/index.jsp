<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>

 	$(document).ready(function(){
 		$(".text").click(function(){	
 			
 			$('.modal').css('display','block');
 			$('.modal_content').css('display','block');
 			
 		});
 		
 		$('#modal_close_btn').click(function() {
 			$('.modal').css('display','none');
 			$('.modal_content').css('display','none');
		});
 		
 	});
</script>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/index.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<a><img src="resources/images/index.png" id="museum"></a>
	<div class=up1>
		<div id = mmca>국립현대미술관</div>
		<div id="info">
			<p class="info1"><b>환영합니다.</b></p>
			<p class="info2">국립현대미술관은 개관 반세기의 역사를 자랑하는 국내 유일의 국가현대미술관입니다.<br>
			우리 미술관은 서울관, 과천관, 덕수궁관, 청주관의 4관 체제에서 <br>
			이제 대전관 신설로 5관 체제로 진입하고 있습니다.<br><br>
			우리 미술관은 ‘확장과 연결’로 열린 미술관을 지향하고 있습니다. <br>
			생활 속에서 삶의 질을 높이고, 감동과 상상력의 충전소로 거듭 나기를 노력하고 있습니다.<br><br>
			더불어 이건희컬렉션의 대량기증으로 소장품 1만점 시대에 진입했고, <br>
			보다 다양한 전시와 미술관 프로젝트로 국민의 곁에 늘 있기를 희망하고 있습니다. <br>
			거기다 미술한류 사업에도 박차를 가해 세계 속에서 한국현대미술의 존재감을 높이고자 합니다.<br><br>
			국립현대미술관은 항상 여러분의 곁에 있습니다. <br>
			언제라도 방문하셔서 다양한 프로그램을 즐기시기를 바랍니다.<br>
			바로 이웃과 같은 친근하고 포근한 열린 미술관이기 때문입니다.<br><br>
			개방적이고도 신바람 나는 미술관, 그러면서도 감동을 주는 미술관으로 여러분을 초대합니다. <br>
			함께하시는 여러분! 감사합니다.</p>
			<a href="#" id="info_detail">자세히 보기</a>
		</div>
	</div>
	<div class=up2>
		<table>
			<thead>
				<th><br><br>오프라인 전시회</th>
			</thead>
			<tr class=td1>
				<td>
					<div class="container">
					  <img src="resources/images/modern1.PNG" alt="image1" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">가면무도회</div>
				</td>		

				<td>
					<div class="container">
					  <img src="resources/images/modern2.PNG" alt="image2" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">나 너의 기억</div>
				</td>
				
				<td>
					<div class="container">
					  <img src="resources/images/modern3.PNG" alt="image3" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">미술로, 세계로</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/modern4.PNG" alt="image4" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">funtion</div>
				</td>	
			</tr>
			<tr class=td1>
				<td>
					<div class="container">
					  <img src="resources/images/modern5.PNG" alt="image5" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">달뿌리-느리고 빠른 대화</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/modern6.PNG" alt="image6" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">집우지주</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/modern7.PNG" alt="image7" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">이건희컬렉션 특별전</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/modern8.PNG" alt="image8" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">너랑 나랑</div>
				</td>	
			</tr>
		</table>
		<br>
		<br>
		<br>
		<table>
			<thead>
				<th>온라인 전시회</th>
			</thead>
			<tr class=td1>
				<td>
					<div class="container">
					  <img src="resources/images/sojang1.PNG" alt="sojang1" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">국립현대미술관 소장품 300<br>(1910년대~1920년대)</div>
				</td>		

				<td>
					<div class="container">
					  <img src="resources/images/sojang2.png" alt="image2" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">국립현대미술관 소장품 300<br>(1930년대~1940년대)</div>
				</td>
				
				<td>
					<div class="container">
					  <img src="resources/images/sojang3.PNG" alt="image3" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">국립현대미술관 소장품 300<br>(1950년대~1960년대)</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/sojang4.png" alt="image4" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">국립현대미술관 소장품 300<br>(1970년대~1980년대)</div>
				</td>	
			</tr>
			<tr class=td1>
				<td>
					<div class="container">
					  <img src="resources/images/sojang5.PNG" alt="image5" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">국립현대미술관 소장품 300<br>(1990년대)</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/sojang6.PNG" alt="image6" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">국립현대미술관 소장품 300<br>(2000년대)</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/sojang7.png" alt="image7" class="image" width="220px" height="300px">
					  <div class="middle">
					    <div class="text">자세히보기</div>
					  </div>
					</div>
					<div class="test">국립현대미술관 소장품 300<br>(2010년대)</div>
				</td>	
			</tr>
		</table>
	</div>
    <div class="modal">
	    <div class="modal_content">
	        <h1>가면 무도회</h1>
	        <hr>
	        <div class="modal_picture">
	        	<img src="resources/images/modern1.PNG" alt="image1" class="image" width="220px" height="300px">
	        </div>
	        <div class="modal_info">
				<h3>기간</h3>
				<a>2022-04-13 ~ 2022-07-31</a>
				<br><br>
				<h3>주최/후원</h3>
				<a>국립현대미술관</a>
				<br><br>
				<h3>장소</h3>
				<a>과천 1원형전시실</a>
				<br><br>
				<h3>관람료</h3>
				<a>0</a>
				<br><br>
				<h3>작가</h3>
				<a>권진규, 남관, 크리스티앙 볼탕스키, 성능경, 김정욱, 자크 블라스 등</a>
				<br><br>
				<h3>작품수</h3>
				<a>국내ㆍ외 주요작가의 작품 40여 점 (현대미술 전 부문)</a>
			</div>
	        <div class="modal_btn">
	        	<button type="button" id="modal_close_btn">닫기</button>   
	        	<button type="button" id="modal_detail_btn">자세히 보기</button> 
	        </div>
	    </div>
    </div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>