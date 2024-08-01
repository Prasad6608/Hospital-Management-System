<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 
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
       
            <div class="col-md-5 offset-md-4">
            
                <div class="card paint-card">
                    
                    <div class="card-body">
                    
                    <p class="fs-3 text-center"> Add Doctor</p>
                    
                     <c:if test="${not empty succMsg }">
                               <p class="text-center text-success fs-3"> ${ succMsg}</p>
                               <c:remove var="succMsg" scope="session" />
                           </c:if>
                           
                           <c:if test="${not empty errorMsg }">
                               <p class="text-center text-danger fs-3"> ${ errorMsg}</p>
                               <c:remove var="errorMsg" scope="session" />
                           </c:if>
        <form action="../addDoctorr" method="post">
             <div class="mb-3">
                
                    <label >Full Name</label>
                    <input type="text" class="form-control" name="fullname" placeholder="Full Name">
             </div>   
               
              <div class="mb-3"> 
                    <label >DOB</label>
                    <input type="date" name="dob" class="form-control"  placeholder="Dob">
               </div> 
                
                
                 <div class="mb-3"> 
                    <label >Qualification</label>
                    <input type="text" class="form-control" name="quali" placeholder="Qualification">
                 </div> 
                
                <div class="mb-3"> 
                     <label>Specialist</label>
                    <select name="spec" class="form-control">
                      
                     
                    <%   Specalistdao dao=new Specalistdao(DBConnect.getConn()); 
                         List<Specalist> list = dao.getAllSpecialist();
                         for(Specalist s:list){  %>
                        	 
                        	  <option><%= s.getSpecialistName() %></option>
                        	 
                         <% } %>
                     
                        
                       
                      
                       
                    </select>
               </div> 
           
                  <div class="mb-3"> 
                    <label >Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Email">
                 </div> 
                 
                   <div class="mb-3"> 
                    <label >Mob No:</label>
                    <input type="text" class="form-control" name="mobno" placeholder="mob no">
                 </div>
                 
                  <div class="mb-3"> 
                    <label >Password:</label>
                    <input type="text" class="form-control" name="password" placeholder="password">
                 </div>
          
            <button type="submit" class="btn btn-success">Submit</button>
        </form>
        </div>
        </div>
        </div>
         </div>
        </div> 
         
         
        
    

