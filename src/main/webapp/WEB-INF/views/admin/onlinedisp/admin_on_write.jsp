<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<style type="text/css">
	*{margin: 0; padding: 0;}
	
	#admin_screen{
	width: 1600px; height: 800px; border: 1px black solid; position: absolute; left: 8%; top: 5%; 
	
	}
	
	#tool{
	height: 5%; width: 100%; background-color: red;
	}
	
	#left{
	background-color: #dee2e6; width: 300px; height: 95%;
	}
	
	#left_box{background-color: white; width: 250px; height: 18%; position: relative; top:20px; left: 8%;}
	
	#left_create_box{
	background-color: white; opacity: 0.3;
	width: 250px; height: 18%; 
	position: relative; top:50px; left: 8%;
	}
	
	#create_box_plus{
	font-size: 65pt;
	text-align: center;
	}
	
	.btn{
	top: 870px; left:84%; width: 200px; position: relative;
	}
</style>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>

<section>
	<div id="admin_screen">
		<div id="tool">글자 도구</div>
		<div id="left">
			<div id="left_box"></div>
			<div id="left_create_box">
				<div id="create_box_plus">+</div>
			</div>
		</div>
	</div>
	<div class="btn">
		<input type="button" value="취소" >
		<input type="button" value="미리보기">
		<input type="button" value="저장">
	</div>
</section>
<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>