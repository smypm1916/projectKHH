package com.KHH.ShopInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ShopDAO {
   public static void getShop(HttpServletRequest req) {
       Connection con = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       String num = req.getParameter("no");

        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement("select * from shop_info where shop_no=?");
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                ShopDTO shop = new ShopDTO();
                shop.setShop_no(rs.getInt(1));
                shop.setShop_owner(rs.getString(2));
                shop.setShop_name(rs.getString(3));
                shop.setShop_addr(rs.getString(4));
                shop.setShop_tel(rs.getString(5));
                shop.setShop_content(rs.getString(6));
                shop.setShop_opentime(rs.getString(7));
                shop.setShop_addrtype(rs.getString(8));
                req.setAttribute("shop", shop);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {

        }

   }

   public static void showAllShop(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement("select * from shop_info");
            rs = pstmt.executeQuery();
            ShopDTO shop = null;
            ArrayList<ShopDTO>shops = new ArrayList<>();
            while (rs.next()) {
                System.out.println("DB쿼리 수행됨");
                shop = new ShopDTO();
                shop.setShop_no(rs.getInt(1));
                shop.setShop_owner(rs.getString(2));
                shop.setShop_name(rs.getString(3));
                shop.setShop_addr(rs.getString(4));
                shop.setShop_tel(rs.getString(5));
                shop.setShop_content(rs.getString(6));
                shop.setShop_opentime(rs.getString(7));
                shop.setShop_addrtype(rs.getString(8));
                shops.add(shop);
            }
            System.out.println(shops);
            req.setAttribute("shops", shops);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
   }

}
