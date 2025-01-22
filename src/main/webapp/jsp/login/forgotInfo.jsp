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
    <link rel="stylesheet" type="text/css" href="../../css/forgot.css">
  </head>
  <div>
  <h2>아이디 / 비밀번호 찾기</h2>
    <form action="ForgotInfoC" method="post" id="idSearch">
      <div class="forgot_mail_mailInput">
      <div class="forgot_mail_nameLabel"><label for="idName"> 사용자 이름 </label></div>
      <input class="idInfo" id="idName" name="idName" required />
      </div>

      <div class="forgot_mail_NicknameInput">
      <div class="forgot_mail_NicknameLabel"><label for="idNickName"> 사용자 닉네임 </label></div>
      <input class="idInfo" id="idNickName" name="idNickName" required />
      </div>

      <div class="forgot_mail_submit">
      <input type="submit" value="이메일 찾기"/>
      </div>
    </form>

      <hr>

    <form action="ForgotInfoC" method="post" id="pwSearch">
      <%--<div>
      <label for="pwId">사용자 ID :</label>
      <input class="pwInfo" id="pwId" name="pwId" required />
      </div>--%>

      <div class="forgot_pw_mailInput">
      <div class="forgot_pw_mailLabel"><label for="pwMail">사용자 메일 </label></div>
      <input class="pwInfo" id="pwMail" name="pwMail" type="email" required />
      </div>

      <div class="forgot_pw_nameInput">
      <div class="forgot_pw_nameLabel"><label for="pwName">사용자 이름 </label></div>
      <input class="pwInfo" id="pwName" name="pwName" required />
      </div>

      <div class="forgot_pw_submit">
      <input type="submit" value="비밀번호 찾기"/>
      </div>
    </form>

    <div class="forgot_result">
    <p>
      조회 결과 : ${info.result}
    </p>
    </div>

  </body>
</html>
