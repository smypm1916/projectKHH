<%--
  Created by IntelliJ IDEA.
  User: dutch
  Date: 1/17/2025
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <select id="start-hour-select"></select>
  <select id="start-minute-select"></select>
  ~
  <select id="end-hour-select"></select>
  <select id="end-minute-select"></select>

  <script>
      const startHourSelect = document.getElementById("start-hour-select");
      for (let i = 1; i <= 24; i++) {
          const option = document.createElement("option");
          option.value = i;
          option.textContent = i + "시";
          startHourSelect.appendChild(option);
      }

      const startMinuteSelect = document.getElementById("start-minute-select");
      for (let i = 5; i < 60; i += 5) {
          const option = document.createElement("option");
          option.value = i;
          option.textContent = i + "분";
          startMinuteSelect.appendChild(option);
      }
      const endHourSelect = document.getElementById("end-hour-select");
      for (let i = 1; i <= 24; i++) {
          const option = document.createElement("option");
          option.value = i;
          option.textContent = i + "시";
          endHourSelect.appendChild(option);
      }

      const endMinuteSelect = document.getElementById("end-minute-select");
      for (let i = 5; i < 60; i += 5) {
          const option = document.createElement("option");
          option.value = i;
          option.textContent = i + "분";
          endMinuteSelect.appendChild(option);
      }
  </script>
  </body>
</html>
