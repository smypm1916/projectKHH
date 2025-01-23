<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css?v=1.0">
</head>
<body>
<div class="header-container">
    <header>
        <a href="HomeC"><img alt="" src="../image/logo_header.png"></a>
    </header>
    <nav>
        <ul>
            <li><a href="ShopC">맛집 소개</a></li>
            <%--<li><a href="RankingListController">이달의 맛집</a></li>--%>
            <li><a href="CommunityListController">커뮤니티</a></li>
            <li><a href="LoginC">로그인</a></li>
            <li><a href="UserC">마이 페이지(유저)</a></li>
            <li><a href="ShowOwnerMyPageController">마이 페이지(점주)</a></li>
            <%--            <li><a href="/LogoutC">로그아웃</a></li>--%>
        </ul>
    </nav>
</div>

<div class="content">
    <jsp:include page="${content }"/>
</div>

<div class="fixed-nav">
    <div class="btn-page-top"></div>
    <span class="btn-page-top-span" onclick="window.scrollTo(0,0);">TOP</span>
</div>

<footer style="background-color: #f8f8f8; padding: 20px; text-align: center;">
    <div class="footer-content">
        <!-- 로고 및 설명 -->
        <div class="footer-logo">
            <img alt="" src="../image/logo_header.png" style="width: 80px; height:80px;">
            <p>グルメの都、北海道へようこそ</p>
        </div>

        <!-- 네비게이션 -->
        <div class="footer-links">
            <a href="">프로젝트 소개</a> |
            <a href="">이용 약관</a> |
            <a href="">개인정보 처리방침</a>
        </div>

        <!-- 소셜 미디어 -->
        <div class="footer-social">
            <a href="" target="_blank">Facebook</a>
            <a href="" target="_blank">Twitter</a>
            <a href="" target="_blank">Instagram</a>
        </div>

        <!-- 저작권 -->
        <div class="footer-copyright">
            <p>© 2025 MyCompany. All Rights Reserved.</p>
        </div>
    </div>
</footer>

</body>
</html>
