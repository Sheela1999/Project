<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
.model {
	color: red;
}

#header {
	background-color: maroon;
	color: white;
	text-align: center;
	font-weight: bolder;
}

.h6 {
	color: red;
}

#button {
	text-align: center;
}

#privacy {
      margin-left: 300px;
}

</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-primary" style="height: 60px;">
		<div class="container-fluid">
			<a class="navbar-brand mt-2 mt-lg-0" href="#">
				<h5 class="pt-1"  style="color: white;">LandRecord</h5>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="Index.jsp" style="color: white;">HOME</a>
					</li>
				</ul>
			</div>			
		</div>
	</nav>

	<!-- Add Bootstrap JS (Popper.js and jQuery are required) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<form action="login" method="get">

					<div class="form-group">
						<label for="email"> </label> <input type="email" name="email"
							class="form-control" id="email" value="<%= (request.getParameter("email") != null) ? request.getParameter("email") : "" %>" placeholder="Enter Email Address" required>
					</div>
					
					<h6 class="model">${IsEmailValid}</h6>
					
					<h6 class="model">${IsAccountExist}</h6>
					
					 <center><button style="text-align: center;"  type="submit" class="btn btn-primary">Send OTP</button></center>
                     </form>
                     <form action="sendOTP" method="post">
					<div class="form-group">
					 <input name="email" type="hidden" value="${email1}" >
						<label for="otp"> </label> <input type="number" name="otp"
							class="form-control" id="otp" placeholder="Enter OTP">
					</div>
					<h6 class="model">${IsOTPvalid}</h6>

					<center><button  style="text-align: center;" type="submit" class="btn btn-primary">SignIn</button></center>
				</form>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<div style="height: 239px"></div>

	<footer class="footer bg-dark text-light py-3">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<p>
						<a href="sheela.xworkz@gmail.com">&copy; 2023 LandRecorder.
							All rights reserved.</a>
					</p>
				</div>
				<div class="col-md-6 text-right">
					<p>
						<a href="#" id="privacy">Privacy Policy</a> | <a href="#" id="terms">Terms of Service</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>