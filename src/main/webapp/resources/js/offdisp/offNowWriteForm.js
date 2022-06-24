/**
 * 
 */
 
  $(document).ready(function(){
		
		$("#btnSubmit").click(function(){
			
				if(($("#exTitle").val()=="")){
					alert("제목을 입력하세요.");
					return;
				}else if(($("#formFiles").val()=="")){
					alert("전시회 이미지가 필요합니다.");
					return;
				}else if($("#exTermStart").val()==""){
					alert("전시회 시작일을 입력하세요.");
					return;
				}else if($("#exTermEnd").val()==""){
					alert("전시회 마감일을 입력하세요.");
					return;
				}else if($("#exPlace").val()==""){
					alert("전시회 장소를 입력하세요.");
					return;
				}else if($("#exHost").val()==""){
					alert("전시회 주최자를 입력하세요.");
					return;
				}else if($("#exPrice").val()==""){
					alert("전시회 입장료를 입력하세요.");
					return;
				}else if($("#exPiece").val()==""){
					alert("전시회 전시 작품수를 입력해주세요.");
					return;	
				}else if($("#exAuthor").val()==""){
					alert("전시회 작가명을 입력해 주세요.");
					return;	
				}else if($("#exContent").val()==""){
					alert("글 내용을 입력하세요.");
					return;
				}else{
					$("form").submit();
					return;
				}		
		});
	});