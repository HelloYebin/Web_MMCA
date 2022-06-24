/**
 * 
 */
 
 	$(document).ready(function() {
		$(".rcancel").click(function() {
			var text = $(this).val();
			if(text=="취소") {
				var res = confirm("예약을 취소하시겠습니까?");
			} else {
				var res = confirm("예약취소를 복원하시겠습니까?");
			}
			
			if(res) {
				var rid = $(this).parent().parent().children(':first-child').text();
				$.ajax({
					url:"admin/rcancel.do?rid="+rid,
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