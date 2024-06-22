<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user login page</title>
<%@include file="component/allcss.jsp" %>



</head>
<body>
<%@include file="component/navbar.jsp" %>

      <div class="container p-5">
          <div class="row">
              <div class="col-md-4 offset-md-4">
                  <div class="card paint-card">
                       <div class="card-body">
                           <p class="fs-4 text-center">User Login</p>
                           
                           <form action="#" method="post">
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
                           </br> Dont have an account <a href="signup.jsp" class=" text-decoration-none">create one</a>
                           
                       </div>
                  </div>
              </div>
           </div>
       </div>
</body>
</html>