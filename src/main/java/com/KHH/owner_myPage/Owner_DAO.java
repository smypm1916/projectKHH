package com.KHH.owner_myPage;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Owner_DAO {


    public static void EditRestaurant(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "update shop_info set shop_name=?,shop_addr=?,shop_opentime=?,shop_tel=?,shop_content=? where shop_id=?";
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("resName"));
            pstmt.setString(2, request.getParameter("resRegion"));
            String resTime = request.getParameter("openHour") + request.getParameter("openMinute") + " ~ " + request.getParameter("closeHour") + request.getParameter("closeMinute");
            resTime.replace("시",":");
            resTime.replace("분","");
            pstmt.setString(3, request.getParameter(resTime));
            String phone = request.getParameter("resPhoneNum1") + "-" + request.getParameter("resPhoneNum2") + "-" + request.getParameter("resPhoneNum3");
            pstmt.setString(4, request.getParameter(phone));
            pstmt.setString(5, request.getParameter("resExplain"));
            if (pstmt.executeUpdate() > 0) {
                System.out.println("수정성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void EditProfile(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "update ";
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }
}
