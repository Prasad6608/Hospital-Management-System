<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.List" %>
  <%@ page import="com.dao.AppointmentDao" %>
   <%@ page import="com.entity.Doctor" %>
    <%@ page import="com.entity.Appointment" %>
   
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="com.db.DBConnect" %>
  
  
			 <c:if test="${empty  doctorObj}">
			          <c:redirect url="../doctor_login.jsp"></c:redirect>
			 </c:if>
			 
     <%@include file="../component/allcss.jsp"%>
    <%@include file="navbar.jsp" %>
        <h1 class="text-center fs-3 m-3">Patient Details</h1>
     <c:if test="${not empty succMsg}">
                               <p class="text-center text-success fs-3"> ${succMsg}</p>
                               <c:remove var="succMsg" scope="session" />
                           </c:if>
    <div class="container p-3 paint-card">
    <table class="table">
        <thead>
             <tr>
                <th scope="col">FullName</th>
                <th scope="col">Gender</th>
                <th scope="col">Age</th>
                <th scope="col">Appointment Date</th>
                <th scope="col">Email</th>
                <th scope="col">MobNo</th>
                <th scope="col">Diseases</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
             </tr>
       </thead>
       
       <tbody>
       <% 
       Doctor d=(Doctor) session.getAttribute("doctorObj");
       int doct_id=d.getId();
       AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
       List<Appointment>list=dao.getAllAppointmentByDoctorLogin(doct_id);
       
       for(Appointment ap:list){
       %>
             <tr>
                  <th><%= ap.getFullName() %></th>
                  <td><%= ap.getGender() %></td>
                  <td><%=ap.getAge()  %></td>
                  <td><%=ap.getAppoinDate()  %></td>
                  <td><%= ap.getEmail() %></td>
                  <td><%= ap.getPhNo() %></td>
                  <td><%=ap.getDiseases()  %></td>
                  <td>             <% 
                                       if("Pending".equals(ap.getStatus())) { %>
                                       <a href="#" class="btn btn-sm btn-warning paint-card">Pending</a>
                                   <%}else{%>
                                       <%= ap.getStatus() %>  
                                   <% } %>
                                       </td>
                  <td>
                                  <%
                                  if("Pending".equals(ap.getStatus())) { %>
                                       <a href="comment.jsp?id=<%= ap.getId() %>" class="btn btn-sm btn-success paint-card">Comment</a>
                                   <%}else{%>
                                       <a href="#" class="btn btn-sm btn-success paint-card disabled">Comment</a> 
                                   <% } %>
                
                
                  </td>
             </tr>
       <%  } %>
       </tbody>
    </table>
    </div>