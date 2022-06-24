<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="resources/css/offline/offline.css">
</head>
<body>
   <!-- header -->
   <jsp:include page="../header.jsp"></jsp:include>
	<hr>
	<section>
			<div id="search">
			<h1 id="p_name">예정전시</h1>
			<form id="searchForm">
				<input type="text" placeholder="작품명 또는 작가명을 검색해주세요." id="searchbar">
				<button type="submit" id="searchbutton">검색</button>
			</form>
			</div>
			<hr>
			<div id="categorybtn"><!-- 카테고리 버튼 -->
			<button type="button" class="category">전체</button>
			<button type="button" class="category">전시</button>
			<button type="button" class="category">필름앤비디오</button>
			<button type="button" class="category">다원예술</button>
			<button type="button" class="category">해외전시</button><br> 
			</div>
			<table><!-- 컨텐츠목록 -->
			<tr class=td1>
				<td>
					<div class="container">
					  <img src="resources/images/offline/masquerade.png" alt="image1" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">가면무도회</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>		

				<td>
					<div class="container">
					  <img src="resources/images/offline/myyourmemory.png" alt="image2" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">나너의 기억</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>
				
				<td>
					<div class="container">
					  <img src="resources/images/offline/to the world through art.png" alt="image3" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">MMCA 국제미술 소장품 기획전 ≪미술로,세계로≫</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/offline/(function).png" alt="image4" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">MMCA 과천프로젝트 2021:예술버스쉼터_쓸모없는 건축과 유용한 조각에 대하여</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>	
			</tr>
			<tr class=td1>
				<td>
					<div class="container">
					  <img src="resources/images/offline/circular garden project.png" alt="image5" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">원형정원 프로젝트: 달뿌리-느리고빠른 대화</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/offline/of the perfect city.png" alt="image6" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">MMCA 청주프로젝트 2021≪천대광: 집우집주≫</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/offline/lee kun-hee collection.jpg" alt="image7" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">MMCA 이건희컬렉션 특별전: 한국미술명작</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>	
				<td>
					<div class="container">
					  <img src="resources/images/offline/with you n me.png" alt="image8" class="image" width="300px" height="300px">
					</div>
					<div class="text">
						<p class="title">너랑 나랑__</p>
						<p>2021-05-04~2022-12-11</p>
					</div>
				</td>	
			</tr>
		</table>
		<div id="pagenum"> <!-- 페이지 번호 -->
			<span>1</span>
			<span>2</span>
			<span>3</span>
		</div>
		<div><!-- 맨 위로 버튼 -->
			<img alt="" src="">
		</div>
		
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>