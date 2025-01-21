<%--
  Created by IntelliJ IDEA.
  User: MiNN
  Date: 2025-01-20(월)
  Time: 오후 1:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title> ID / PW 찾기 | KHH </title>
  </head>
  <body>
  <h2>아이디 / 비밀번호 찾기</h2>
    <form action="ForgotInfoC" method="post" id="idSearch">
      <label for="idMail"> 사용자 메일 : </label>
      <input class="idInfo" id="idMail" name="idMail" type="email" required />
      <br>
      <label for="idName"> 사용자 이름 : </label>
      <input class="idInfo" id="idName" name="idName" required />
      <br>
      <input type="submit" value="아이디 찾기"/>
    </form>

      <hr>

    <form action="ForgotInfoC" method="post" id="pwSearch">
      <label for="pwId">사용자 ID :</label>
      <input class="pwInfo" id="pwId" name="pwId" required />
      <br>
      <label for="pwMail">사용자 메일 :</label>
      <input class="pwInfo" id="pwMail" name="pwMail" required />
      <br>
      <label for="pwName">사용자 이름 :</label>
      <input class="pwInfo" id="pwName" name="pwName" required />
      <br><br>
      <input type="submit" value="비밀번호 찾기"/>
    </form>

    <p>
      조회 결과 : ${info.result}
    </p>

  </body>
</html>
