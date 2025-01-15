package com.KHH.usermypage;

import java.io.IOException;
import java.rmi.ServerException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileUpdateController")
public class ProfileUpdateController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        request.setAttribute("content", "jsp/userMyPage/UpdatedUserMyPage.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);



        // 변경하고, 변경된 것 보여주기 (mypage view)
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDataDAO.userProfileUpdate(request);

        response.sendRedirect("HomeController?no=" + request.getParameter(user));
    }
}