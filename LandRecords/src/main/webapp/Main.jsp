<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Main Page</title>

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

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Navbar brand -->
			<a class="navbar-brand mt-2 mt-lg-0" href="#">
				<h5 class="pt-1">LandRecord</h5>
			</a>
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<h3 style="color: white; padding-left: 950px;">${Admin.adminName}</h3>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					<li class="nav-item"><a class="nav-link" href="SignIn.jsp" role="button" style="padding-left: 20px;">LOGOUT</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Index.jsp">HOME</a>
					</li>
				</ul>

				<!-- Right elements -->
			</div>
			<!-- Collapsible wrapper -->
		</div>
		<!-- Container wrapper -->
	</nav>
	
	<!-- Add Bootstrap JS (Popper.js and jQuery are required) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<img alt="image" src="${Admin.adminImagePath}">

	<div style="height: 100px"></div>

	<div class="container" style="text-align: center">

		<br> <a class="btn btn-primary" href="Save.jsp" role="button">Add
			Records</a> &nbsp; &nbsp; <a class="btn btn-primary" href="Read.jsp"
			role="button">View Records</a>
	</div>

	<div style="height: 329px"></div>

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
						<a href="#" id="privacy">Privacy Policy</a> | <a href="#"
							id="terms">Terms of Service</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>