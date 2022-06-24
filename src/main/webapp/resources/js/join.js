/**
 * 
 */
	$(document).ready(function() {
		$("#joinCheck").click(function() {
			
			if($("#id").val()=="") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			} else if($("#pw").val()=="") {
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			} else if($("#pwc").val()=="") {
				alert("비밀번호를 확인해주세요.");
				$("#pwc").focus();
				return false;
			} else if($("#pwc").val() != $("#pw").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#pwc").focus();
				return false;
			} else if($("#name").val()=="") {
				alert("이름를 입력해주세요.");
				$("#name").focus();
				return false;
			} else if($("#email1").val()=="") {
				alert("이메일을 입력해주세요.");
				$("#email1").focus();
				return false;
			} else if($("#email2").val()=="") {
				alert("이메일을 입력해주세요.");
				$("#email2").focus();
				return false;
			} else if($("#address").val()=="") {
				alert("주소를 입력해주세요.");
				$("#address").focus();
				return false;
			} else if($("#ph2").val()=="") {
				alert("전화번호를 입력해주세요.");
				$("#ph2").focus();
				return false;
			} else if($("#ph3").val()=="") {
				alert("전화번호를 입력해주세요.");
				$("#ph3").focus();
				return false;
			} else if($("#idcheck").is('[disabled=disabled]') == false) {
				alert("중복확인을 진행해주세요");
				return false;
			} else {
				join_form.submit();
			}
		});
		
		$("#email3").change(function() {
			$("#email2").val($(this).val());
		});
		
		$("#id").change(function() {
			if($("#idcheck").is('[disabled=disabled]') == true) {
				$("#idcheck").attr("disabled", false);
			}
		});
		
		$("#idcheck").click(function() {
			var id = $("#id").val();
			if(id=="") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
			} else {
				$.ajax({
					url:"idcheck.do?id="+id,
					success : function(result) {
						if(result==1) {
							alert("중복된 아이디입니다");
							$("#id").val("").focus();
						} else {
							alert("사용 가능한 아이디입니다");
							$("#idcheck").attr("disabled", true);
							$("pw").focus();
						}
					}
				});
			}
		})
	});