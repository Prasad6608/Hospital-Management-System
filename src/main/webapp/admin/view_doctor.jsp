<%@ page language="java" contentType="text/html; charset=UTF-8"%>
   
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.List" %>
  <%@ page import="com.dao.Specalistdao" %>
  <%@ page import="com.dao.DoctorDao" %>
   <%@ page import="com.entity.Specalist" %>
   <%@ page import="com.entity.Doctor" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="com.db.DBConnect" %>

  <%@include file="../component/allcss.jsp" %>

   <%@include file="navbar.jsp" %>
    
     <c:if test="${empty  adminObj}">
			 <c:redirect url="../admin_login.jsp"></c:redirect>
			                             
	 </c:if>
<div class="container-fluid p-3 mt-5">
    
       <div class="row">
 <div class="col-md-12">
              <div class="card paint-card">
                   <div class="card-body">
                        <p class="fs-3 text-center">Doctor Details</p>
                        <c:if test="${not empty succMsg }">
                               <p class="text-center text-success fs-3"> ${ succMsg}</p>
                               <c:remove var="succMsg" scope="session" />
                           </c:if>
                           
                           <c:if test="${not empty errorMsg }">
                               <p class="text-center text-danger fs-3"> ${ errorMsg}</p>
                               <c:remove var="errorMsg" scope="session" />
                           </c:if>
                        <table class="table">
                           <thead>
                             <tr>
                                  <th scope="col">Full Name</th>
                                  <th scope="col">Dob</th>
                                  <th scope="col">Qualificatiom</th>
                                  <th scope="col">Specialist</th>
                                  <th scope="col">Email</th>
                                  <th scope="col">MobNo</th>
                                  <th scope="col">Action</th>
                             </tr>
                           </thead>
                           
                           <tbody>
                                 <%
                                 DoctorDao dao2=new DoctorDao(DBConnect.getConn());
                              List<Doctor>list2=   dao2.getAllDoctor();
                                 for(Doctor d:list2){ %>
                                	  <tr>
                                	       <td><%= d.getFullName() %></td>
                                	       <td><%= d.getDob() %></td>
                                	       <td><%= d.getQualification() %></td>
                                	       <td><%= d.getSpecialist() %></td>
                                	       <td><%= d.getEmail() %></td>
                                	       <td><%= d.getMobNo() %></td>
                                	       <td>
                                	              <a href= "edit_doctor.jsp?id=<%= d.getId() %>"   class="btn btn-sm btn-primary">Edit</a>
                                	               <a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                                	       </td>
                                	  </tr>
                                <% } %> 
                                
                           </tbody>
                        </table>
                   </div>
              </div>
         </div>
                       </div>
         </div>
  
