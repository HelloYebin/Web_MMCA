/**
 * 
 */
 
 $(document).ready(function(){
		
		$("#btnSubmit").click(function(){
			
				if(($("#dmTitle").val()=="")){
					alert("제목을 입력하세요.");
					return;
				}else if(($("#formFile").val()=="")){
					alert("섬네일 이미지가 필요합니다.");
					return;
				}else if($("#dmUrl").val()==""){
					alert("동영상 URL을 입력하세요.");
					return;
				}else if($("#dmContent").val()==""){
					alert("내용을 입력하세요.");
					return;
				}else{
					$("form").submit();
					return;
				}		
		});
	});