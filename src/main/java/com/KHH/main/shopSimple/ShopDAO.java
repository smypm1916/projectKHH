package com.KHH.main.shopSimple;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ShopDAO {
    public static final ShopDAO SDAO = new ShopDAO();
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public static ArrayList<ShopSimpleDTO> simpleLists;
    public static ArrayList<ShopDetailDTO> getDetail;

    private ShopDAO() {
        try {
            con = DBManager.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ShopDAO getSdao() {
        return SDAO;
    }


    public ArrayList<ShopSimpleDTO> ShowSimpleLists() {
        simpleLists = new ArrayList<>();
        String sql = "select * from SHOP_INFO";
        try {
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                ShopSimpleDTO simpleDTO = new ShopSimpleDTO(
                        rs.getInt("shop_no"),
                        rs.getString("shop_name"),
                        rs.getString("shop_addrtype"),
                        rs.getString("shop_tel"),
                        rs.getString("shop_opentime"));
                simpleLists.add(simpleDTO);

                System.out.println("Read Success!!!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            try {
                DBManager.close(con, pst, rs);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return simpleLists;
    }

    public ShopDetailDTO DetailShopInfo(HttpServletRequest request) {
        int no = Integer.parseInt(request.getParameter("shop_no"));
        // String sql = "select * from SHOP_INFO where shop_no=?";
        ShopDetailDTO detailDTO = null;

        try {
            pst = con.prepareStatement("select * from SHOP_INFO where SHOP_NO=?");
            rs = pst.executeQuery();
            while (rs.next()) {
                detailDTO = new ShopDetailDTO();
                detailDTO.setShop_owner(rs.getString("shop_owner"));
                detailDTO.setShop_name(rs.getString("shop_name"));
                detailDTO.setShop_addr(rs.getString("shop_addr"));
                detailDTO.setShop_addrtype(rs.getString("shop_addrtype"));
                detailDTO.setShop_tel(rs.getString("shop_tel"));
                detailDTO.setShop_content(rs.getString("shop_content"));
                detailDTO.setShop_opentime(rs.getString("shop_opentime"));
                System.out.println("Shop Detail Read Success!!!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DBManager.close(con, pst, rs);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return detailDTO;
    }
}
