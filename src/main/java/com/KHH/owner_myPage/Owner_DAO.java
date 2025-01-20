package com.KHH.owner_myPage;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Owner_DAO {

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
    public static void ShowAllList(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from shop_info";
        ArrayList restaurants = new ArrayList();
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void InsertRestaurant(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "insert into shop_info(shop_no,shop_name,shop_addr,shop_opentime,shop_tel,shop_content) values(SHOP_NO_SEQ,?,?,?,?,?)";

        String name = request.getParameter("addName");
        String Address = "홋카이도 " + request.getParameter("addRegion") + " " + request.getParameter("addAddr");
        String opentime = request.getParameter("addOpenHour") + request.getParameter("addOpenMinute") + " ~ " + request.getParameter("addCloseHour") + request.getParameter("addCloseMinute");
        opentime.replace("시",":");
        opentime.replace("분","");
        String phone = request.getParameter("addPhoneNum1") + "-" + request.getParameter("addPhoneNum2") + "-" + request.getParameter("addPhoneNum3");
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, request.getParameter(Address));
            pstmt.setString(3, request.getParameter(opentime));
            pstmt.setString(4, request.getParameter(phone));
            String explain = request.getParameter("addExplain");
            pstmt.setString(5, explain);
            if (pstmt.executeUpdate() == 0) {
                System.out.println("추가성공");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }

    public static void UpdateRestaurant(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "update shop_info set shop_name=?,shop_addr=?,shop_opentime=?,shop_tel=?,shop_content=? where shop_id=?";
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("editName"));
            String resAddress = "홋카이도 " + request.getParameter("editRegion") + " " + request.getParameter("editAddr");
            pstmt.setString(2, request.getParameter(resAddress));
            String opentime = request.getParameter("editOpenHour") + request.getParameter("editOpenMinute") + " ~ " + request.getParameter("editCloseHour") + request.getParameter("editCloseMinute");
            opentime.replace("시",":");
            opentime.replace("분","");
            pstmt.setString(3, request.getParameter(opentime));
            String phone = request.getParameter("editPhoneNum1") + "-" + request.getParameter("editPhoneNum2") + "-" + request.getParameter("editPhoneNum3");
            pstmt.setString(4, request.getParameter(phone));
            pstmt.setString(5, request.getParameter("editExplain"));
            pstmt.setInt(6, Integer.parseInt(request.getParameter("shop_no")));
            pstmt.executeUpdate();
            if (pstmt.executeUpdate() > 0) {
                System.out.println("수정성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }


}
