<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국립현대미술관에 오신 것을 환영합니다.</title>

    <link rel="stylesheet" type="text/css" href="http://localhost:9000/mygit/resources/css/style.css">
   <script src="http://localhost:9000/mygit/resources/js/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.navbar_view').mouseover(function(){
                $('#navbar_view_detail').css('display','block');
                $('.navbar_content').not('#navbar_view_detail').css('display','none');
                $('.navbar').css('padding-bottom','70px')
            });

            $('.navbar_exhibition').mouseover(function(){
                $('#navbar_exhibition_detail').css('display','block');
                $('.navbar_content').not('#navbar_exhibition_detail').css('display','none');
                $('.navbar').css('padding-bottom','70px')
            });

            $('.navbar_digital').mouseover(function(){
                $('#navbar_digital_detail').css('display','block');
                $('.navbar_content').not('#navbar_digital_detail').css('display','none');
                $('.navbar').css('padding-bottom','70px')
            });
            $('.navbar_reservation').mouseover(function(){
                $('#navbar_reservation_detail').css('display','block');
                $('.navbar_content').not('#navbar_reservation_detail').css('display','none');
                $('.navbar').css('padding-bottom','70px')
            });

            $('.navbar').mouseleave(function(){
                $('.navbar_content').css('display','none');
                $('.navbar').css('padding-bottom','0px')
            });
        });

    </script>
    <title>Document</title>
</head>
<body>
    <nav class="navbar">
        <div class="navbar_logo">
            <a href="http://localhost:9000/mygit/index.do"><img src="http://localhost:9000/mygit/resources/images/logo.png" width="270px"></a>
        </div>

        <ul class="navbar_menu">
            <li class="navbar_menuBtn">
                <span href="/mygit/comment_list.do?rpage=1" class="navbar_view">관람·참여</span>
                <div class="navbar_content" id="navbar_view_detail">
                    <a href="/mygit/notice_list.do?rpage=1">공지</a>
                    <a href="/mygit/comment_list.do?rpage=1">관람후기</a>
                    <a href="/mygit/faq_list.do">FAQ</a>
                    <a href="/mygit/qna_list.do?rpage=1">Q&A</a>
                </div>
            </li>
            <li>
                <span href="/mygit/off_now.do" class="navbar_exhibition">전시</span>
                <div class="navbar_content" id="navbar_exhibition_detail">
                    <a href="/mygit/off_now.do?rpage=1">현재전시</a>
                    <a href="/mygit/off_future.do">예정전시</a>
                    <a href="/mygit/off_past.do">과거전시</a>
                </div>
            </li>
            <li>
                <span href="/mygit/online/on_show.do" class="navbar_digital">디지털미술관</span>
                <div class="navbar_content" id="navbar_digital_detail">
                    <a href="/mygit/online/on_show.do">온라인전시</a>
                    <a href="/mygit/online/collectionList.do?rpage=1">소장품</a>
                    <a href="/mygit/online/digitalMovList.do?rpage=1">온라인컨텐츠</a>
                    <a href="/mygit/usergal/usergal_list.do">이용자갤러리</a>
                </div>
            </li>
            <li>
                <span href="mygit/reservation.do" class="navbar_reservation">예약</span>
                <div class="navbar_content" id="navbar_reservation_detail">
                    <a href="/mygit/reservation.do">예약하기</a>
                    <a href="/mygit/reservation_check.do">예약확인</a>
                </div>
            </li> 
        </ul>
		<c:choose>
				<c:when test="${sessionScope.id == 'admin' }">
        <ul class="navbar_links">
            <li><span onclick="location.href='http://localhost:9000/mygit/logout.do'">로그아웃</span></li>
            <li><span onclick="location.href='http://localhost:9000/mygit/sitemap.do'">사이트맵</span></li>
            <li><span onclick="location.href='http://localhost:9000/mygit/admin.do'">admin</span></li>
        </ul>
        </c:when>
        <c:when test="${sessionScope.id != null }">
         <ul class="navbar_links">
         	<li><span onclick="location.href='#'">${sessionScope.id } 님 환영합니다.</span></li>        
            <li><span onclick="location.href='http://localhost:9000/mygit/logout.do'">로그아웃</span></li>          
            <li><span onclick="location.href='http://localhost:9000/mygit/sitemap.do'">사이트맵</span></li>
        </ul>
        </c:when>
        <c:otherwise>
         <ul class="navbar_links">
            <li><span onclick="location.href='http://localhost:9000/mygit/login.do'">로그인</span></li>
            <li><span onclick="location.href='http://localhost:9000/mygit/join.do'">회원가입</span></li>
            <li><span onclick="location.href='http://localhost:9000/mygit/sitemap.do'">사이트맵</span></li>
        </ul>
        </c:otherwise>
        </c:choose>
    </nav>
</body>
</html>