<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
  <%@ page import="com.dao.AppointmentDao" %>
  <%@ page import="com.dao.DoctorDao" %>
  
   <%@ page import="com.entity.Appointment" %>
    <%@ page import="com.entity.User" %>
    <%@ page import="com.entity.Doctor" %>
   
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="com.db.DBConnect" %>
  
<%@include file="component/allcss.jsp" %>
    <%@include file="component/navbar.jsp" %>
    
    
    
     <div class="container">
         <p class="text-center fs-2 text-white"></p>
         
     </div>
     
     <div class="container p-3">
         <div class="row">
               <div class="col-md-9">
                    <div class ="card paint-card">
                          <div class="card-body">
                               <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
                               <table class="table">
                                   <thead>
                                         <tr>
                                             <td scope="col">Full Name</td>
                                             <td scope="col">Gender</td>
                                             <td scope="col">age</td>
                                             <td scope="col">Appoint Date</td>
                                             <td scope="col">disease</td>
                                             <td scope="col">doctor name</td>
                                             <td scope="col">Status</td>
                                         </tr>
                                   </thead>
                                   
                                   <tbody>
                                   
     <%   
     User u=(User)session.getAttribute("userObj");
     int id = u.getId(); 
     AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
    List<Appointment> list=dao.getAllAppointmentByLoginUser(id);
    
    for(Appointment ap:list){
    	DoctorDao dao2=new DoctorDao(DBConnect.getConn());
        
        Doctor d=dao2.getDoctorById(ap.getDoctorId());
   
    
    
   %>
                                     <tr>
                                       <th><%= ap.getFullName() %></th>
                                       <td><%= ap.getGender() %></td>
                                       <td><%= ap.getAge() %></td>
                                       <td><%= ap.getAppoinDate() %></td>
                                       <td><%= ap.getDiseases() %></td>
                                       <td><%= d.getFullName()  %></td>
                                       <td>
                                       <% 
                                       if("Pending".equals(ap.getStatus())) { %>
                                       <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                   <%}else{%>
                                       <%= ap.getStatus() %>  
                                   <% } %>
                                       
                                       
                                       </td>
                                       
                                     </tr>
                                     
              <%} %>          
                                   </tbody>
                               </table>
                          </div>
                    </div>
               </div>
               <div class="col-md-3 p-3">
                  <img alt="img" src="img/doc5.jpg" height="300px" width="300px" class="paint-card mt-3">
               </div>
         </div>
     </div>