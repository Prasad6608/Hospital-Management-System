<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.List" %>
  <%@ page import="com.dao.Specalistdao" %>
  <%@ page import="com.dao.DoctorDao" %>
   <%@ page import="com.entity.Specalist" %>
   <%@ page import="com.entity.Doctor" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ page import="com.db.DBConnect" %>
    
    <%@include file="component/allcss.jsp" %>
    <%@include file="component/navbar.jsp" %>
    <div class="container p-3">
        
     
        <div class="row">
              <div class="col-md-4 p-3">
                    <img alt="" src="img/doc6.jpg" height="400px" width="400px" class="paint-card">
              </div>
              
              <div class="col-md-8">
                   <div class="card paint-card">
                        <div class="card-body">
                              <p class="text-center fs-3">User Apponitment</p>
                              
                               <c:if test="${not empty succMsg}">
                               <p class="text-center text-success fs-3"> ${succMsg}</p>
                               <c:remove var="succMsg" scope="session" />
                           </c:if>
                           <c:if test="${not empty errorMsg}">
                               <p class="text-center text-success fs-3"> ${errorMsg}</p>
                               <c:remove var="errorMsg" scope="session" />
                           </c:if>
                           
                           <form class="row g-3" action="addAppointment" method="post">
                           
                               <input type="hidden" name="userid" value="${userObj.id}">
                               
                               <div class="col-md-6"> 
                               <label class="form-label">Full Name</label>
                               <input type="text" class="form-control" name="fullname" placeholder="Full Name">
                               </div> 
                               
                                <div class="col-md-6"> 
                               <label class="form-label">Gender</label>
                               <select class="form-control" name="gender">
                                     <option value="male">Male</option>
                                     <option value="female">Female</option>
                               </select>
                               </div> 
                               
                                <div class="col-md-6"> 
                               <label class="form-label">age</label>
                               <input type="text" class="form-control" name="age" placeholder="age">
                               </div>
                               
                                <div class="col-md-6"> 
                               <label class="form-label" >Appointment Date</label>
                               <input type="date" class="form-control" name="date" placeholder="Appointment Date">
                               </div> 
                               
                               <div class="col-md-6"> 
                               <label >Email</label>
                               <input type="email" class="form-control" name="email" placeholder="email">
                               </div> 
                             
                               <div class="col-md-6"> 
                               <label class="form-label">Mobile No</label>
                               <input type="text" class="form-control" name="phno" placeholder="Mob no">
                               </div>  
                             
                               <div class="col-md-6"> 
                               <label class="form-label">Deasease</label>
                               <input type="text" class="form-control" name="disis">
                               </div>  
                               
                                <div class="col-md-6">
                                <label class="form-label" for="doctor">Doctor</label>
                                <select  class="form-control"  name="doct">
                                     <option >----Select Doctor -------</option>
                                     <% DoctorDao dao=new DoctorDao(DBConnect.getConn());
                                		List<Doctor>list=dao.getAllDoctor();
                                		
                                		for(Doctor d:list){ %>
                                			<option value="<%= d.getId() %>"><%= d.getFullName() %> (<%= d.getSpecialist() %>)</option>
                                	<% 	}
                                     %>
                                    
                               </select>
                                </div>  
                                
                                 <div class="col-md-12"> 
                               <label class="form-label">Full Address</label>
                               <input type="text" class="form-control" name="address" placeholder="Address">
                               </div> 
                               
                               <c:if test="${ empty userObj }">
                               <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                               </c:if>
                               
                               <c:if test="${not empty userObj }">
                               
                               <button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                               </c:if>
                               
                               
                           </form>
                        </div>
                   </div>
              </div>
        </div>
    </div>
   