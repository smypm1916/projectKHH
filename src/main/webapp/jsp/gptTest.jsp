<div class="calendar-container">
  <h3>2025년 달력</h3>
  <div class="calendar-slider">
    <div class="calendar-months">
      <!-- JavaScript로 동적으로 채워질 부분 -->
    </div>
    <div class="nav-buttons">
      <button onclick="prevSlide()">이전 달</button>
      <button onclick="nextSlide()">다음 달</button>
    </div>
  </div>
</div>

<script>
  const monthsData = [
    { name: "1월", days: 31 },
    { name: "2월", days: 28 }, // 윤년 처리는 필요 시 추가 가능
    { name: "3월", days: 31 },
    { name: "4월", days: 30 },
    { name: "5월", days: 31 },
    { name: "6월", days: 30 },
    { name: "7월", days: 31 },
    { name: "8월", days: 31 },
    { name: "9월", days: 30 },
    { name: "10월", days: 31 },
    { name: "11월", days: 30 },
    { name: "12월", days: 31 },
  ];

  const calendarMonths = document.querySelector(".calendar-months");
  let currentMonthIndex = 0;

  function generateCalendar() {
    monthsData.forEach((month, index) => {
      const monthDiv = document.createElement("div");
      monthDiv.classList.add("month");
      if (index !== 0) monthDiv.style.display = "none"; // 첫 번째 달만 보이도록 설정

      const header = document.createElement("h4");
      header.textContent = month.name;

      const grid = document.createElement("div");
      grid.classList.add("calendar");

      // 요일 헤더 추가
      ["일", "월", "화", "수", "목", "금", "토"].forEach(day => {
        const dayHeader = document.createElement("div");
        dayHeader.textContent = day;
        dayHeader.classList.add("day-header");
        grid.appendChild(dayHeader);
      });

      // 첫 번째 날짜의 요일 계산
      const firstDay = new Date(2025, index, 1).getDay(); // 2025년 index월 1일의 요일 (0: 일요일, 6: 토요일)

      // 빈 칸 추가
      for (let i = 0; i < firstDay; i++) {
        const emptyDiv = document.createElement("div");
        grid.appendChild(emptyDiv);
      }

      // 날짜 추가
      for (let i = 1; i <= month.days; i++) {
        const dayDiv = document.createElement("div");
        dayDiv.textContent = i;
        dayDiv.classList.add("day");
        grid.appendChild(dayDiv);
      }

      // 6주 (42일) 칸 맞추기
      const totalDays = month.days + firstDay;
      const remainingDays = 42 - totalDays;
      for (let i = 0; i < remainingDays; i++) {
        const emptyDiv = document.createElement("div");
        grid.appendChild(emptyDiv);
      }

      monthDiv.appendChild(header);
      monthDiv.appendChild(grid);
      calendarMonths.appendChild(monthDiv);
    });
  }

  function updateSlide() {
    const months = document.querySelectorAll(".month");
    months.forEach((month, index) => {
      month.style.display = index === currentMonthIndex ? "block" : "none";
    });
  }

  function prevSlide() {
    if (currentMonthIndex > 0) {
      currentMonthIndex--;
      updateSlide();
    }
  }

  function nextSlide() {
    if (currentMonthIndex < 11) {
      currentMonthIndex++;
      updateSlide();
    }
  }

  generateCalendar();
</script>

<style>
  .calendar-container {
    margin: 20px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
    background-color: #f9f9f9;
  }

  .calendar-slider {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .calendar-months {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .calendar {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 5px;
    width: 100%;
    max-width: 400px;
    text-align: center;
  }

  .calendar div {
    padding: 10px 0;
    border-radius: 5px;
  }

  .calendar .day-header {
    font-weight: bold;
    background-color: #007bff;
    color: white;
  }

  .calendar .day {
    border: 1px solid #ddd;
    background-color: #f1f1f1;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .calendar .day:hover {
    background-color: #e0e0e0;
  }

  .nav-buttons {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    gap: 10px;
  }

  .nav-buttons button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .nav-buttons button:hover {
    background-color: #0056b3;
  }
</style>
