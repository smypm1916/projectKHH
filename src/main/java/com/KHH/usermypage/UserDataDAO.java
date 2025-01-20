package com.KHH.usermypage;

import com.KHH.userreservationpage.MyPageReservationDTO;
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


static ArrayList<ReviewsDTO> reviews = new ArrayList<>();
static ArrayList<MyPageReservationDTO> myreservations = new ArrayList<>();
static ArrayList<ScrapDTO> scraps = new ArrayList<>();


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
           pstmt.setString(1, "user2@example.com");
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
  //     String review_nickname = request.getParameter("user_nickname");
        String sql =
                //"SELECT r.review_shop, r.review_content, r.review_date, r.review_nickname, s.shop_name FROM  review_info_sjsj r JOIN shop_info_sj s ON r.review_shop = s.shop_no WHERE r.review_nickname = ?";
                "SELECT review_shop, review_content, review_date, review_nickname, shop_name" +
                        " FROM review_info_sjsj r, shop_info_sj s" +
                        " WHERE" +
                        " r.REVIEW_SHOP = s.SHOP_NO and" +
                        " r.review_nickname = ?";

        UserDataDTO user = (UserDataDTO) request.getSession().getAttribute("user");

        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,user.getUser_nickname());
            rs = pstmt.executeQuery();


            ReviewsDTO review = null;
            reviews = new ArrayList<ReviewsDTO>();

            while (rs.next()) {
                review = new ReviewsDTO();
                review.setReview_shop(rs.getInt(1));
                review.setReview_content(rs.getString(2));
                review.setReview_date(rs.getDate(3));
                review.setReview_nickname(rs.getString(4));
                review.setShop_name(rs.getString(5));
                reviews.add(review);
                System.out.println(review); // reviews 확인
            }
                request.setAttribute("reviews", reviews);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    //예약 확인
    public static void viewUserReservation(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
//        String user_email = request.getParameter("user_email");
        String sql = "SELECT ri.reservation_email, ri.reservation_date, ri.reservation_people, ri.reservation_name, ri.reservation_tel, si.shop_name, si.shop_content, si.shop_tel, si.shop_addr, sim.shop_image FROM reservation_info_sj ri, SHOP_INFO_sj si, shop_image_sj sim WHERE ri.reservation_email = ? AND ri.reservation_shop = si.shop_no AND si.shop_no = sim.shop_no";
        UserDataDTO user = (UserDataDTO) request.getSession().getAttribute("user");
        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getUser_email());
            //나중에 이메일부분 real DB 변경시 파라미터값 대체 필요
            rs = pstmt.executeQuery();


       MyPageReservationDTO myreservation = null;
       myreservations = new ArrayList<MyPageReservationDTO>();

            while(rs.next())  {
                myreservation = new MyPageReservationDTO();
                myreservation.setReservation_email(rs.getString("reservation_email"));
                myreservation.setReservation_date(rs.getString("reservation_date"));
                myreservation.setReservation_people(rs.getInt("reservation_people"));
                myreservation.setReservation_name(rs.getString("reservation_name"));
                myreservation.setReservation_tel(rs.getString("reservation_tel"));
                myreservation.setShop_name(rs.getString("shop_name"));
                myreservation.setShop_tel(rs.getString("shop_tel"));
                myreservation.setShop_addr(rs.getString("shop_addr"));
                myreservation.setShop_image(rs.getString("shop_image"));
                myreservations.add(myreservation);

                System.out.println(myreservation); //예약 확인
            }
            request.setAttribute("myreservations", myreservations);
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
        String sql =   "SELECT shop_name, scrap_date, shop_image, scrap_email, shop_addr, shop_tel, shop_content FROM scrap_shop_sj, shop_info sj, shop_image_sj WHERE scrap_email = ?";
        UserDataDTO user = (UserDataDTO) request.getSession().getAttribute("user");
        try {
            con = DBManager.connection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getUser_email());
            rs = pstmt.executeQuery();

            ScrapDTO scrap = null;
            scraps = new ArrayList<ScrapDTO>();

            while(rs.next())  {
                scrap = new ScrapDTO();
                scrap.setScrap_email(rs.getString("scrap_email"));
                scrap.setShop_image(rs.getString("shop_image"));
                scrap.setScrap_date(rs.getString("scrap_date"));
                scrap.setShop_name(rs.getString("shop_name"));
                scrap.setShop_addr(rs.getString("shop_addr"));
                scrap.setShop_tel(rs.getString("shop_tel"));
                scrap.setShop_content(rs.getString("shop_content"));
                scraps.add(scrap);
                System.out.println(scrap);

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

        String path = request.getServletContext().getRealPath("/jsp/UserProfile");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 업로드 기능
            MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*20, "utf-8", new DefaultFileRenamePolicy());
            con = DBManager.connection();
            String user_nickname = mr.getParameter("user_nickname");
            //String user_email  = mr.getParameter("user_email");
            String newImg = mr.getFilesystemName("newImg");
            String user_picture = mr.getParameter("user_picture");

            System.out.println("파라미터 닉네임 : "+user_nickname);
            //System.out.println("파라미터 이메일 : "+user_email);

        String sql = "update user_account_sj set user_nickname = ?, user_picture = ? where user_email = 'user1@example.com'";

            String img = user_picture;
            if(newImg != null) {// new이미지가 아니면
                img = newImg;
            }

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, user_nickname);
            pstmt.setString(2, user_picture);
            //pstmt.setString(3, user_email);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("등록성공");
                // 데이터 수정이 완료되었을 경우 기존에 저장되어 있던 사진데이터는 삭제
                if(newImg != null) {
                    File f = new File(path+"/"+user_picture);
                    f.delete();
                }
            }
            System.out.println("user_nickname");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }

//리뷰 페이징 기능
public static void  reviewsPaging(int pageNum, HttpServletRequest request) {
    request.setAttribute("curPageNum", pageNum);

    int total = reviews.size(); //총데이터수
    int cnt = 3; //한페이지당보여줄개수

    // 페이지 수 == 마지막 페이지 번호
    int pageCount =(int) Math.ceil((double)total/ cnt); //총페이지수
    //System.out.println(pageCount); //페이지 개수(총페이지수)
    request.setAttribute("pageCount", pageCount);

    //int pageNum = 1; //페이지번호

    //시작,끝
    int start = total - (cnt * (pageNum - 1));
    int end = (pageNum == pageCount) ? -1 : start - (cnt + 1);


    for (int i = start - 1; i > end; i--) {
        reviews.add(reviews.get(i));
    }
    // For each 로 뿌리기
    request.setAttribute("reviews", reviews);
}


    //예약가게 페이징 기능
    public static void  reservationPaging(int pageNum, HttpServletRequest request) {
        request.setAttribute("curPageNum", pageNum);

        int total = myreservations.size(); //총데이터수
        int cnt = 3; //한페이지당보여줄개수

        // 페이지 수 == 마지막 페이지 번호
        int pageCount =(int) Math.ceil((double)total/ cnt); //총페이지수
        //System.out.println(pageCount); //페이지 개수(총페이지수)
        request.setAttribute("pageCount", pageCount);

        //int pageNum = 1; //페이지번호

        //시작,끝
        int start = total - (cnt * (pageNum - 1));
        int end = (pageNum == pageCount) ? -1 : start - (cnt + 1);


        for (int i = start - 1; i > end; i--) {
            myreservations.add(myreservations.get(i));
        }
        // For each 로 뿌리기
        request.setAttribute("myreservations", myreservations);
    }

    //예약가게 페이징 기능
    public static void  scrapPaging(int pageNum, HttpServletRequest request) {
        request.setAttribute("curPageNum", pageNum);

        int total = scraps.size(); //총데이터수
        int cnt = 3; //한페이지당보여줄개수

        // 페이지 수 == 마지막 페이지 번호
        int pageCount =(int) Math.ceil((double)total/ cnt); //총페이지수
        //System.out.println(pageCount); //페이지 개수(총페이지수)
        request.setAttribute("pageCount", pageCount);

        //int pageNum = 1; //페이지번호

        //시작,끝
        int start = total - (cnt * (pageNum - 1));
        int end = (pageNum == pageCount) ? -1 : start - (cnt + 1);


        for (int i = start - 1; i > end; i--) {
            scraps.add(scraps.get(i));
        }
        // For each 로 뿌리기
        request.setAttribute("scraps", scraps);
    }
}

