package com.user.servlet;
import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{

	

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int userId=Integer.parseInt(req.getParameter("userid"));
			String fullname=req.getParameter("fullname");
			String gender=req.getParameter("gender");
			String age=req.getParameter("age");
			String phno=req.getParameter("phno");
			String appoint_date=req.getParameter("date");
			String email=req.getParameter("email");
			String disis=req.getParameter("disis");
			int doctor_Id=Integer.parseInt(req.getParameter("doct"));
			String address=req.getParameter("address");
			String status="Pending";
			
			Appointment app=new Appointment( userId, fullname,  gender, age,appoint_date,email,
					phno, disis,  doctor_Id,  address, status);
			
			AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
			HttpSession session=req.getSession();
			
			boolean f=dao.addAppointment(app);
			
			if(f) {
				session.setAttribute("succMsg", "Appointment Successfull");
				resp.sendRedirect("user_appointment.jsp");
			}else {
				session.setAttribute("errorMsg", "Something went wrong");
				resp.sendRedirect("user_appointment.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
