<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List" %>
  <%@ page import="com.dao.AppointmentDao" %>
   <%@ page import="com.dao.UserDao" %>
   <%@ page import="com.dao.DoctorDao" %>
   <%@ page import="com.dao.Specalistdao" %>
   <%@ page import="com.entity.Doctor" %>
    <%@ page import="com.entity.Appointment" %>
   
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="com.db.DBConnect" %>
  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
             <c:if test="${empty  doctorObj}">
			 <c:redirect url="../doctor_login.jsp"></c:redirect>
			 </c:if>
			 
    <%@include file="../component/allcss.jsp"%>
    <%@include file="navbar.jsp" %>
    
    <h1 class="text-center fs-3 m-3">Doctor Dashboard</h1>
    
    <div class="container p-5">
       <div class="row">
	            <div class="col-md-4 offset-md-2" >
	                <div class="card paint-card  p-2">
	                    <div class="card-body" >
	                        <div class="d-flex justify-content-center">
	                            <svg class="text-success" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
	                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
	                            </svg>
	                        </div>
	                        <% DoctorDao dao2=new DoctorDao(DBConnect.getConn()); %>
	                        <h3 class="card-title text-center mt-2 text-success">Doctor</h3>
	                        <h4 class="card-text text-center text-success"><%= dao2.getDoctorCount() %></h4>
	                    </div>
	                </div>
	            </div>
	            
	            
	            
	            
               <div class="col-md-4 ">
                <div class="card paint-card  p-2 ">
                    <div class="card-body">
                        <div class="d-flex justify-content-center">
                            <svg class="text-success" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.87 9.9 10 9.07l-.157-.085.843-.535c.22.263.482.54 0.822.816C12.15 11.106 12.28 11.95 12.276 12.804Z"/>
                            </svg>
                        </div>
                          <% 
                        AppointmentDao dao1=new AppointmentDao(DBConnect.getConn());
                        Doctor d=(Doctor) session.getAttribute("doctorObj");
                        
                        %>
                        <h3 class="card-title text-center mt-2 text-success">Total Appointment</h3>
                        <h4 class="card-text text-center text-success"><%= dao1.countAppointmentByDoctor(d.getId()) %></h4>
                    </div>
                </div>
            </div>
       </div>
    </div>
</body>
</html>