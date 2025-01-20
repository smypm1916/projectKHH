package com.KHH.usermypage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserReservationPageC")
public class UserReservationPageC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserDataDAO.viewUserReservation(req);
        int p = Integer.parseInt(req.getParameter("p"));
        UserDataDAO.reservationPaging(p, req);
        req.setAttribute("content", "../UserReservation/userReservationPage.jsp");
        req.getRequestDispatcher("jsp/UserMyPage/sj_index.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
