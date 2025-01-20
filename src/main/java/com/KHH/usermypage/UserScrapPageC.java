package com.KHH.usermypage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserScrapPageC")
public class UserScrapPageC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserDataDAO.viewUserScrap(req);
        int p = Integer.parseInt(req.getParameter("p"));
        UserDataDAO.scrapPaging(p, req);
        req.setAttribute("content", "../UserScrap/userScrapPage.jsp");
        req.getRequestDispatcher("jsp/UserMyPage/sj_index.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
