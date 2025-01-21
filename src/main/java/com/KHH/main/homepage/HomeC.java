package com.KHH.main.homepage;

import com.KHH.main.shopSimple.ShopDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HomeC")
public class HomeC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        request.setAttribute("simpleList", ShopDAO.getSdao().ShowSimpleLists(request));
        request.setAttribute("content", "/jsp/index_content/main_contents.jsp");
        request.getRequestDispatcher("jsp/index.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}