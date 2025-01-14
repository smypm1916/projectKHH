<%--
  Created by IntelliJ IDEA.
  User: svyet
  Date: 2025/01/09
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원가입</title>

    <link rel="stylesheet" type="text/css" href="../../css/index.css"/>

    <!-- Daum Postalcode API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body>

<header class="header"
        style="display:flex; flex-direction:column; border: darksalmon 1px solid;">
    <h1 style="display: flex; justify-content: center">
        <a href="/HomeC">急に腹が減ってきた〜KHH~</a>
    </h1>
</header>

<h1>회원가입</h1>
<div class="main-body">
    <div class="signup-form" style="background-color:white; width: 70%; margin: auto; height:100%">

        <p>필요한 정보 입력 후에 다음 버튼을 입력해주세요.</p>
        <form action="SignUpC" method="post">
            <div>
                <br>
                <label for="name"><b>이름</b></label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>

            <div>
                <br>
                <label for="email"><b>이메일</b></label>
                <input type="text" id="email" name="email" placeholder="example@mail.com" required>
            </div>

            <div>
                <br>
                <label for="nickname"><b>닉네임</b></label>
                <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
            </div>

            <div>
                <br>
                <label for="tel">전화번호</label>
                <input type="text" id="tel" name="tel" placeholder="휴대폰 번호" required>

            </div>

            <div>
                <br>
                <input type="radio" id="gender1" name="gender" value="male" checked="checked" required="required"/>
                <label for="gender1"><b>남성</b></label>
                <input type="radio" id="gender2" name=gender value="female" required>
                <label for="gender2"><b>여성</b></label>
                <input type="radio" id="gender3" name="gender" value="other" required>
                <label for="gender3"><b>무응답</b></label>
            </div>

            <div>
                <br>
                <span><b>생년월일</b></span>
                <div>
                    <select name="birth-year" id="birth-year" required>
                        <option value="">-- --</option>
                        <script>
                            const currentYear = new Date().getFullYear();
                            const yearSelect = document.getElementById('birth-year');
                            for (let i = currentYear; i >= 1900; i--) {
                                const option = document.createElement('option');
                                option.value = i;
                                option.textContent = i;
                                yearSelect.appendChild(option);
                            }
                        </script>
                    </select>
                    <label for="birth-year">년</label>&nbsp;
                    <select name="birth-month" id="birth-month" required>
                        <option value="">-- --</option>
                        <script>
                            const monthSelect = document.getElementById('birth-month');
                            for (let i = 1; i <= 12; i++) {
                                const option = document.createElement('option');
                                option.value = i;
                                option.textContent = i;
                                monthSelect.appendChild(option);
                            }
                        </script>
                    </select>
                    <label for="birth-month">월</label>&nbsp;
                    <select name="birth-day" id="birth-day" required>
                        <option value="">-- --</option>
                        <script>
                            <%--                            날짜 검증로직 추가 필요--%>
                            const daySelect = document.getElementById('birth-day');
                            for (let i = 1; i <= 31; i++) {
                                const option = document.createElement('option');
                                option.value = i;
                                option.textContent = i;
                                daySelect.appendChild(option);
                            }
                        </script>
                    </select>
                    <label for="birth-day">일</label>&nbsp;
                    <p>*** 한번 입력하면 수정할 수 없습니다. ***</p>
                </div>
            </div>

            <div>
                <br>
                <label for="address"><b>주소</b></label>
                <input type="text" id="address" name="address" required>
                <button onclick="openPostalCode()">
                    우편번호 찾기
                </button>
                </input>
            </div>

            <div>
                <br>
                <label for="password"><b>비밀번호</b></label>
                <input type="text" id="password" name="password" placeholder="영문+숫자 8~16자 이내" required>
                <br><br>
                <label for="passwordCheck"><b>비밀번호 확인</b></label>
                <input type="text" id="passwordCheck" name="passwordCheck" placeholder="한번 더 입력해주세요" required>
            </div>

            <div style="display: flex; justify-content: center;" class="btn-wrapper"
                 style="text-align: center; display: flex; flex-direction: row; justify-content: space-between; width: 100%; max-width: 520px; margin: 50px auto 0;">
                <br>
                <button type="submit"
                        style="border-radius: 20%; width:50px; height: 20px; display: flex; flex-wrap: wrap; flex-direction: row"
                        class="util-btn"
                        name="submit" onclick="">회원가입
                    <br>
                    <a href="HomeC" class="util-btn">돌아가기</a>
                </button>
            </div>
        </form>
    </div>
</div>
<script src="../../js/signup.js"></script>
</body>
</html>
