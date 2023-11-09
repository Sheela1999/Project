<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
#land {
	color: white;
}

#admin {
	color: white;
}

#user {
	color: white;
}

#privacy {
      margin-left: 300px;
}

</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-primary">
		<div class="container">
			<a class="navbar-brand" id="land" href="#">LandRecords</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" id="admin"
						href="SignIn.jsp">Admin</a></li>
					<li class="nav-item"><a class="nav-link" id="user"
						href="User.jsp">User</a></li>
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
						<a href="#" id="privacy">Privacy Policy</a> | <a href="#" id="terms">Terms of Service</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>