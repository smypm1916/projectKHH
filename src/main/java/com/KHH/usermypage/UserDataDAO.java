package com.KHH.usermypage;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDataDAO {


    public static void viewUserData (HttpServletRequest request) {
    // 그냥 기본적으로 해당 유저의 계정 정보 보여주기 >> view data
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from user_account where user_email=?";

       try {
           con = DBManager.connection();
           pstmt = con.prepareStatement(sql);
           rs = pstmt.executeQuery();
           pstmt.setString(1, request.getParameter("user_email"));

//           if (rs.next()) {
//                UserDataDTO user =new UserDataDTO();
//                user.getUser_email(rs.getString(1));
//               user.getUser_nickname(rs.getString(8));
//               user.getUser_grade(rs.getString(9));
//           user.getUser_picture(rs.getString(10));
//                System.out.println("연결성공");
//           }
       }catch (Exception e){
           e.printStackTrace();
       }finally {
           DBManager.close(con, pstmt, rs);
       }


    }
    // profile Update 메소드
    public static void userProfileUpdate(HttpServletRequest request) {
        //해당 유저의 프로필 사진, 프로필 이름 db에서 불러오기 view, update

        String path = request.getServletContext().getRealPath("jsp/UserMyPage/UserProfile");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 업로드 기능
            MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());
            con = DBManager.connection();
            String user_nickname = mr.getParameter("user_nickname");
            String user_email  = mr.getParameter("user_email");
            String newImg = mr.getFilesystemName("newImg");
            String user_picture = mr.getParameter("user_picture");


        String sql = "update user_account set user_nickname=?, user_picture=? where user_email =?";

            String img = user_picture;
            if(newImg != null) {// new이미지가 아니면
                img = newImg;
            }

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user_nickname);
            pstmt.setString(2, user_picture);
            pstmt.setString(3, img);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("등록성공");
                // 데이터 수정이 완료되었을 경우 기존에 저장되어 있던 사진데이터는 삭제
                if(newImg != null) {
                    File f = new File(path+"/"+user_picture);
                    f.delete();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }
    }
}
