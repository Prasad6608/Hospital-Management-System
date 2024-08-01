package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.Specalistdao;
import com.db.DBConnect;

@WebServlet("/addSpecialist")
public class AddSpecalist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			String specName=req.getParameter("specName");
			
			Specalistdao dao=new Specalistdao(DBConnect.getConn());
			
			boolean f=dao.addSpecalist(specName);
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("sucMsg", "Specalist added Successfully");
				resp.sendRedirect("admin/index.jsp");
			}else {
				session.setAttribute("errorMsg", "Invalid details");
				resp.sendRedirect("admin/index.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
       
	
}
