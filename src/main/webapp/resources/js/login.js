/**
 * 
 */
	$(document).ready(function() {
		
		$("#login_button").click(function() {
			if($('input[name="id"]').val() == "") {
				alert("아이디를 입력해주세요.");
				$('input[name="id"]').focus();
				return false;
			} else if($('input[name="pw"]').val() == "") {
				alert("비밀번호를 입력해주세요.");
				$('input[name="pw"]').focus();
				return false;
			}
		});
		
		$("#id_find").click(function() {	
			var id_modal = "<div class='find_modal'>";
				id_modal +=	"<form class='find_content'>";
					id_modal +=	"<h1>아이디 찾기</h1>";
					id_modal +=	"<hr>";
					id_modal +=	"<div id='id_search_res'>";
					id_modal +=	"<h3>이름과 연락처를 입력해주세요</h3>";
					id_modal +=	"<br>";
						id_modal +=	"<h4 style='text-align : center'>이름</h4>";
						id_modal +=	"<input type='text' placeholder='이름을 입력하세요' id='id_name'>";
						id_modal +=	"<br><br>";
						id_modal +=	"<h4 style='text-align : center'>연락처</h4>"
						id_modal +=	"<select id='ph1' class='phone_area'>";
							id_modal +=	"<option value='010'>010</option>";
							id_modal +=	"<option value='011'>011</option>";
							id_modal +=	"<option value='012'>012</option>";
							id_modal += "<option value='019'>019</option>";
						id_modal += "</select>";
						id_modal +=	" - <input type='number' id='ph2' maxlength='4' size='4' class='phone_area'>";
						id_modal += " - <input type='number' id='ph3' maxlength='4' size='4' class='phone_area'>";
						id_modal +=	"<br><br>";
						id_modal +=	"<input type='button' id='id_submit' value='아이디 찾기'>";
						id_modal += "</div>";
						id_modal +=	"<input type='button' id='modal_close_btn' value='닫기'>";
					id_modal +=	"</form>";
				id_modal += "</div>";
				
			$('body').append(id_modal);
		
			$("#modal_close_btn").click(function() {
				$(".find_modal").remove();
			});
			
			$("#id_submit").click(function() {
				var name = $("#id_name").val();
				var ph1 = $("#ph1").val();
				var ph2 = $("#ph2").val();
				var ph3 = $("#ph3").val();
				
				$.ajax({
					url:"id_search.do?name="+name+"&ph1="+ph1+"&ph2="+ph2+"&ph3="+ph3,
					success: function(result) {
						var res = "<br>";
						if(result=="") {
							res += "<br>";
							res += "<p>등록된 아이디가 없습니다.</p>"
							res += "<br>";
						} else {
							res += "<p>회원님의 아이디는</p>";
							res += "<br>";
							res += "<p>"+result+"</p>";
							res += "<br>";
							res += "<p>입니다</p>"
							res += "<br>";
						}	
						
						$("#id_search_res").html(res);
					}
				});
			});
		});
		
		$('#pass_find').click(function() {
			var pw_modal = "<div class='find_pass_modal'>";
				pw_modal += "<form class='find_pass_content'>";
					pw_modal += "<h1>비밀번호 찾기</h1>";
					pw_modal += "<hr>";
					pw_modal += "<div id='pass_search_res'>";
						pw_modal += "<h3>아이디와 이름을 입력해주세요</h3>";
						pw_modal += "<br>";
						pw_modal += "<h4 style='text-align : center'>아이디</h4>";
						pw_modal += "<input type='text' id='pass_id' placeholder='아이디를 입력하세요' class='pass_area'>";
						pw_modal += "<br><br>";
						pw_modal += "<h4 style='text-align : center'>이름</h4>";
						pw_modal += "<input type='text' id='pass_name' placeholder='이름을 입력하세요' class='pass_area'>";
						pw_modal += "<br><br>";
						pw_modal += "<input type='button' id='pass_submit' value='비밀번호 찾기'>";
					pw_modal += "</div>";
					pw_modal += "<input type='button' id='pass_modal_close_btn' value='닫기'>";
				pw_modal += "</form>";
			pw_modal += "</div>";
			
			$('body').append(pw_modal);
			
			$('#pass_modal_close_btn').click(function() {
				$(".find_pass_modal").remove();
			});
			
			$("#pass_submit").click(function() {
				var id = $("#pass_id").val();
				var name = $("#pass_name").val();
				
				$.ajax({
					url:"pass_search.do?id="+id+"&name="+name,
					success: function(result) {
						if(result=="0") {
							alert("아이디 혹은 이름이 틀렸습니다");
						} else if(result=="1") {
							var res = "<br>";
								res += "<h4>새로운 비밀번호</h4>"
								res += "<input type='password' id='new_pw' class='pass_area'>";
								res += "<br><br>";
								res += "<h4>새로운 비밀번호 확인</h4>"
								res += "<input type='password' id='new_pw_conf' class='pass_area'>";
								res += "<br><br>";
								res += "<input type='button' id='new_pw_update' class='pass_area' value='새 비밀번호 설정'>";
						
							$("#pass_search_res").html(res);
							
							$("#new_pw_update").click(function() {
								var new_pw = $("#new_pw").val();
								var new_pw_conf = $("#new_pw_conf").val();
								
								if(new_pw != new_pw_conf) {
									alert("비밀번호가 일치하지 않습니다.");
									return false;
								} else {
									$.ajax({
										url:"pass_update.do?id="+id+"&new_pw="+new_pw,
										success: function(result) {
											if(result=="0") {
												alert("비밀번호 변경에 실패했습니다.");
											} else if(result=="1") {
												alert("비밀번호가 변경되었습니다.");
												$(".find_pass_modal").remove();
											}
										}
									});
								}
							});
						}
					}
				});
			});
		});
	});