package com.KHH.main.signUp;

import java.io.IOException;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUpC")
public class SignUpC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        if (Objects.equals(request.getParameter("userType"), "user")) {
            SignUpDAO.getSDAO().UserSignUp(request, response);
        } else {
            SignUpDAO.getSDAO().OwnerSignUp(request, response);
        }

        request.getRequestDispatcher("jsp/signup/user_signUpComplete.jsp").forward(request, response);
    }
}