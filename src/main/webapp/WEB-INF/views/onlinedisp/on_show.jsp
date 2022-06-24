<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" type="text/css" href="../resources/css/on_show.css">
<style type="text/css">
	*{margin: 0; padding: 0;}
</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
	<div id="show">
		<div id="show_left">
			<div>
				<img src = "../resources/images/sojang2.png" id="show_image">
			</div>
		</div>
		<div id="show_right">
			<a id="show_title">김환기 - 론도(1938)</a>
			<br><br><br>
			<a id="show_info">수화(樹話) 김환기(金煥基, 1913-1974)는 한국 추상미술의 선구적 작가이다. <br><br>
			그는 일본으로 유학하여 1933년부터 도쿄 니혼대학(日本大学) 예술학부에서 수학하면서 당시 권위 있는 단체전 중 하나인 《니카텐(二科展, 이과전)》과 
			추상 미술 단체전인 《자유미술가협회전(自由美術家協会展)》에 출품하였다. <br><br>
			1930년대 일본에서 유학하던 도쿄 시기(1933-1937)에 그는 입체주의와 추상미술 등 여러 경향을 실험하는 수업기적인 작업을 했다. <br><br>
			〈론도〉는 대학 졸업 후 귀국하여 그린 서울 시기(1937-1956)의 작품으로, 도쿄 우에노에서 열린 《제2회 자유미술가협회전》(1938)에 출품하기 위해 제작되었다.<br><br> 
			‘론도(rondo)’는 음악의 한 형식에서 비롯된 제목이다. <br><br>
			작품의 뒷면에는 “ロンド, 金煥基作, 1938”이라고 적혀 있는데, 
			이러한 표식은 주로 작가가 전시 출품을 위해 명제를 써넣는 방식이다. <br><br>
			바이올린을 배우고 클래식 음악을 즐겨 듣던 김환기는 론도 음악의 선율과 리듬을 추상적인 회화 언어(선, 면, 색)로 환원했다. </a>
		</div>
		<a href="#"><img src = "../resources/images/left.png" class="prev" width="50px" height="50px"></a>
		<a href="#"><img src = "../resources/images/right.png" class="next" width="50px" height="50px"></a>
	</div>
	<a id="show_theme">국립현대미술관 소장품(1930년대~1940년대)</a>
	<div id="sub">
		<div id="sub_info">
			<a><b>추천테마</b></a>
			<br><br>
			<h2>국립현대미술관 소장품(1970년대~1980년대)</h2>
			<a>국립현대미술관에서 소장중인 1970년대~1980년대의 작품들을 볼 수 있다. </a>
			<br><br>
			<input type="button" value="테마보기">
		</div>
	</div>
	</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>