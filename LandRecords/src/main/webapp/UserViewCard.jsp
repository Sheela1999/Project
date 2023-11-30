<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>

<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-image: url("https://images.pexels.com/photos/5806539/pexels-photo-5806539.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center;
  /*   height: 100vh; */
  height: 100vh;
  width: 100vw;
  font-family: "Poppins", sans-serif;
  position: relative;
  overflow-x: hidden;
}

/* overlay */
body::before {
  position: absolute;
  content: "";
  height: 100vh;
  width: 100vw;
  background-color: rgba(0, 0, 0, 0.5);
}

#wrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100vw;
  margin: auto;
}

.container {
  display: flex;
  align-items: flex-start;
  justify-content: center;
  gap: 1em;
  flex-wrap: wrap;
}

.box {
  width: 350px;
  background: rgba(255, 255, 255, 0.3);
  color: white;
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.3);
  -webkit-backdrop-filter: blur(6px);
  backdrop-filter: blur(6px);
  border-radius: 10px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  transition: 500ms;
}

.box h5, h6 {
  color: white;
}

@media screen and (max-width: 715px) {
  body,
  body::before {
    
  }
}
  </style>
  
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light text-white " style="background-color:#0d6efd;">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#">LandRecords</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      <li class="nav-item">
                    <a class="nav-link text-white" href="UserSignIn.jsp" role="button" style="padding-left: 1050px">LOGOUT</a>
                </li>
          <li class="nav-item">
          <a class="nav-link text-white" href="Index.jsp">HOME</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div id="wrapper">
	<div class="container" style="text-align: center">

<center>
  <div class="box">
    <br>
    <h5 class="box-title" style="color: white;">LAND OWNER DETAILS</h5>
    <br>
    <img src="${read.image}" alt="IMAGE" class="box-subtitle mb-2" style="color: #0edde8;">
    <br>
    <h6 class="box-subtitle mb-2">
      <span style="color: #0edde8;">OWNER NAME:</span> ${read.ownerName}
    </h6>
    <br>
    <h6 class="box-subtitle mb-2">
      <span style="color: #0edde8;">AADHAR NUMBER:</span> ${read.aadharNumber}
    </h6>
    <br>
    <h6 class="box-subtitle mb-2">
      <span style="color: #0edde8;">MOBILE NUMBER:</span> ${read.mobileNumber}
    </h6>
    <br>
    <h6 class="box-subtitle mb-2">
      <span style="color: #0edde8;">YEAR OF REGISTRATION:</span> ${read.year}
    </h6>
    <br>
  </div>
</center>

  
   </div>  
</div>
 
  
  <footer class="bg-primary text-center text-white fixed-bottom">
		<!-- Copyright -->
		<div class="text-center p-3" style="background-color: #343a40;">
			© 2023 Copyright: <a class="text-white"
				href="sheela.xworkz@gmail.com">LandRecords</a>
		</div>
		<!-- Copyright -->
	</footer>
	<!-- Footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>