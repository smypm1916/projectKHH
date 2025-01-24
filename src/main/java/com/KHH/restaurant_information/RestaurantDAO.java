package com.KHH.restaurant_information;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RestaurantDAO {

    public static final RestaurantDAO RDAO = new RestaurantDAO();
    static Connection con = null;

    private RestaurantDAO() {
        try {
            con = DBManager.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void showAllList(HttpServletRequest request) {

        String sql = "select * from review_info_test_ms";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<RestaurantDTO> resList = null;

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            resList = new ArrayList<RestaurantDTO>();
            RestaurantDTO resDTO = null;
            while (rs.next()) {
                resDTO = new RestaurantDTO(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getInt(5), rs.getString(6));
                resList.add(resDTO);
            }
            request.setAttribute("resList", resList);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(null, pstmt, rs);
        }

    }

    public static void addReview(HttpServletRequest request) {



    }
}