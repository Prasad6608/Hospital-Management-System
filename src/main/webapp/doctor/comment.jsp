 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="com.dao.AppointmentDao" %>
 <%@ page import="com.db.DBConnect" %>
 <%@ page import="com.entity.Appointment" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
  			 <c:if test="${empty  doctorObj}">
			      <c:redirect url="../doctor_login.jsp"></c:redirect>
			 </c:if>
			 
 <%@include file="/component/allcss.jsp" %>
    <%@include file="navbar.jsp" %>
    
    <div class="container-fluid backImg p-5">
          <p class="text-center fs-2 text-white"></p>
    </div>
    
    <div class="container p-3">
          <div class="row">
                <div class="col-md-6 offset-md-3">
                     <div class="card paint-card">
                          <div class="card-body">
                          <p class="text-center fs-4">Patient Comment</p>
                           
                           <c:if test="${not empty errorMsg}">
                               <p class="text-center text-success fs-3"> ${errorMsg}</p>
                               <c:remove var="errorMsg" scope="session" />
                           </c:if>
                          <%
                          int id=Integer.parseInt(request.getParameter("id"));
                          AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
                          Appointment ap=dao.getAppointmentById(id);
                          %>
                          
                          <form action="../updateStatus" method="post" class="row">
                             <div class="col-md-6"> 
                               <label class="form-label">Patient Name</label>
                               <input type="text" class="form-control" readonly value="<%= ap.getFullName() %>">
                               </div>
                               
                                <div class="col-md-6"> 
                               <label class="form-label">age</label>
                               <input type="text" class="form-control" readonly value="<%= ap.getAge() %>">
                               </div>
                               
                                <div class="col-md-6"> 
                               <label class="form-label">MobNo</label>
                               <input type="text" class="form-control" readonly value="<%= ap.getPhNo() %>">
                               </div>
                               
                                <div class="col-md-6"> 
                               <label class="form-label">Diseases</label>
                               <input type="text" class="form-control" readonly value="<%= ap.getDiseases() %>">
                               </div>
                               
                                 <div class="col-md-12"> 
                               <label class="form-label">Comment</label>
                               <textarea rows="3" cols="" class="form-control" name="comm"></textarea>
                               </div>
                               
                               <input type="hidden" name="id" value="<%= ap.getId()   %>">
                                <input type="hidden" name="did" value="<%= ap.getDoctorId() %>">
                                
                                <button class="mt-3 btn btn-success col-md-6 offset-md-3 ">Submit</button>
                          </form>
                          </div>
                     </div>
                </div>
          </div>
    </div>