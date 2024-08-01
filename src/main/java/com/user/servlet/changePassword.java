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

@WebServlet("/changePassword")
public class changePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("uid"));
			String oldPass=req.getParameter("oldPassEntered");
			String oldPassEntered=req.getParameter("oldpassword");
			String newPass=req.getParameter("newpassword");
			HttpSession session=req.getSession();
			
			if(oldPassEntered.equals(oldPass)) {
				UserDao dao=new UserDao(DBConnect.getConn());
				boolean f=dao.updatePassword(newPass, id);
				
				if(f) {
					session.setAttribute("succMsg"," Password Updated");
					resp.sendRedirect("change_password.jsp");
				}else {
					session.setAttribute("errorMsg","Please Check Password");
					resp.sendRedirect("change_password.jsp");
				}
			}else {
				session.setAttribute("errorMsg"," Password does not match");
				resp.sendRedirect("change_password.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
         
}
