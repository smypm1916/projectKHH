package com.KHH.main;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {


    private static BasicDataSource dataSource;

	static {
        dataSource = new BasicDataSource();
		dataSource.setUrl("jdbc:oracle:thin:@g01o7s1507wx5iy9_medium?TNS_ADMIN=C:/pce10/Wallet_G01O7S1507WX5IY9");
		dataSource.setUsername("ADMIN");
		dataSource.setPassword("Smile93406747*");
		dataSource.setMinIdle(10); // 최소 유효 커넥션
		dataSource.setMaxIdle(20); // 최대 유효 커넥션
		dataSource.setMaxOpenPreparedStatements(100); // 풀에서 열린 최대 준비된 sql문 개수
	}

	public static Connection connect() throws SQLException {
		return dataSource.getConnection();

	}

    public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            pstmt.close();
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
