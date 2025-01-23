package com.KHH.signUp;

import java.io.IOException;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChooseTypeC")
public class
ChooseTypeC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userType = "user";

        if (userType.equals(request.getParameter("userType"))) {
            request.getRequestDispatcher("/jsp/signup/user_signUp.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/jsp/signup/owner_signUp.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}