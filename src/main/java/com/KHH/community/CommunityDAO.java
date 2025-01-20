package com.KHH.community;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommunityDAO {
    public static void countCommunityData(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select count(*) from community_info";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                request.setAttribute("count", rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void selectAllList(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from community_info order by community_no DESC";

        CommunityDTO com = null;
        ArrayList<CommunityDTO> coms = new ArrayList<CommunityDTO>();

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                com = new CommunityDTO();
                com.setNo(rs.getInt(1));
                com.setTitle(rs.getString(2));
                com.setContent(rs.getString(3));
                com.setNickname(rs.getString(4));
                com.setDate(rs.getDate(5));
                com.setReadcnt(rs.getInt(6));
                coms.add(com);
            }
            request.setAttribute("coms", coms);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void updateCommunityReadCnt(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;

        String no = request.getParameter("no");

        String sql = "update community_info set community_readcnt = community_readcnt + 1 where community_no = ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, no);
            if(pstmt.executeUpdate() == 1) {
                System.out.println("조회수 업데이트 성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, null);
        }
    }

    public static void getCommunityDetail(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String no = request.getParameter("no");

        String sql = "select * from community_info where community_no = ?";

        CommunityDTO com = null;

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                com = new CommunityDTO();
                com.setNo(rs.getInt(1));
                com.setTitle(rs.getString(2));
                com.setContent(rs.getString(3));
                com.setNickname(rs.getString(4));
                com.setDate(rs.getDate(5));
                com.setReadcnt(rs.getInt(6));
            }
            request.setAttribute("com", com);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void getCommunityPNDetail(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "";

        String no = req.getParameter("no");
        String page = req.getParameter("page");

        if(page.equals("prev")){
            sql = "SELECT * FROM community_info WHERE community_no > ? ORDER BY community_no DESC";
        }else if(page.equals("next")){
            sql = "SELECT * FROM community_info WHERE community_no < ? ORDER BY community_no ASC";
        }

        CommunityDTO com = null;

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                com = new CommunityDTO();
                com.setNo(rs.getInt(1));
                com.setTitle(rs.getString(2));
                com.setContent(rs.getString(3));
                com.setNickname(rs.getString(4));
                com.setDate(rs.getDate(5));
                com.setReadcnt(rs.getInt(6));
            }
            req.setAttribute("com", com);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void getCommunitySearchItems(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String item = req.getParameter("item");
        String value = req.getParameter("value");

        String sql = "";
        if(item.equals("title")){
            sql = "select * from community_info where community_title like ? order by community_no DESC";
        }else if(item.equals("writer")){
            sql = "select * from community_info where community_nickname like ? order by community_no DESC";
        }

        CommunityDTO com = null;
        ArrayList<CommunityDTO> coms = new ArrayList<CommunityDTO>();

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+value+"%");
            rs = pstmt.executeQuery();

            while(rs.next()) {
                com = new CommunityDTO();
                com.setNo(rs.getInt(1));
                com.setTitle(rs.getString(2));
                com.setContent(rs.getString(3));
                com.setNickname(rs.getString(4));
                com.setDate(rs.getDate(5));
                com.setReadcnt(rs.getInt(6));
                coms.add(com);
            }
            req.setAttribute("coms", coms);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void countSearchCommunityData(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String item = req.getParameter("item");
        String value = req.getParameter("value");

        String sql = "";
        if(item.equals("title")){
            sql = "select count(*) from community_info where community_title like ?";
        }else if(item.equals("writer")){
            sql = "select count(*) from community_info where community_nickname like ?";
        }

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"%"+value+"%");
            rs = pstmt.executeQuery();

            if(rs.next()) {
                req.setAttribute("count", rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }
}
