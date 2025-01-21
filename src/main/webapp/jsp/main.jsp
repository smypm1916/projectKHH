<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/main.css">
</head>
<body>
<div class="header-container">
    <header>
        <img alt="" src="../image/logo_header.png">
    </header>
    <nav>
        <ul>
            <li><a href="#">맛집 소개</a></li>
            <li><a href="RankingListController">이달의 맛집</a></li>
            <li><a href="CommunityListController">커뮤니티</a></li>
            <li><a href="#">로그인</a></li>
        </ul>
    </nav>
</div>
<div class="content">
    <jsp:include page="${content }"></jsp:include>
</div>
<div class="footer">
    footer
</div>
</body>
</html>
