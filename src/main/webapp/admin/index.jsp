<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="../component/allcss.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="com.db.DBConnect" %>
<%@ page import="java.util.List" %>
  <%@ page import="com.dao.AppointmentDao" %>
   <%@ page import="com.dao.UserDao" %>
   <%@ page import="com.dao.DoctorDao" %>
   <%@ page import="com.dao.Specalistdao" %>
   <%@ page import="com.entity.Doctor" %>
    <%@ page import="com.entity.Appointment" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@include file="navbar.jsp" %>


     <c:if test="${empty  adminObj}">
			 <c:redirect url="../admin_login.jsp"></c:redirect>
			                             
	 </c:if>

     <p class="text-center fs-3 mt-4 text-success">Admin DashBoard</p>


                           <c:if test="${not empty sucMsg}">
                               <p class="text-center text-success fs-3"> ${succMsg}</p>
                               <c:remove var="sucMsg" scope="session" />
                           </c:if>
                           
                           <c:if test="${not empty errorMsg}">
                               <p class="text-center text-danger fs-3"> ${errorMsg}</p>
                               <c:remove var="errorMsg" scope="session" />
                           </c:if> 

 <div class="container mt-5 p-5">
        <div class="row">
            <div class="col-md-4 " >
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
            <div class="col-md-4">
                <div class="card paint-card  p-2 ">
                    <div class="card-body">
                        <div class="d-flex justify-content-center">
                            <svg class="text-success" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.87 9.9 10 9.07l-.157-.085.843-.535c.22.263.482.54 0.822.816C12.15 11.106 12.28 11.95 12.276 12.804Z"/>
                            </svg>
                        </div>
                      <% UserDao daao=new UserDao(DBConnect.getConn()); %>
                        <h3 class="card-title text-center mt-2 text-success">User</h3>
                        <h4 class="card-text text-center text-success"><%= daao.getUserCount() %></h4>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card paint-card  p-2">
                    <div class="card-body">
                        <div class="d-flex justify-content-center">
                            <svg class="text-success" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
                                <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                            </svg>
                        </div>
                        <h3 class="card-title text-center mt-2 text-success">Total Appointment</h3>
                        <% AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
	                       int count=dao.countAppointment();%>
	                   <h4 class="card-text text-center text-success"><%= dao.countAppointment() %></h4>
	                       
                        
                    </div>
                </div>
            </div>
            <div class="col-md-4 mt-3 ">
                <div class="card paint-card  p-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <div class="card-body">
                        <div class="d-flex justify-content-center">
                            <svg class="text-success" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
                                <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
                            </svg>
                        </div>
                        <% Specalistdao dao3=new Specalistdao(DBConnect.getConn()); %>
                        <h3 class="card-title text-center mt-2 text-success">Specialist</h3>
                        <h4 class="card-text text-center text-success"><%= dao3.getSpecialistCount() %></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>




<!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Specialist</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="../addSpecialist" method="post">
        
           <div class="form-group">
              
              <label>Enter Name:</label>
              <input type="text" name="specName" class="form-control mt-2 paint-card"> 
              </div>
              
             <div class="text-center mt-3">
              <button type="Submit" class="btn btn-primary paint-card">Add</button>
             </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
     
      </div>
    </div>
  </div>
</div>

</body>
</html>