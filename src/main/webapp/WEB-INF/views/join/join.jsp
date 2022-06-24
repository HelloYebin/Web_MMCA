<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>
<link rel="stylesheet" href="http://localhost:9000/mygit/resources/css/join.css">
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/mygit/resources/js/join.js"></script>
<script type="text/javascript">
	var join_result = "${join_result}";
	if(join_result=="fail") {
		alert("회원가입 실패");
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<br><br>
	<div id="joinForm">
		<form name="join_form" action="join.do" method="post">
			<h3>회원가입</h3>
			<br><br><hr><br>
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" name="id" id="id"><button type="button" id="idcheck">중복 체크</button></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" id="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwc"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" class="radio" value="남성" checked> 남성 </label>
						<label><input type="radio" name="gender" class="radio" value="여성"> 여성 </label>
						<label><input type="radio" name="gender" class="radio" value="기타"> 기타 </label>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email1" class="email" id="email1"> @
						<input type="text" name="email2" class="email" id="email2" placeholder="직접 입력">&nbsp;
						<select id="email3">
							<option hidden="hidden">선택
							<option>em1
							<option>em2
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" id="address"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<select name="ph1">
							<option value="010">010</option>
							<option value='011'>011</option>
							<option value='012'>012</option>
							<option value='019'>019</option>
						</select> - 
						<input type="number" name="ph2" class="phone" id="ph2" maxlength="4"> - 
						<input type="number" name="ph3" class="phone" id="ph3" maxlength="4">
					</td>
				</tr>
			</table>
			<br>
			<div>
				<button type="button" id="joinCheck">회원가입</button>
				<button type="reset">취소</button>
			</div>
			
		</form>
	</div>
	<br><br>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>