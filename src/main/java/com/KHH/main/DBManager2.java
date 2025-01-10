package com.KHH.main;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.*;

public class DBManager2 {
    private static final BasicDataSource dataSource = new BasicDataSource();

    static {
        try {
            // Configure the BasicDataSource
            dataSource.setUrl("jdbc:oracle:thin:@ndcidcu20dsd2vd6_medium?TNS_ADMIN=/Users/svyet/eclipse-workspace/sbt10/dbworkspace/Wallet_NDCIDCU20DSD2VD6");
            dataSource.setUsername("ADMIN");
            dataSource.setPassword("V}A7uE44R7BD3GB");
            dataSource.setMinIdle(10);
            dataSource.setMaxIdle(20);
            dataSource.setMaxOpenPreparedStatements(100);

        } catch (Exception e) {
            System.err.println("Error initializing DataSource: " + e.getMessage());
            throw new ExceptionInInitializerError(e);
        }
    }

    // Method to get a database connection
    public static Connection connect() throws SQLException {
        return dataSource.getConnection();
    }

    // Method to close database resources
    public static void close(Connection con, PreparedStatement pst, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.err.println("Error closing resources: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Overloaded close method for convenience
    public static void close(Connection con, PreparedStatement pst) {
        close(con, pst, null);
    }

    public static void close(Connection con) {
        close(con, null, null);
    }
}
