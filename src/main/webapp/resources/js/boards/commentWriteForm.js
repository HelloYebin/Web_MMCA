/**
 * 
 */
 
  $(document).ready(function(){
		
		$("#btnSubmit").click(function(){
				
				if(($("#cmTitle").val()=="")){
					alert("제목을 입력하세요.");
					return;
				}else if($("#cmContent").val()==""){
					alert("내용을 입력하세요.");
					return;
				}else{
					$("form").submit();
					return;
				}
				
		});
	});