package com.KHH.login;

import javax.servlet.http.HttpServletRequest;

public class InfoDAO {
    public static void infoSearch(HttpServletRequest request) {

        String idMail;
        idMail = request.getParameter("idMail");
        String idName;
        idName = request.getParameter("idName");
        String pwId;
        pwId = request.getParameter("pwId");
        String pwName;
        pwName = request.getParameter("pwName");
        String pwMail;
        pwMail = request.getParameter("pwMail");


        if (idMail != null){
            System.out.println("ID 찾기 중");
            System.out.println(idMail+" "+idName);
        }   else {
            System.out.println("PASSWORD 찾기 중");
            System.out.println(pwId+" "+pwName+" "+pwMail);
        }


    }
}
