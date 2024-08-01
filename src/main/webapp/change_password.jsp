<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <%@ page import="com.dao.UserDao" %>
  
     <%@ page import="com.db.DBConnect" %>
   
    <%@ page import="com.entity.User" %>
   
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%@include file="component/allcss.jsp" %>
    <%@include file="component/navbar.jsp" %>
    <div class="m-3"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                 <div class="card paint-card">
                     <p class="fs-2 text-center">Change Password</p>
                     
                     
                     <c:if test="${not empty succMsg}">
                               <p class="text-center text-success fs-3"> ${succMsg}</p>
                               <c:remove var="succMsg" scope="session" />
                           </c:if>
                           <c:if test="${not empty errorMsg}">
                               <p class="text-center text-danger fs-3"> ${errorMsg}</p>
                               <c:remove var="errorMsg" scope="session" />
                           </c:if>
                           
                           
                     <div class="card-body">
                         <form action="changePassword" method="post">
                                 <div class="mb-3">
                                    <label class="form-label">Enter Old Password</label>
                                    <input type="text" class="form-control" name="oldpassword">
                                 </div>
                                 
                                 <div class="mb-3">
                                    <label class="form-label">Enter New Password</label>
                                    <input type="text" class="form-control" name="newpassword">
                                 </div>
                                 
                                 <% User u= (User) session.getAttribute("userObj"); 
                                    
                                 %>
                                 <input type="hidden" value="<%= u.getId() %>" name ="uid">
                               <input type="hidden" value="<%= u.getPassword() %>" name ="oldPassEntered">
                                 
                                 
                                <button class="btn btn-success col-md-12">Change Password</button>
                         </form>
                     </div>
                 </div>
            </div>
        </div>
    </div>