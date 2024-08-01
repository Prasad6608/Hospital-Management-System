<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.entity.Doctor" %>
      <%@ page import="com.dao.DoctorDao" %>
    
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
  <%@ page import="com.dao.AppointmentDao" %>
  <%@ page import="com.entity.Appointment" %>
  <%@ page import="com.db.DBConnect" %>
  
 <%@include file="../component/allcss.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@include file="navbar.jsp" %>
    
             <c:if test="${empty  adminObj}">
			      <c:redirect url="../admin_login.jsp">
			 </c:redirect>
			                             
	        </c:if>
	        
	        <div class="col-md-12 m-1">
	             <div class="card paint-card">
	                <div class="card-body">
	                    <p class="fs-2 text-center">All Patients</p>
	                    <table class="table">
	                        <thead>
	                            <tr>
	                            
	                              <th scope="col">Full Name</th>
	                              <th scope="col">Gender</th>
	                              <th scope="col">Age</th>
	                              <th scope="col">Appointment</th>
	                              <th scope="col">Email</th>
	                              <th scope="col">MobNo</th>
	                              
	                              <th scope="col">Diseases</th>
	                              <th scope="col">Doctor name</th>
	                              <th scope="col">Address</th>
	                              <th scope="col">status</th>
	                            </tr>
	                        </thead>
	                        
	                        <tbody>
	                        
	                           <% AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
	                           List<Appointment>list=dao.getAllAppointment();
	                           
	                           
	                           for(Appointment ap:list){%>
	                           
	                      
	                           <tr>
	                             <th><%=ap.getFullName() %></th>
	                             <td><%=ap.getGender() %></td>
	                             <td><%= ap.getAge()  %></td>
	                             
	                             <td><%= ap.getAppoinDate() %></td>
	                             <td><%= ap.getEmail() %></td>
	                             <td><%= ap.getPhNo() %></td>
	                             <td><%=ap.getDiseases() %></td>
	                             <% DoctorDao dao2=new DoctorDao(DBConnect.getConn());
	                             int id=ap.getDoctorId();
	                                Doctor d=dao2.getDoctorById(id);
	                             %>
	                             <td><%= d.getFullName() %></td>
	                             <td><%= ap.getAddress() %></td>
	                             <td><% 
                                       if("Pending".equals(ap.getStatus())) { %>
                                       <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                   <%} else {%>
                                       <%= ap.getStatus() %>  
                                   <% } %></td>
	                           </tr>
	                           
	                           <% } %>
	                        </tbody>
	                    </table>
	                </div>
	             </div>
	        </div>
	 
	 