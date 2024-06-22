<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.db.DBConnect" %>
    <%@page import="java.sql.Connection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index page</title>

<%@include file="component/allcss.jsp" %>
</head>
<body>
   

  <%@include file="component/navbar.jsp" %>

<% Connection conn=DBConnect.getConn();
out.print(conn);
%>


    
  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/hos2.jpeg" class="d-block w-100" alt="..." height="500px">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Some representative placeholder content for the first slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/hos3.jpeg" class="d-block w-100" alt="..." height="500px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Some representative placeholder content for the second slide.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="img/hos4.jpeg" class="d-block w-100" alt="..." height="500px">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Some representative placeholder content for the third slide.</p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

 <div class="container">
        <h1 class="text-center mb-5 mt-3">Key Features of our Hospital</h1>
        <div class="row">
            <div class="col-md-3">
                <div class="card mb-4 p-3 paint-card">
                    <h3 class="card-title">100% Safety</h3>
                    <p class="card-text">Pateint safety is our first priority our doctors will take care of pateints,hence dont worry abou safety</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card mb-4 p-3 paint-card">
                    <h3 class="card-title">Clean Environment</h3>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, inventore</p>
                </div>
            </div>
            <div class="col-md-3 ">
                <div class="card mb-4 p-3 paint-card">
                    <h3 class="card-title">Friendly Doctors</h3>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, inventore</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card mb-4 p-3 paint-card">
                    <h3 class="card-title">Medical Research</h3>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, inventore</p>
                </div>
            </div>
        </div>
    </div>
 
 <div class="container mt-5">
        <h2 class="text-center mb-5">Our Team</h2>
        <div class="row">
            <div class="col-md-3 mb-4">
                <div class="card paint-card">
                    <img src="img/beautiful-young-female-doctor-looking-camera-office_1301-7807.avif" class="card-img-top" alt="Samuani Simi" height="300px">
                    <div class="card-body">
                        <h5 class="card-title">Jos Buttler</h5>
                        <p class="card-text">CEO and Chairman</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card paint-card">
                    <img src="img/finaldoctor.jpg" class="card-img-top" alt="Dr.Siva Kumar" height="300px">
                    <div class="card-body">
                        <h5 class="card-title">Dr.Siva Kumar</h5>
                        <p class="card-text">Chief Doctor</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card paint-card">
                    <img src="img/doc5.jpg" class="card-img-top" alt="Dr. Niuise Paule" height="300px">
                    <div class="card-body">
                        <h5 class="card-title">Dr. Niuise Paule</h5>
                        <p class="card-text">Chief Doctor</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <div class="card paint-card">
                    <img src="img/doc6.jpg" class="card-img-top" alt="Dr. Mathue Samuel" height="300px">
                    <div class="card-body">
                        <h5 class="card-title">Dr. Mathue Samuel</h5>
                        <p class="card-text">Chief Doctor</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
              <%@include file="component/footer.jsp" %> 
</body>
</html>