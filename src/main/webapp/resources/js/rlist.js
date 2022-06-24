/**
 * 
 */
 
 $(document).ready(function() {
	$("#search").click(function() {
		var rnum1 = $("#rnum1").val();
		var rnum2 = $("#rnum2").val();
		if(rnum1 == '') {
			$("#rnum1").val(0);
		}
		if(rnum2 == '') {
			$("#rnum2").val(0);
		}
	});
	
	$("#reset").click(function() {
		$(location).attr('href', 'reservation_list.do');
	});
	
	$(".rcancel").click(function() {
		var rid = $(this).parent().parent().children(':first-child').text();
		var text = $(this).val();
		if(text=="취소") {
			var res = confirm("예약을 취소하시겠습니까?");
		} else {
			var res = confirm("예약취소를 복원하시겠습니까?");
		}
		
		if(res) {
			$.ajax({
				url:"rcancel.do?rid="+rid,
				success : function(result) {
					if(result=="1") {
						alert("처리되었습니다.");
						location.reload();
					} else {
						alert("처리에 실패했습니다.");
					}
				}
			});
		} else {
			return false;
		}
	});
	
	$(".rvisited").click(function() {
		var rid = $(this).parent().parent().children(':first-child').text();
		var text = $(this).val();
		if(text=="완료") {
			var res = confirm("방문 완료 처리");
		} else {
			var res = confirm("방문 완료 처리 취소");
		}
		
		if(res) {
			$.ajax({
				url:"rvisited.do?rid="+rid,
				success : function(result) {
					if(result=="1") {
						alert("처리되었습니다.");
						location.reload();
					} else {
						alert("처리에 실패했습니다.");
					}
				}
			});
		} else {
			return false;
		}
	});
});