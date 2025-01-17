package com.KHH.usermypage;

import com.KHH.userreservationpage.ReservationDTO;
import com.KHH.userreviewspage.ReviewsDTO;
import com.KHH.userscrappage.ScrapDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDataDAO {


    public static void viewUserData (HttpServletRequest request) {
    // 그냥 기본적으로 해당 유저의 계정 정보 보여주기 >> view data
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
//        String userEmail = request.getParameter("user_email");
//                request.getSession().getAttribute()
        String sql = "select * from user_account_sj where user_email=?";

       try {
           con = DBManager.connection();
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, "user1@example.com");
           rs = pstmt.executeQuery();

           if (rs.next()) {
                UserDataDTO user =new UserDataDTO();
                user.setUser_email(rs.getString("user_email"));
               user.setUser_nickname(rs.getString("user_nickname"));
               user.setUser_grade(rs.getString("user_grade"));
                user.setUser_picture(rs.getString("user_picture"));
                request.getSession().setAttribute("user", user);
                System.out.println("연결성공");
           }
       }catch (Exception e){
           e.printStackTrace();
       }finally {
           DBManager.close(con, pstmt, rs);
       }
    }

//유저 리뷰들 보여주기
    public static void viewUserReviews (HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
//        String user_nickname = request.getParameter("user_nickname");
        String sql = "select * from review_info_sjsj where review_nickname=?";

        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "John123");
            rs = pstmt.executeQuery();

            ArrayList<ReviewsDTO> reviews = new ArrayList<>();
            ReviewsDTO review = null;
            while (rs.next()) {
                review = new ReviewsDTO();
                review.setReview_shop(rs.getString(2));
                review.setReview_content(rs.getString(3));
                review.setReview_date(rs.getString(4));
                review.setReview_nickname(rs.getString(5));
                System.out.println("연결성공");
                reviews.add(review);
            }
                request.setAttribute("reviews", reviews);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    //예약 확인
    public static void viewUserResevation(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String user_email = request.getParameter("user_email");
        String sql = "select * from reservation_info_sj where reservation_email=?";

        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "example@email.com");
            //나중에 이메일부분 real DB 변경시 파라미터값 대체 필요
            rs = pstmt.executeQuery();


            ArrayList<ReservationDTO> reservations = new ArrayList<>();
            ReservationDTO reservation = null;

            while(rs.next())  {
                reservation = new ReservationDTO();
                reservation.setReservation_email(rs.getString(3));
                reservation.setReservation_shop(rs.getInt(2));
                reservation.setReservation_date(rs.getString(6));
                reservation.setReservation_people(rs.getInt(7));
                reservations.add(reservation);
            }
            request.setAttribute("reservations", reservations);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    // 스크랩 확인
    public static void viewUserScrap(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String user_email = request.getParameter("user_email");
        String sql = "select * from scrap_shop_sj where scrap_email=?";


        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "user@example.com");
            rs = pstmt.executeQuery();

            ArrayList<ScrapDTO> scraps = new ArrayList<>();
            ScrapDTO scrap = null;
            while(rs.next())  {
                scrap = new ScrapDTO();
                scrap.setScrap_email(rs.getString(2));
                scrap.setScrap_shop(rs.getInt(3));
                scraps.add(scrap);

            }
            request.setAttribute("scraps", scraps);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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

