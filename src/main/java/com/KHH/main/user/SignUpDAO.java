package com.KHH.main.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SignUpDAO {
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public static ArrayList<UserDTO> users = null;

    public void UserSignUp(HttpServletRequest request, HttpServletResponse response) {
//        String username=request.getParameter("");


        try {


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

}
