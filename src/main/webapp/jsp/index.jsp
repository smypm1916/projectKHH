<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>急に腹が減ってきた〜</title>
    <link rel="stylesheet" type="text/css" href="../css/index_ver0.2.css?v=1.0">
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css' />">--%>
</head>

<body>

<%--메인페이지--%>
<div class="main-body">

    <%--    헤더--%>
    <header class="header">
        <div class="title">
            <h1><a href="/HomeC">急に腹が減ってきた~~KHH~~</a></h1>
        </div>
    </header>
    <%--        내비게이션바--%>
    <div class="global-nav">
        <ul class="nav-content">
            <li><a href="">| icon |</a></li>
            <li><a href="">| 가게정보 |</a></li>
            <li><a href="">| 커뮤니티 |</a></li>
            <li><a href="">| 마이페이지 |</a></li>
            <li>
                <button onclick="location.href=''"> 로그인</button>
            </li>
            <li>
                <button onclick="location.href='/jsp/register/choose_userType.jsp'">회원가입</button>
            </li>
        </ul>
    </div>


    <%--    메인 콘텐츠--%>
    <section class="content" style="border: darksalmon 1px solid; border-radius: 10px;">

        <%--        지도 & 가게 페이지--%>
        <div style="position: relative">
            <br>
            <jsp:include page="${content}"/>
        </div>

        <%--공지사항--%>
        <div class="announcement">
            <h2>공지사항</h2>
            <ul>
                공지 리스트...
            </ul>
        </div>

        <%--        슬라이드1--%>
        <div class="slide1 container" style="border: darksalmon 1px solid; border-radius: 10px">
            <div class="slide1 content">
                <%--                店のランキング（仮）--%>
                <p>추천 가게</p>
            </div>
        </div>

        <%--        슬라이드2--%>
        <div class="slide2 container" style="border: darksalmon 1px solid; border-radius: 10px">
            <div class="slide2 content">
                <%--                広告のランキング（仮）--%>
                <p>좋아요 랭킹</p>
            </div>
        </div>

        <div class="fixed-nav" style="display: block; flex-direction: row-reverse">
            <div class="btn-page-top" style="display: block"></div>
            <span style="width: 50px; height: 50px; background-size: 50px; cursor:pointer;"
                  onclick="window.scrollTo(0,0);">위로 돌아가기</span>
        </div>
    </section>

    <%--        푸터--%>
    <div class="footer">
        <h2>footer</h2>
    </div>
</div>

<script>

</script>

</body>
</html>