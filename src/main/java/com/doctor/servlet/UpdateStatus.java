package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBConnect;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			int doc_id=Integer.parseInt(req.getParameter("did"));
			String comment=req.getParameter("comm");
			
			AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
			
			boolean f=dao.updateComment(id, doc_id, comment);
			HttpSession session =req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Comment Updated Successfully");
				resp.sendRedirect("doctor/patient.jsp");
			}else {
				session.setAttribute("errorMsg", "Something Went Wrong");
				resp.sendRedirect("comment.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}