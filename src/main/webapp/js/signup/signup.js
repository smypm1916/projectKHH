// 출생연도, 월, 일 로직
const yearSelect = document.getElementById('birth-year');
const monthSelect = document.getElementById('birth-month');
const daySelect = document.getElementById('birth-day');

// 현재 연도 기준으로 연도 목록 추가
const currentYear = new Date().getFullYear();
for (let year = currentYear; year >= 1920; year--) {
    const option = document.createElement('option');
    option.value = year;
    option.textContent = year;
    yearSelect.appendChild(option);
}

// 월 목록 추가
for (let month = 1; month <= 12; month++) {
    const option = document.createElement('option');
    option.value = month;
    option.textContent = month;
    monthSelect.appendChild(option);
}

// 일 목록 갱신 로직
function updateDays() {
    const year = parseInt(yearSelect.value, 10);
    const month = parseInt(monthSelect.value, 10);

    // 월과 연도가 모두 선택된 경우에만 실행
    if (isNaN(year) || isNaN(month)) {
        daySelect.innerHTML = '<option value="">-- --</option>'; // 초기화
        return;
    }

    // 선택된 연도와 월에 따라 마지막 날짜 계산
    const lastDay = new Date(year, month, 0).getDate();

    // 기존 일 목록 제거
    daySelect.innerHTML = '<option value="">-- --</option>';

    // 새로운 일 목록 추가
    for (let day = 1; day <= lastDay; day++) {
        const option = document.createElement('option');
        option.value = day;
        option.textContent = day;
        daySelect.appendChild(option);
    }
}

// 연도 또는 월 변경 시 일 목록 업데이트
yearSelect.addEventListener('change', updateDays);
monthSelect.addEventListener('change', updateDays);

// 페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', () => {
    updateDays(); // 초기 로드 시 일 목록 초기화
});

document.addEventListener('DOMContentLoaded', () => {
    const customerRadio = document.getElementById('user-type-customer');
    const ownerRadio = document.getElementById('user-type-owner');
    const ownerFields = document.getElementById('owner-fields');

    // 이벤트 리스너 추가
    customerRadio.addEventListener('change', () => {
        ownerFields.style.display = 'none';
    });

    ownerRadio.addEventListener('change', () => {
        ownerFields.style.display = 'block';
    });
});

document.querySelectorAll(".signup-form button").forEach(button => {
    button.addEventListener("click", function (event) {
        event.preventDefault();

        // 연결된 입력 필드 찾기
        const input = button.previousElementSibling;
        if (!input || !input.value) {
            console.error("입력 필드가 올바르지 않습니다.");
            return;
        }

        // 입력 필드 타입 확인
        const type = input.id === "email-domain" ? "email" : "nickname";
        let value = input.value;

        // 이메일 타입인 경우 이메일 서비스 추가
        if (type === "email") {
            const emailService = document.getElementById("email-service");
            if (!emailService) {
                console.error("이메일 서비스 선택 필드가 없습니다.");
                return;
            }
            value += "@" + emailService.value;
        }

        fetch("/checkDuplicateC", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: `type=${encodeURIComponent(type)}&value=${encodeURIComponent(value)}`
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("서버 응답 오류");
                }
                return response.json();
            })
            .then(data => {
                const message = button.nextElementSibling;
                if (!message) {
                    console.error("메시지 표시 요소가 없습니다.");
                    return;
                }

                if (data.exists) {
                    message.textContent = `이미 존재하는 ${type === "email" ? "이메일" : "닉네임"}입니다.`;
                    message.style.color = "red";
                } else {
                    message.textContent = `사용 가능한 ${type === "email" ? "이메일" : "닉네임"}입니다.`;
                    message.style.color = "green";
                }
                message.style.display = "inline";
            })
            .catch(error => {
                console.error("API 요청 오류:", error);
                alert("오류가 발생했습니다. 나중에 다시 시도해주세요.");
            });
    });
});

document.querySelector("form").addEventListener("submit", function (event) {
    const name = document.querySelector("input[name='name']").value;
    const email = document.querySelector("input[name='email']").value;

    if (!name || !email) {
        event.preventDefault(); // 폼 제출 막기
        alert("모든 필드를 입력해주세요.");
    }
});
$(document).ready(function () {
    const $passwordInput = $("#password");
    const $passwordCheckInput = $("#passwordCheck");
    const $passwordMessage = $("<span style='color: red;'></span>");
    const $passwordCheckMessage = $("<span style='color: red;'></span>");
    let isPasswordCheckActive = false; // 비밀번호 확인 입력이 시작되었는지 여부

    // 비밀번호 메시지를 비밀번호 입력 필드 아래에 추가
    $passwordInput.parent().append($passwordMessage);
    $passwordCheckInput.parent().append($passwordCheckMessage);

    // 비밀번호 유효성 검사 함수
    function validatePassword() {
        const password = $passwordInput.val();
        const regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/; // 영문+숫자 8~16자리

        if (!regex.test(password)) {
            $passwordMessage.text("비밀번호는 영문과 숫자를 포함한 8~16자리여야 합니다.");
            return false;
        } else {
            $passwordMessage.text("");
            $passwordInput[0].setCustomValidity("");
            return true;
        }
    }

    // 비밀번호 확인 유효성 검사 함수
    function validatePasswordMatch() {
        const password = $passwordInput.val();
        const passwordCheck = $passwordCheckInput.val();

        if (passwordCheck === "") {
            // 비밀번호 확인 입력란이 비어있으면 메시지 숨김
            $passwordCheckMessage.text("");
            $passwordCheckInput[0].setCustomValidity("");
        } else if (password !== passwordCheck) {
            // 비밀번호가 일치하지 않으면 메시지 표시
            $passwordCheckMessage.text("비밀번호가 일치하지 않습니다.");
            $passwordCheckInput[0].setCustomValidity("비밀번호가 일치하지 않습니다.");
        } else {
            // 비밀번호가 일치하면 메시지 숨김
            $passwordCheckMessage.text("");
            $passwordCheckInput[0].setCustomValidity("");
        }
    }

    // 비밀번호 확인 필드에 입력이 시작되었을 때 플래그 활성화
    $passwordCheckInput.on("focus", function () {
        isPasswordCheckActive = true; // 입력이 시작되었음을 표시
        validatePasswordMatch(); // 바로 검증
    });

    // 비밀번호 입력 및 확인 필드에 이벤트 리스너 추가
    $passwordInput.on("input", function () {
        validatePassword(); // 비밀번호 유효성 검사
        if (isPasswordCheckActive) {
            validatePasswordMatch(); // 비밀번호 확인도 함께 검사
        }
    });

    $passwordCheckInput.on("input", validatePasswordMatch);

    // 폼 제출 시 최종 확인
    $("form").on("submit", function (event) {
        if (!validatePassword()) {
            event.preventDefault(); // 폼 제출 막기
            alert("비밀번호 조건을 충족하지 못했습니다.");
        } else if ($passwordInput.val() !== $passwordCheckInput.val()) {
            event.preventDefault();
            alert("비밀번호가 일치하지 않습니다.");
        }
    });
});
