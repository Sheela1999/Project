<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Records</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
<style type="text/css">
   
   @import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
   
   body {
  background-image: url("https://tourdefarm.in/wp-content/uploads/2021/01/Annapoorna-Farms-Karjat-1.jpg");
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

@media screen and (max-width: 715px) {
  body,
  body::before {
    height: 950px;
  }
   
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light text-white " style="background-color:#0d6efd;">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#" style="padding-right: 10px;">LandRecords</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <h5 style="color: white; padding-left: 950px;">${Admin.adminName}</h5>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      <li class="nav-item">
                    <a class="nav-link text-white" href="SignIn.jsp" role="button">LOGOUT</a>
                </li>
          <li class="nav-item">
          <a class="nav-link text-white" href="User.jsp">HOME</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div id="wrapper">
	<div class="container">

		<h1 align="center"><b style="color: white;">Land Records</b></h1>
		<h5 style="color: red">${nameError}</h5>
		<h5 style="color: red">${pnError}</h5>
		<h5 style="color: red">${anError}</h5>
		<h5 style="color: red">${hnSnError}</h5>
		
		<br> 
		<br>
		<form class="form" action="edit" method="post">
			<div class="row">
				<div class="col-md-3">

					<label class="form-lbl"><b style="color: white;">Owner Name</b></label> <input
						type="text" name="ownerName" class="form-control" id=""
						placeholder="">
				</div>
				
				&nbsp; &nbsp;&nbsp;
				<div class="col-md-3">

					<label class="form-lbl"><b style="color: white;">Mobile Number</b></label> <input
						type="number" name="mobileNumber" class="form-control" id=""
						placeholder="">
				</div>
				
				&nbsp; &nbsp;&nbsp;
				<div class="col-md-3">
					<fieldset class="form-group">
						<label class="form-lbl"><b style="color: white;">Aadhar number</b></label> <input
							type="number" name="aadharNumber" class="form-control" id=""
							placeholder="">
					</fieldset>
				</div>

			</div>

			<div class="row">

				<div class="col-md-3">
					<div class="form-group">
						<label class="form-lbl"> <b style="color: white;">Hissa Number</b></label> <input
							type="number" name="hissaNumber" class="form-control"
							value="${param.hissaNumber}" id="" placeholder="" readOnly>
					</div>

				</div>

				&nbsp; &nbsp;&nbsp; &nbsp;
				<div class="col-md-3">
					<fieldset class="form-group">
						<label class="form-lbl"> <b style="color: white;">Survey Number</b></label> <input
							type="number" name="surveyNumber" class="form-control"
							value="${param.surveyNumber}" id="" placeholder="" readOnly>
					</fieldset>
				</div>
			</div>
			<br>

			<center><button type="submit" class="btn btn-warning" style="padding-right: 40px; padding-left: 40px;">
			<b style="color: white;">Edit</b></button></center>
		</form>
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