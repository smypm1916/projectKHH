<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>急に腹が減ってきた〜</title>
    <link rel="stylesheet" href="css/index.css">

</head>
<body>

<%--메인페이지 바디--%>
<div class="main-body">

    <%--    헤더--%>
    <%--    <div class="header" style="border: darksalmon 1px solid; border-radius: 10px">--%>
    <%--        <h1>急に腹が減ってきた〜</h1>--%>
    <%--    </div>--%>
    <header class="header"
            style="display:flex; flex-direction:column; border: darksalmon 1px solid;">
        <h1 style="display: flex; justify-content: center"><a href="HomeC">急に腹が減ってきた〜KHH~</a></h1>
    </header>


    <%--    메뉴바--%>
    <div class="menu-bar"
         style="border: darksalmon 1px solid; border-radius: 10px; background-color: rgba(244,243,236,0.8); margin:0; padding:0; flex-direction: column">
        <ul class="menu-content"
            style="display: flex; flex-wrap: wrap; position:absolute; z-index: 100">
            <li style="display: block">icon</li>
            <li style="display: block">가게정보</li>
            <li style="display: block">커뮤니티</li>
            <form action="SignInC" method="POST">
                <li style="display: block">
                    <input type="text" name="id" placeholder="id">
                    &nbsp;
                    <input type="password" placeholder="pw">
                    <button onclick="">로그인</button>
                </li>
            </form>
            <li><a href="UserRegisterC">회원가입</a></li>
        </ul>
    </div>

    <%--    메인 콘텐츠--%>
    <div class="content" style="border: darksalmon 1px solid; border-radius: 10px">
        <div>
            <%--            <jsp:include page="${content}"/>--%>
            <h3>contents</h3>
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
    </div>

    <%--        푸터--%>
    <div class="footer" style="border: darksalmon 1px solid; border-radius: 10px">
        <h2>footer</h2>
    </div>
</div>

<script>

</script>

</body>
</html>