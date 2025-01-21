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
    if (isNaN(year) || isNaN(month)) return;

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

// 우편번호 api
function openPostalCode() {
    new daum.Postcode({
        oncomplete: function (data) {
        }
    }).open();
}

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
