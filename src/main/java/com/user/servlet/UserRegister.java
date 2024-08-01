package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
			String fullName=req.getParameter("fullname");
	   	    String password=req.getParameter("password");
	   	    String email=req.getParameter("email");
	   	 //   String sql="insert into user_dtls(full_name,email,password) values(fullName,password,email)";
	   	    User u=new User(fullName,email,password);
	   	  
	   	    UserDao dao=new UserDao(DBConnect.getConn());
	   	 HttpSession session=req.getSession();
	   	    boolean f=dao.register(u);
	   	    
	   	    if(f==true){
	   	    	session.setAttribute("succMsg", "User Registederd Successfully");
	   	    	resp.sendRedirect("user_login.jsp");	   	   
	   	    	}else {
	   	    		session.setAttribute("errorMsg", "User Registederd unSuccessfully");
		   	    	resp.sendRedirect("user_login.jsp");		
	   	    	}
   	
	}catch(Exception e) {
			e.printStackTrace();
	}
	}

	
}
