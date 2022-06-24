<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>

<!-- 슬라이드 기능 확인용 임시 CSS -->
<link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/faq/faq_list.css"></link> 
<script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function (){
	
	
	var id="${id}";
	
	$(".listBtn").css("color","#eee");
	$(document).on("click",".faqTitle",function(){
		//제목 클릭시 슬라이드 기능 구현
	
		if($(this).css("height") =="356px"){
			$(this).css("height","50px");
		}else{
			$(this).css("height","356px");
		}
		
		$(this).find(".faqContent").slideToggle("fast");
		var width=$(".faqTitle").css("width");
		$(this).find(".faqContent").css("width",width);
		$(".faqTitle").not(this).css("height","50px");
		
		//제목 클릭시 이미지 변경
		if($(this).find(".titleText").find(".qIcon").attr("src")!="http://localhost:9000/mygit/resources/images/q_icon1.png"){
			$(this).find(".titleText").find(".qIcon").attr("src", "http://localhost:9000/mygit/resources/images/q_icon1.png");
		}else{
			$(this).find(".titleText").find(".qIcon").attr("src", "http://localhost:9000/mygit/resources/images/q_icon2.png");
		}
		
		//다른 글 제목 클릭시 이미지 변경
		$(".faqTitle").not(this).find(".faqContent").slideUp("fast");
		$(".faqTitle").not(this).find(".titleText").find(".qIcon").attr("src", "http://localhost:9000/mygit/resources/images/q_icon2.png");
	});
	
	$.ajax({
		url:"/mygit/faq_category.do",
		type:"GET",
		dataType:"json",
		data:{"faCategory":"관람"},
		success:function(result){
			
			
			var length=result.list.length;
			var i=0;
			var text="";
			
			$(".faqTitle").remove();
			
			for(i=0;i<length;i++){
				
				
				text+="<li class='faqTitle'>";
				text+="<span class='titleText'>";					
				text+="<img src='http://localhost:9000/mygit/resources/images/q_icon2.png' class='qIcon'>&nbsp; "+result.list[i].faTitle;						
				text+="</span>";						
				text+="<div class='faqContent'>";						
				text+="<div class='contentBox'>"+result.list[i].faContent+"</div>";
				
					text+="<div class='btnBox'>";
					if(id=="admin"){
					text+="<button type='button' class='btn_small' onclick='checkDelete(\""+result.list[i].faId+"\")'>삭제</button>";
					//text+="<button type='button' class='btn_small' onclick='location.href=\"faq_delete.do?faId="+result.list[i].faId+"\"'>삭제</button>";
					text+="<button type='button' class='btn_small' onclick='location.href=\"faq_update.do?faId="+result.list[i].faId+"\"'>수정</button>";	
					}
					text+="</div>";
				
				text+="</div></li>";

			}
			
			$("#faqBoard").append(text);						
			
		}
	});
	
	$("#faqShow").css("color","#111");
	
	$(".listBtn").click(function(){			
		$(this).css("color","#111");			
		$(".listBtn").not(this).css("color","#eee");
		
		var category={"faCategory":$(this).text()};
		
		$.ajax({
			url:"/mygit/faq_category.do",
			type:"GET",
			dataType:"json",
			data:category,
			success:function(result){
				
				
				var length=result.list.length;
				var i=0;
				var text="";
				
				$(".faqTitle").remove();
				
				for(i=0;i<length;i++){
					
					
					text+="<li class='faqTitle'>";
					text+="<span class='titleText'>";					
					text+="<img src='http://localhost:9000/mygit/resources/images/q_icon2.png' class='qIcon'>&nbsp; "+result.list[i].faTitle;						
					text+="</span>";						
					text+="<div class='faqContent'>";						
					text+="<div class='contentBox'>"+result.list[i].faContent+"</div>";				
					
						text+="<div class='btnBox'>";	
						if(id=="admin"){	
							text+="<button type='button' class='btn_small' onclick='checkDelete(\""+result.list[i].faId+"\")'>삭제</button>";
						//text+="<button type='button' class='btn_small' onclick='location.href=\"faq_delete.do?faId="+result.list[i].faId+"\"'>삭제</button>";
						text+="<button type='button' class='btn_small' onclick='location.href=\"faq_update.do?faId="+result.list[i].faId+"\"'>수정</button>";	
						}
						text+="</div>";
					
					text+="</div></li>";
				}	
				$("#faqBoard").append(text);						
				
			}
		});		
	});
});	
</script>
<script type="text/javascript">
	function checkDelete(id){
		var check=confirm("삭제하시겠습니까?")
		if(check!=0){
			location.href="faq_delete.do?faId="+id;
		}
	}
</script>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<section>
<table>

<tr>
	<td><h2>FAQ</h2></td>
	<c:if test="${id=='admin' }">
	<td><button type="button" onclick="location.href='faq_write.do'" class="btn_normal">등록</button>	
	</td></c:if>
</tr>

<tr>
	<td colspan="2"><hr><div id="smenuBtn"><span class="listBtn" id="faqShow">관람</span> |  <span class="listBtn" id="faqResv">예약</span> 
	| <span class="listBtn" id="faqPage">홈페이지</span> |  <span class="listBtn" id="faqEtc">기타</span>  </div>
	<div id="qnaBtn" onclick="location.href='qna_list.do?rpage=1'">Q & A >></div><hr style="clear:both"></td>
</tr>

<tr>
	<td colspan="2">
		<ul id=faqBoard>
		</ul>
	</td>
</tr>
</table>
</section>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>