/**
 * 
 */
 	$(document).ready(function() {
		$("#reserve_time_box").hide();
		
		$(".show_info").click(function() {
			if($(this).find('span.open_close').length != 0) {
				var title = $(this).find('.show_title').text();
				var imgsrc = $(this).find('.show_poster').attr('src');
				var poster_large = "<section class='poster_large'>";
						poster_large += "<h5>"+title+"</h5>";
						poster_large += "<img src='"+imgsrc+"' class='reserve_show_poster'>";
					poster_large += "</section>";
					
				$(".poster_large").remove();
				$("#reserve_h3").after(poster_large);
				$("input[name=rtitle]").val(title);
			} else {
				alert("현재 예약 불가능한 전시회입니다.");
				return false;
			}
		});
		
		
		var timemenu_exist = 0;
		
		$("#reserve_time").click(function() {
			if(timemenu_exist == 0) {
				$("#reserve_time_box").show();
				timemenu_exist = 1;
			} else {
				$("#reserve_time_box").hide();
				timemenu_exist = 0;
			}
		});
		
		$("#reserve_confirm").click(function() {
			var title = $('input[name="rtitle"]').val();
			var date = $('input[name="rdate"]').val();
			var time = $('input[name="rtime"]:checked').val();
			var num = $('input[name="rnum"]').val();
			var id = $('input[name="id"]').val();
			
			if(id == "") {
				var login = confirm("로그인이 필요한 서비스입니다. \n\n 로그인 창으로 이동하시겠습니까?");
				if(login == 1) {
					$(location).attr('href', 'login.do');
					return false;
				} else {
					return false;
				}
			} else if(title == 0) {
				alert("예약할 전시회를 선택해 주세요.");
				return false;
			} else if (date == "") {
				alert("방문 일자를 선택해 주세요.");
				return false;
			} else if (time == null) {
				alert("방문 시간을 선택해 주세요.");
				return false;
			} else if (num == "") {
				alert("방문 인원을 입력해 주세요.");
				return false;
			} else if (num <= 0) {
				alert("인원이 잘못 입력되었습니다.")
				return false;
			}
		});
	});