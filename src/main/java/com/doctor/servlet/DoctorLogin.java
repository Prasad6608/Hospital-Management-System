package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;

import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		DoctorDao dao=new DoctorDao(DBConnect.getConn());

		String email=req.getParameter("email");
		String password=req.getParameter("password");
		Doctor doctor=dao.login(email,password);
		HttpSession session=req.getSession();
		
		if(doctor != null) {
			session.setAttribute("doctorObj",doctor);
			resp.sendRedirect("doctor/index.jsp");
		}else {
			session.setAttribute("errorMsg","invalid  Password And Email" );
			resp.sendRedirect("doctor_login.jsp");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	}

	
}
