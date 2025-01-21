package com.KHH.login;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InfoDAO {

    public static final InfoDAO IDAO = new InfoDAO();
    static Connection con = null;

    private InfoDAO() {
        try {
            con = DBManager.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void infoSearch(HttpServletRequest request) {

        String idMail, idName, pwId, pwName, pwMail;
        idMail = request.getParameter("idMail");
        idName = request.getParameter("idName");
        pwId = request.getParameter("pwId");
        pwName = request.getParameter("pwName");
        pwMail = request.getParameter("pwMail");

        boolean infoSearcher = idMail != null ? true : false;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from login_test_ms where login_email=? and login_name=?";

        String targetData;

        if (infoSearcher){
            System.out.println("ID 찾기 중");
            System.out.println(idMail+" "+idName);
        }   else {
            sql += " and login_id=?";
            System.out.println("PASSWORD 찾기 중");
            System.out.println(pwId+" "+pwName+" "+pwMail);
        }

        try {
            if (con == null){
                con = DBManager.connect();
            }
            pstmt = con.prepareStatement(sql);
            pstmt.setString (1, null);
            pstmt.setString (2, null);
            if (infoSearcher){
                pstmt.setString(1, idMail);
                pstmt.setString(2, idName);
            } else {
                pstmt.setString(1, pwMail);
                pstmt.setString(2, pwName);
                pstmt.setString(3, pwId);
            }
            rs = pstmt.executeQuery();
            if(rs.next()){
                targetData = infoSearcher ? "ID는 "+rs.getString("login_id") : "PW는 " + rs.getString("login_password");
            } else targetData = "해당하는 정보를 찾을 수 없습니다.";
            System.out.println(targetData);

            request.setAttribute("result", targetData);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(null, pstmt, rs);
        }



    }
}
