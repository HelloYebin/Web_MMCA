/**
 * 
 */
 
$(document).ready(function() {
	$("#reset").click(function() {
		$(location).attr('href', 'member_list.do');
	});
	
	$(".row").click(function() {
		var id = $(this).children('.id').text();
		$.ajax({
			url:"member_info.do?id="+id,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(info) {
				var info = JSON.parse(info);
		
		var meminfo = "<div id='meminfo_bg'>";
				meminfo += "<div id='meminfo_sc'>";
				meminfo += "<h3>회원정보</h3>";
				meminfo += "<br><br>";
					meminfo += "<div>";
						meminfo += "<table border=1>";
							meminfo += "<tr>";
								meminfo += "<th>이름";
								meminfo += "<td>"+info.name;
								meminfo += "<th>성별";
								meminfo += "<td>"+info.gender;
							meminfo += "</tr>";
							meminfo += "<tr>";
								meminfo += "<th>ID";
								meminfo += "<td>"+info.id;
								meminfo += "<th>PW";
								meminfo += "<td>"+info.pw;
							meminfo += "</tr>";
							meminfo += "<tr>";
								meminfo += "<th>E-mail";
								meminfo += "<td>"+info.email;
								meminfo += "<th>전화번호";
								meminfo += "<td>"+info.phone;
							meminfo += "</tr>";
							meminfo += "<tr>";
								meminfo += "<th>가입일";
								meminfo += "<td colspan='3'>"+info.joindate;
							meminfo += "</tr>";
						meminfo += "</table>";
					meminfo += "</div>";
				meminfo += "<br><br>";
				meminfo += "<h3>예약 내역</h3>";
				meminfo += "<br><br>";
					meminfo += "<div class='history'>";
						meminfo += "<table border=1>";
							meminfo += "<tr>";
								meminfo += "<th>전시명";
								meminfo += "<th>일자";
								meminfo += "<th>시간";
								meminfo += "<th>인원";
							meminfo += "</tr>";
						for(var i in info.jlist0) {
							meminfo += "<tr>";
								meminfo += "<td>"+info.jlist0[i].rtitle;
								meminfo += "<td>"+info.jlist0[i].rdate;
								meminfo += "<td>"+info.jlist0[i].rtime;
								meminfo += "<td>"+info.jlist0[i].rnum;
							meminfo += "</tr>";
						}
						meminfo += "</table>";
					meminfo += "</div>";
				meminfo += "<br><br>";
				meminfo += "<h3>방문 내역</h3>";
				meminfo += "<br><br>";
					meminfo += "<div class='history'>";
						meminfo += "<table border=1>";
							meminfo += "<tr>";
								meminfo += "<th>전시명";
								meminfo += "<th>일자";
								meminfo += "<th>시간";
								meminfo += "<th>인원";
							meminfo += "</tr>";
						for(var i in info.jlist1) {
							meminfo += "<tr>";
								meminfo += "<td>"+info.jlist1[i].rtitle;
								meminfo += "<td>"+info.jlist1[i].rdate;
								meminfo += "<td>"+info.jlist1[i].rtime;
								meminfo += "<td>"+info.jlist1[i].rnum;
							meminfo += "</tr>";
						}
						meminfo += "</table>";
					meminfo += "</div>";
					meminfo += "<br><br><br>";
					meminfo += "<div>";
						meminfo += "<button type='button' id='meminfo_close'>닫기</button>";
					meminfo += "</div>";
				meminfo += "</div>";
			meminfo += "</div>";
			
			$('body').append(meminfo);
	
			$('#meminfo_close').click(function() {
				$('#meminfo_bg').remove();
			});
			
			}});
		});
	});