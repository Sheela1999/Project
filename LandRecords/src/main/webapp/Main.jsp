<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
#land {
	color: white;
}

#adminName {
	color: white;
	padding-left: 1000px;
}

#logout {
	color: white;
}

button {
	margin-left: 500px;
}
</style>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-primary">
			<div class="container">
				<a class="navbar-brand" id="land" href="#">LandRecords</a>
				<div class="collapse navbar-collapse" id="navbarNav">
					<a class="navbar-brand" id="adminName"><span
						style="color: primary;"></span>${dto.adminName}</a>
				</div>
			</div>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" id="logout"
					href="SignIn.jsp">LogOut</a></li>
			</ul>
		</nav>
	</header>

	<div style="height: 100px"></div>

	<a href="Save.jsp"><button class="btn btn-primary" type="submit">AddRecords</button></a>
	<a href="Read.jsp"><button class="btn btn-primary" type="submit">ViewRecords</button></a>

	<br>
	<br>

	<div class="container" style="text-align: center">

		<br> <a class="btn btn-primary" href="read.jsp" role="button">Add
			Records</a> &nbsp; &nbsp; <a class="btn btn-primary" href="search.jsp"
			role="button">View Records</a>
	</div>


	<div style="height: 523px"></div>

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