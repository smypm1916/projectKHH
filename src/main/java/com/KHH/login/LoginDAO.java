package com.KHH.login;

import javax.servlet.http.HttpServletRequest;

public class LoginDAO {

	public static void loginChk(HttpServletRequest request) {
		
		String username = request.getParameter("iD");
	    String password = request.getParameter("password");
	    // 여기서 데이터베이스에서 사용자 인증 로직 구현
	    
	    System.out.println(username);
	    System.out.println(password);
		
	}

}
