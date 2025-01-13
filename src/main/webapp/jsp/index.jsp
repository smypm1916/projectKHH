<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>急に腹が減ってきた〜</title>
    <link rel="stylesheet" type="text/css" href="../css/index.css?v=1.0">
    <%--    <link rel="stylesheet" type="text/css" href="<c:url value='/css/index.css' />">--%>
</head>

<body>

<%--메인페이지--%>
<div class="main-body">

    <%--    헤더--%>
    <header class="header">
        <h1><a href="/HomeC">急に腹が減ってきた~~KHH~~</a></h1>

        <%--        내비게이션바--%>
        <div class="global-nav">
            <ul class="nav-content"
                style="display: flex; flex-wrap: wrap; z-index: 100; flex-direction: row; align-items: center; text-align: center; justify-content: space-around;">
                <li style="display: block"><a href="">| icon |</a></li>
                <li style="display: block"><a href="">| 가게정보 |</a></li>
                <li style="display: block"><a href="">| 커뮤니티 |</a></li>
                <li style="display: block"><a href="">| 마이페이지 |</a></li>
                <li style="display: block">
                    <button onclick="location.href=''"> 로그인</button>
                </li>

                <li style="display: block">
                    <button onclick="location.href='/jsp/register/user_signUp.jsp'">회원가입</button>
                </li>
            </ul>
        </div>
    </header>


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
                <p>slide1</p>
            </div>
        </div>

        <%--        슬라이드2--%>
        <div class="slide2 container" style="border: darksalmon 1px solid; border-radius: 10px">
            <div class="slide2 content">
                <%--                広告のランキング（仮）--%>
                <p>slide2</p>
            </div>
        </div>
    </section>

    <%--        푸터--%>
    <div class="footer" style="border: darksalmon 1px solid; border-radius: 10px">
        <h2>footer</h2>
    </div>
</div>

<script>

</script>

</body>
</html>