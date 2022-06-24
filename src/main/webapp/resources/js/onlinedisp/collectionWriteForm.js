/**
 * 
 */
 
  $(document).ready(function(){
		
		$("#btnSubmit").click(function(){
			
				if(($("#coTitle").val()=="")){
					alert("제목을 입력하세요.");
					return;
				}else if(($("#formFile").val()=="")){
					alert("소장품 이미지가 필요합니다.");
					return;
				}else if($("#coAuthorKor").val()==""){
					alert("작가명(한글)을 입력하세요.");
					return;
				}else if($("#coAuthorEng").val()==""){
					alert("작가명(영어)을 입력하세요.");
					return;
				}else if($("#coName").val()==""){
					alert("소장품의 작품명을.");
					return;
				}else if($("#coYear").val()==""){
					alert("소장품의 제작연도를 입력하세요.");
					return;
				}else if($("#coMaterial").val()==""){
					alert("소장품의 재료를 입력하세요.");
					return;
				}else if($("#coDim").val()==""){
					alert("소장품의 규격을 입력하세요.");
					return;
				}else if($("#coContent").val()==""){
					alert("글 내용을 입력하세요.");
					return;
				}else{
					$("form").submit();
					return;
				}		
		});
	});