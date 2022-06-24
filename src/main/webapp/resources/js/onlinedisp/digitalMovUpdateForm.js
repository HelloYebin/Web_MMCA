/**
 * 
 */
 
 $(document).ready(function(){
		
		$("#btnSubmit").click(function(){
			
				if(($("#dmTitle").val()=="")){
					alert("제목을 입력하세요.");
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
		
			$("#fileSelect").change(function name() {
				if(window.FileReader){
					var fname=$(this)[0].files[0].name;
					$(".FileName").text(fname);
				}
		});
	});