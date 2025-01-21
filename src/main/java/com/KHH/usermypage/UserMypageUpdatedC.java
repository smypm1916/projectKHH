package com.KHH.usermypage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserMypageUpdatedC")
public class UserMypageUpdatedC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 임시 로그인 데이터 생성할 곳.
        UserDataDAO.viewUserData(req);
        UserDataDAO.viewUserReviews(req);
        UserDataDAO.viewUserReservation(req);
       UserDataDAO.viewUserScrap(req);

        req.setAttribute("content", "updatedSuccessUserMyPage.jsp");
        req.getRequestDispatcher("jsp/UserMyPage/sj_index.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
