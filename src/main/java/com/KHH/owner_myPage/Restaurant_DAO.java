package com.KHH.owner_myPage;

import com.KHH.main.DBManager;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Restaurant_DAO {

    public static void EditProfile(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "update ";
        try {
            request.setCharacterEncoding("utf-8");
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
        System.out.println(sql);
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            ArrayList<Restaurant_DTO> restaurants = new ArrayList<>();
            while (rs.next()) {
                Restaurant_DTO restaurant = new Restaurant_DTO();
                restaurant.setName(rs.getString("name"));
                restaurant.setOwner(rs.getString("owner"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setOpentime(rs.getString("opentime"));
                restaurant.setPhone(rs.getString("phone"));
                restaurant.setExplain(rs.getString("explain"));
                restaurants.add(restaurant);
            }
            request.setAttribute("res", restaurants);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DBManager.close(con, pstmt, rs);
            }
            catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    public static void InsertRestaurant(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;

        MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
                new DefaultFileRenamePolicy());

        String sql = "insert into shop_info(shop_no,shop_name,shop_owner,shop_addr,shop_opentime,shop_tel,shop_content) values(SHOP_NO_SEQ.nextval,?,?,?,?,?,?)";
        String sqlImage = "insert into shop_image values shop_image=? where shop_no=?";

        String path = request.getServletContext().getRealPath("jsp/owner_myPage/res_image");

        try {
            request.setCharacterEncoding("utf-8");
            String name = request.getParameter("addName");
            String owner = request.getParameter("addOwner");
            String Address = "홋카이도 " + request.getParameter("addRegion") + " " + request.getParameter("addAddr");
            String opentime = request.getParameter("addWeek") + " " + request.getParameter("addOpenHour") + request.getParameter("addOpenMinute") + " ~ " + request.getParameter("addCloseHour") + request.getParameter("addCloseMinute");
            opentime.replace("시",":");
            opentime.replace("분","");
            String phone = request.getParameter("addPhoneNum1") + "-" + request.getParameter("addPhoneNum2") + "-" + request.getParameter("addPhoneNum3");

            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, owner);
            pstmt.setString(3, request.getParameter(Address));
            pstmt.setString(4, request.getParameter(opentime));
            pstmt.setString(5, request.getParameter(phone));
            String explain = request.getParameter("addExplain");

            pstmt.setString(6, explain);
            if (pstmt.executeUpdate() == 0) {
                System.out.println("추가성공");
                pstmt = con.prepareStatement(sqlImage);
                pstmt.setString(1, "image_name");
                pstmt.setInt(2, "shop_no");
               if(pstmt.executeUpdate() == 0){
                   System.out.println("image uploaded successfully!!!");
               }
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
        String sql = "update shop_info set shop_name=?,shop_owner,shop_addr=?,shop_opentime=?,shop_tel=?,shop_content=? where shop_id=?";
        try {
            request.setCharacterEncoding("utf-8");
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            String name = request.getParameter("editName");
            String owner = request.getParameter("editOwner");
            String Address = "홋카이도 " + request.getParameter("editRegion") + " " + request.getParameter("editAddr");
            String opentime = request.getParameter("editWeek") + " " + request.getParameter("editOpenHour") + request.getParameter("editOpenMinute") + " ~ " + request.getParameter("editCloseHour") + request.getParameter("editCloseMinute");
            opentime.replace("시",":");
            opentime.replace("분","");
            String phone = request.getParameter("editPhoneNum1") + "-" + request.getParameter("editPhoneNum2") + "-" + request.getParameter("editPhoneNum3");
            String explain = request.getParameter("editExplain");
            pstmt.setString(1, request.getParameter(name));
            pstmt.setString(2, request.getParameter(owner));
            pstmt.setString(3, request.getParameter(Address));
            pstmt.setString(4, request.getParameter(opentime));
            pstmt.setString(5, request.getParameter(phone));
            pstmt.setString(6, request.getParameter(explain));
            pstmt.setInt(7, Integer.parseInt(request.getParameter("no")));
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
