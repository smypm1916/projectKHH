package com.KHH.main.signUp;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SignUpDAO {
    private static final SignUpDAO SDAO = new SignUpDAO();

//    public static ArrayList<UserDTO> users = null;

    private SignUpDAO() {
    }

    public static SignUpDAO getSDAO() {
        return SDAO;
    }

    public void UserSignUp(HttpServletRequest request, HttpServletResponse response) {

        String userName = request.getParameter("name");
        String emailDomain = request.getParameter("email-domain");
        String emailService = request.getParameter("email-service");
        String userEmail = emailDomain + "@" + emailService;
        String userNickname = request.getParameter("nickname");
        String userTel = request.getParameter("tel");
        String userGender = request.getParameter("gender");
        String userBirth;
        String userBirthYear = request.getParameter("birth-year");
        String userBirthMonth = request.getParameter("birth-month");
        String userBirthDay = request.getParameter("birth-day");
        userBirth = userBirthYear + "-" + userBirthMonth + "-" + userBirthDay;
        String userAddress = request.getParameter("address");
        String addressDetail = request.getParameter("address-detail");
        userAddress += "\n" + addressDetail;
        String userPassword = request.getParameter("password");

        String sql = "INSERT INTO USER_ACCOUNT values (?,?,?,?,?,?,?,?,'level1',null)";

        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBManager.connect();
            pst = con.prepareStatement(sql);
            pst.setString(1, userEmail);
            pst.setString(2, userPassword);
            pst.setString(3, userName);
            pst.setString(4, userBirth);
            pst.setString(5, userAddress);
            pst.setString(6, userTel);
            pst.setString(7, userGender);
            pst.setString(8, userNickname);

            if (pst.executeUpdate() == 1) {
                System.out.println("User Sign Up Success!!!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DBManager.close(con, pst, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public void OwnerSignUp(HttpServletRequest request, HttpServletResponse response) {
        String ownerName = request.getParameter("name");
        String emailDomain = request.getParameter("email-domain");
        String emailService = request.getParameter("email-service");
        String ownerEmail = emailDomain + "@" + emailService;
        String ownerNickname = request.getParameter("nickname");
        String ownerTel = request.getParameter("tel");
        String ownerBirth;
        String ownerBirthYear = request.getParameter("birth-year");
        String ownerBirthMonth = request.getParameter("birth-month");
        String ownerBirthDay = request.getParameter("birth-day");
        ownerBirth = ownerBirthYear + "-" + ownerBirthMonth + "-" + ownerBirthDay;
        String ownerPassword = request.getParameter("password");

        String sql = "INSERT INTO OWNER_ACCOUNT values (?,?,?,?,?)";

        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DBManager.connect();
            pst = con.prepareStatement(sql);
            pst.setString(1, ownerEmail);
            pst.setString(2, ownerPassword);
            pst.setString(3, ownerName);
            pst.setString(4, ownerBirth);
            pst.setString(5, ownerTel);

            if (pst.executeUpdate() == 1) {
                System.out.println("Owner Sign Up Success!!!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                DBManager.close(con, pst, null);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void CheckDuplicate(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type");
        String value = request.getParameter("value");

        ResultSet rs = null;

        // Database 연결
        try (Connection con = DBManager.connect()) {
            String query;
            if ("email".equals(type)) {
                query = "SELECT COUNT(*) FROM USER_ACCOUNT WHERE USER_EMAIL=?";
            } else if ("nickname".equals(type)) {
                query = "SELECT COUNT(*) FROM USER_ACCOUNT WHERE user_nickname=?";
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }

            try (PreparedStatement pst = con.prepareStatement(query)) {
                pst.setString(1, value);
                rs = pst.executeQuery();
                rs.next();
                boolean exists = rs.getInt(1) > 0;
                response.getWriter().write("{\"exists\": " + exists + "}");
            } catch (SQLException | IOException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
