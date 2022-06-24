/**
 * 
 */
 
 	$(document).ready(function () {
		$(".rcancel").click(function() {
			var res_id = $(this).parent().find('.res_id').val();
			
			var text = $(this).val();
			if(text=="예약 가능") {
				var res = confirm("예약 불가로 변경");
			} else {
				var res = confirm("예약 가능으로 변경");
			}
			
			if(res) {
				$.ajax({
					url:"onlist_stateUpdate.do?res_id="+res_id,
					success : function(result) {
						if(result=="1") {
							location.reload();
						}
					}
				});
			} else {
				return false;
			}
		});
	});