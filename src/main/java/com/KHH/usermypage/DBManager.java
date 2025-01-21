package com.KHH.usermypage;

import java.sql.*;

public class DBManager {
    public static Connection connection() throws SQLException, ClassNotFoundException {
        Class.forName("oracle.jdbc.OracleDriver");
        String url = "jdbc:oracle:thin:@G01O7S1507WX5IY9_medium?TNS_ADMIN=C:/Users/jien9/Downloads/Wallet_G01O7S1507WX5IY9";
            return DriverManager.getConnection(url,"KHH","Soldesk802!!");
// string url >> 오라클 DB  주소
        // drivermanager.getconnect > url, id, pw
    }
    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
         try {
             if (rs != null) {
                 rs.close();
             }
             pstmt.close();
             con.close();
         }catch(Exception e) {
             e.printStackTrace();
        }
    }

}

