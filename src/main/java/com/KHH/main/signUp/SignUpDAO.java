package com.KHH.main.signUp;

import com.KHH.main.DBManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SignUpDAO {
    public static final SignUpDAO SDAO = new SignUpDAO();
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public static ArrayList<UserDTO> users = null;

    private SignUpDAO() {
        try {
            con = DBManager.connect();
        } catch (Exception e) {
            e.printStackTrace();
        }
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

        try {
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
                DBManager.close(con, pst, rs);
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
        String userNickname = request.getParameter("nickname");
        String ownerTel = request.getParameter("tel");
        String ownerBirth;
        String ownerBirthYear = request.getParameter("birth-year");
        String ownerBirthMonth = request.getParameter("birth-month");
        String ownerBirthDay = request.getParameter("birth-day");
        ownerBirth = ownerBirthYear + "-" + ownerBirthMonth + "-" + ownerBirthDay;
        String ownerPassword = request.getParameter("password");

        String sql = "INSERT INTO OWNER_ACCOUNT values (?,?,?,?,?)";

        try {
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
                DBManager.close(con, pst, rs);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
