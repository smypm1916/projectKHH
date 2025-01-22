<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div class="header-container">
    <header>
        <a href="HomeC"><img alt="" src="../image/logo_header.png"></a>
    </header>
    <nav>
        <ul>
            <li><a href="#">맛집 소개</a></li>
            <li><a href="RankingListController">이달의 맛집</a></li>
            <li><a href="CommunityListController">커뮤니티</a></li>
            <li><a href="LoginC">로그인</a></li>
        </ul>
    </nav>
</div>
<div class="content">
    <jsp:include page="${content }"></jsp:include>
</div>
<div class="fixed-nav">
    <div class="btn-page-top"></div>
    <span class="btn-page-top-span" onclick="window.scrollTo(0,0);">TOP</span>
</div>
<div class="footer">
    footer
</div>
</body>
</html>
