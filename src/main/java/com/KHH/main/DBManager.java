package com.KHH.main;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.*;

public class DBManager {
    private static final BasicDataSource dataSource = new BasicDataSource();

    static {
        try {
//            driver class load manually
            Class.forName("oracle.jdbc.OracleDriver");
//            class name set
            dataSource.setDriverClassName("oracle.jdbc.OracleDriver");

//             Configure the BasicDataSource
            dataSource.setUrl("jdbc:oracle:thin:@G01O7S1507WX5IY9_medium?TNS_ADMIN=C:/Users/jien9/Downloads/Wallet_G01O7S1507WX5IY9");
            dataSource.setUsername("KHH");
            dataSource.setPassword("Soldesk802!!");
            dataSource.setMinIdle(5);
            dataSource.setMaxIdle(10);
            dataSource.setMaxOpenPreparedStatements(100);

        } catch (Exception e) {
            System.err.println("Error initializing DataSource: " + e.getMessage());
            throw new ExceptionInInitializerError(e);
        }
    }

    // Method to get a database connection
    public static Connection connect() throws SQLException {
        System.out.println("Attempting to connect to the database...");
        Connection connection = dataSource.getConnection();
        System.out.println("Connection successful!");
        return connection;
    }

    // Method to close database resources
    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }

            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Overloaded close method for convenience
    public static void close(Connection con, PreparedStatement pstmt) {
        close(con, pstmt, null);
    }

    public static void close(Connection con) {
        close(con, null, null);
    }
}

