package com.KHH.owner_myPage;

import com.KHH.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Restaurant_DAO {

    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50;

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
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    /* public static void InsertResAndImages(HttpServletRequest req){
         String path = req.getServletContext().getRealPath("jsp/owner_myPage/res_image");
         System.out.println(path);
         File directory = new File(path);

         // 디렉토리가 없으면 생성
         if (!directory.exists() && !directory.mkdirs()) {

         }

         Connection con = null;
         PreparedStatement pstmt1 = null;
         PreparedStatement pstmt2 = null;

         String sql1 = "INSERT INTO community_info VALUES (?, ?, ?, ?, SYSDATE, 0)";
         String sql2 = "INSERT INTO community_image VALUES (?, ?)";

         try {
             // 파일 업로드를 위한 설정
             DiskFileItemFactory factory = new DiskFileItemFactory();
             ServletFileUpload upload = new ServletFileUpload(factory);
             upload.setFileSizeMax(MAX_FILE_SIZE);
             // Set maximum request size (including file + form data)
             upload.setSizeMax(MAX_REQUEST_SIZE);
             // 요청에서 파일 아이템 추출
             List<FileItem> items = upload.parseRequest(req);

             String writer = null, title = null, content = null;
             int no = getCommunityPK(); // 새로운 PK 생성

             request.setCharacterEncoding("utf-8");
             String name = request.getParameter("addName");
             String owner = request.getParameter("addOwner");
             String Address = "홋카이도 " + request.getParameter("addRegion") + " " + request.getParameter("addAddr");
             String opentime = request.getParameter("addWeek") + " " + request.getParameter("addOpenHour") + request.getParameter("addOpenMinute") + " ~ " + request.getParameter("addCloseHour") + request.getParameter("addCloseMinute");
             opentime.replace("시",":");
             opentime.replace("분","");
             String phone = request.getParameter("addPhoneNum1") + "-" + request.getParameter("addPhoneNum2") + "-" + request.getParameter("addPhoneNum3");
             String explain = request.getParameter("addExplain");

             con = DBManager.connect();

             Map<String, String> fieldMap = new HashMap<>();

             for (FileItem item : items) {
                 if (item.isFormField()) { // 폼 필드인지 확인
                     String fieldName = item.getFieldName();
                     String fieldValue = item.getString("UTF-8"); // UTF-8로 문자열 인코딩

                     // 특정 fieldName에 따라 Map에 저장
                     fieldMap.put(fieldName, fieldValue);
                 }
             }

             // 필요한 값 추출 (for문 외부에서 사용 가능)
             title = fieldMap.getOrDefault("title", null);
             content = fieldMap.getOrDefault("content", null);
             writer = fieldMap.getOrDefault("writer", null);

             // community_info 테이블 저장
             con = DBManager.connect();
             pstmt1 = con.prepareStatement(sql);
             pstmt1.setString(1, name);
             pstmt1.setString(2, owner);
             pstmt1.setString(3, request.getParameter(Address));
             pstmt1.setString(4, request.getParameter(opentime));
             pstmt1.setString(5, request.getParameter(phone));
             pstmt1.setString(6, explain);
             if (pstmt1.executeUpdate() == 1) {
                 System.out.println("shop_info insert success");

             }

             // 각 요청 파라미터 및 파일 처리
             for (FileItem item : items) {
                 if (item.isFormField()) {
                     // 일반 폼 필드
                     String fieldName = item.getFieldName();
                     String fieldValue = item.getString("UTF-8");

                     switch (fieldName) {
                         case "writer":
                             writer = fieldValue;
                             break;
                         case "title":
                             title = fieldValue;
                             break;
                         case "content":
                             content = fieldValue;
                             break;
                     }
                 } else {
                     // 파일 업로드 처리
                     String fileName = new File(item.getName()).getName();
                     int dotIndex = fileName.lastIndexOf('.');
                     String fileExtension = fileName.substring(dotIndex);
                     String uniqueFileName = UUID.randomUUID().toString().split("-")[0] + fileExtension;
                     File uploadedFile = new File(directory, uniqueFileName);
                     item.write(uploadedFile); // 파일 저장
                     // DB에 파일 이름 저장
                     pstmt2 = con.prepareStatement(sql2);
                     pstmt2.setInt(1, no);
                     pstmt2.setString(2, uniqueFileName);
                     if (pstmt2.executeUpdate() == 1) {
                         System.out.println("community_image insert success: " + fileName);
                     }

                 }
             }



         } catch (Exception e) {
             e.printStackTrace();
             if (con != null) {
 //                con.rollback();
             }
         } finally {*/
//            DBManager.close(con, pstmt1, null);
//            DBManager.close(null, pstmt2, null);
  /*      }
    }*/
    public static int GetShopPK() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select max(shop_no) from shop_info";

        int no = 0;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                no = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
        System.out.println("pk최댓값: " + no);
        return no + 1;
    }

    public static String GetOwnerName(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select owner_name from owner_account where owner_email=?";
        String ownerName = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, request.getParameter("email"));
            pstmt.setString(1, "jj@naver.com");
            rs = pstmt.executeQuery();
            if (rs.next()) {
                ownerName = rs.getString("owner_name");

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
        return ownerName;
    }

    public static void InsertRestaurant(HttpServletRequest request, String ownerName) {
        String path = request.getServletContext().getRealPath("image/shopImage");
        Connection con = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2 = null;
        File directory = new File(path);

        String sql = "insert into shop_info values(?,?,?,?,?,?,?,?)";
        String sqlImage = "insert into shop_image values (shop_no=?,shop_image=?,shop_type=?)";
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(MAX_FILE_SIZE);
            upload.setSizeMax(MAX_REQUEST_SIZE);
            List<FileItem> items = upload.parseRequest(request);
            int no = GetShopPK();
            String owner = ownerName;


            request.setCharacterEncoding("utf-8");
            String name = null;
            String region = null;
            String address = null;
//                    "홋카이도 " + request.getParameter("addRegion") + " " + request.getParameter("addAddr");
            String week = null;
            String oHour = null;
            String oMinute = null;
            String cHour = null;
            String cMinute = null;
//                    request.getParameter("addWeek") + " " + request.getParameter("addOpenHour") + request.getParameter("addOpenMinute") + " ~ " + request.getParameter("addCloseHour") + request.getParameter("addCloseMinute");
//            opentime.replace("시", ":");
//            opentime.replace("분", "");
            String phone1 = null;
            String phone2 = null;
            String phone3 = null;
//                    request.getParameter("addPhoneNum1") + "-" + request.getParameter("addPhoneNum2") + "-" + request.getParameter("addPhoneNum3");
            String content = null;

            con = DBManager.connect();

            Map<String, String> fieldMap = new HashMap<>();

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString("UTF-8");

                    fieldMap.put(fieldName, fieldValue);
                }
            }

            name = fieldMap.getOrDefault("addName", null);
            region = fieldMap.getOrDefault("addRegion", null);
            address = fieldMap.getOrDefault("addAddr", null);
            week = fieldMap.getOrDefault("addWeek", null);
            oHour = fieldMap.getOrDefault("addOpenHour", null);
            oMinute = fieldMap.getOrDefault("addOpenMinute", null);
            cHour = fieldMap.getOrDefault("addCloseHour", null);
            cMinute = fieldMap.getOrDefault("addCloseMinute", null);
            phone1 = fieldMap.getOrDefault("addPhoneNum1", null);
            phone2 = fieldMap.getOrDefault("addPhoneNum2", null);
            phone3 = fieldMap.getOrDefault("addPhoneNum3", null);
            content = fieldMap.getOrDefault("addExplain", null);

            pstmt1 = con.prepareStatement(sql);
            pstmt1.setInt(1, no);
            pstmt1.setString(2, owner);
            pstmt1.setString(3, name);
            pstmt1.setString(4, address);
            pstmt1.setString(5, region);
            pstmt1.setString(6, phone1 + "-" + phone2 + "-" + phone3);
            pstmt1.setString(7, content);
            pstmt1.setString(8, week + "/" + oHour + oMinute + "/" + cHour + cMinute);
            if (pstmt1.executeUpdate() > 0) {
                System.out.println("추가성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DBManager.close(con, pstmt1, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
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
            opentime.replace("시", ":");
            opentime.replace("분", "");
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
            try {
                DBManager.close(con, pstmt, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public static void DeleteRestaurant(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "delete from shop_info where shop_id=?";
        try {
            String id = request.getParameter("no");
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            if (pstmt.executeUpdate() > 0) {
                System.out.println("삭제성공");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                DBManager.close(con, pstmt, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public static void DetailShow(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from shop_info where shop_id=?";
        String id = request.getParameter("no");
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            Restaurant_DTO resDetail = new Restaurant_DTO();
            if (rs.next()) {
                resDetail.setId(rs.getInt(1));
                resDetail.setOwner(rs.getString(2));
                resDetail.setName(rs.getString(3));
                resDetail.setAddress(rs.getString(4));
                resDetail.setOpentime(rs.getString(5));
                resDetail.setPhone(rs.getString(6));
                resDetail.setExplain(rs.getString(7));
                request.setAttribute("rDetail", resDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DBManager.close(con, pstmt, rs);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
