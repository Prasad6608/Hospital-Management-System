<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false" %>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       
       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin login page</title>
<%@include file="component/allcss.jsp" %>

</head>
<body>
<%@include file="component/navbar.jsp" %>


			
			
			
     <div class="container p-5">
          <div class="row">
              <div class="col-md-4 offset-md-4">
                  <div class="card paint-card">
                       <div class="card-body">
                           <p class="fs-4 text-center">Admin Login</p>
                           
                           <c:if test="${not empty sucMsg}">
                               <p class="text-center text-success fs-3"> ${sucMsg}</p>
                               <c:remove var="sucMsg" scope="session" />
                           </c:if>
                           
                           <c:if test="${not empty errorMsg}">
                               <p class="text-center text-danger fs-3"> ${errorMsg}</p>
                               <c:remove var="errorMsg" scope="session" />
                           </c:if> 
                           <form action="adminLogin" method="post">
                               <div class="mb-3">
                                   <label class="form-label">Email Adress</label>  <input required
                                   name="email" type="email" class="form-control">
                               </div>
                                <div class="mb-3">
                                   <label class="form-label">Password</label>  <input required
                                   name="password" type="password" class="form-control">
                               </div>
                               
                               <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                           </form>
                       </div>
                  </div>
              </div>
           </div>
       </div>
       
</body>
</html>