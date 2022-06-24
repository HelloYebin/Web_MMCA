/**
 * 
 */
 
  $(document).ready(function(){
		
		$("#btnSubmit").click(function(){
				
				if(($("#faTitle").val()=="")){
					alert("제목을 입력하세요.");
					return;
				}else if($("#faContent").val()==""){
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