
 <!--<%@include file="../component/allcss.jsp" %> -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
 rel="stylesheet" >
      <%@page isELIgnored="false" %>
 
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
 ></script>
    
     <%@include file="../component/allcss.jsp" %>


     
      <nav class="navbar navbar-expand-lg navbar-light bg-success">
    <div class="container-fluid">
      <!-- Element at the start -->
      <a class="navbar-brand text-white" href="../index.jsp"><i class="fa-solid fa-house-chimney-medical me-1"></i>MediLife</a>
      
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav " style="margin-left:-10px;">
          <!-- Three elements at the middle -->
          <li class="nav-item">
            <a class="nav-link navbar-brand text-white" href="index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link navbar-brand text-white" href="doctor.jsp"> Add Doctor</a>
          </li>
          <li class="nav-item">
            <a class="nav-link navbar-brand text-white" href="view_doctor.jsp">View Doctor</a>
          </li>
          <li class="nav-item">
            <a class="nav-link navbar-brand text-white" href="patient.jsp">Patients</a>
          </li>
           
          
        </ul>



 

</div>
  <div class="collapse navbar-collapse" id="navbarNav" style="margin-left:700px;">
 <form class="navbar-nav">
      <div class="dropdown ">
           <button class="btn btn-light dropdown-toggle" type="button"
           id="dropdownMenuButton1" data-bs-toggle="dropdown"
           aria-expanded="false">Admin</button>
           
            <ul class="dropdown-menu " aria-labelledby="dropdownMenuButton1">
            <li><a class="dropdown-item text-danger" href="adminLogout">logout</a></li>
            </ul>
      </div>
</form>
</div>
</div>

<!--
  <a href="adminLogout" class="text-white bg-danger" >Logout</a>
    --> 
  </nav>
    
