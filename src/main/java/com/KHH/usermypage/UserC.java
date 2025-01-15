package com.KHH.usermypage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserC")
public class UserC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 임시 로그인 데이터 생성할 곳.
        UserDataDTO dto = new UserDataDTO();
        dto.setUser_grade("test@naver.com");
        dto.setUser_nickname("jojo");
        dto.setUser_picture("aa.jpg");
        dto.setUser_grade("a");
        req.getSession().setAttribute("user", dto);

        req.setAttribute("content", "userMyPage.jsp");
        req.getRequestDispatcher("jsp/UserMyPage/sj_index.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
