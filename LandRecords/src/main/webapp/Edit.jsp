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

</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Navbar brand -->
			<a class="navbar-brand mt-2 mt-lg-0" href="#">
				<h5 class="pt-1">LandRecord</h5>
			</a>
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#">Dashboard</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="admin.jsp">LogOut</a>
					</li>
				</ul>

			</div>
			<!-- Collapsible wrapper -->
		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->
	<div class="container">

		<br>
		<h1 align="center">Land Records</h1>
		<h5 style="color: green">${Edited}</h5>
		<br> <br>
		<form class="form" action="edit" method="post">
			<div class="row">
				<div class="col-md-3">

					<label class="form-lbl"><b>Owner Name</b></label> <input
						type="text" name="ownerName" class="form-control" id=""
						placeholder="">

				</div>
				<h5 style="color: red">${nameError}</h5>
				&nbsp; &nbsp;&nbsp;
				<div class="col-md-3">

					<label class="form-lbl"><b>Mobile Number</b></label> <input
						type="number" name="mobileNumber" class="form-control" id=""
						placeholder="">

				</div>
				<h5 style="color: red">${pnError}</h5>
				&nbsp; &nbsp;&nbsp;
				<div class="col-md-3">
					<fieldset class="form-group">
						<label class="form-lbl"><b>Aadhar number</b></label> <input
							type="number" name="aadharNumber" class="form-control" id=""
							placeholder="">
					</fieldset>
				</div>
				<h5 style="color: red">${anError}</h5>

			</div>

			<div class="row">

				<div class="col-md-3">
					<div class="form-group view-password">
						<label class="form-lbl"> <b>Hissa Number</b></label> <input
							type="number" name="hissaNumber" class="form-control"
							value="${param.hissaNumber}" id="" placeholder="" readOnly>
					</div>

					<h5 style="color: red">${hnError}</h5>

				</div>

				&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
				<div class="col-md-3">
					<fieldset class="form-group">
						<label class="form-lbl"> <b>Survey Number</b></label> <input
							type="number" name="surveyNumber" class="form-control"
							value="${param.surveyNumber}" id="" placeholder="" readOnly>
					</fieldset>
				</div>
				&nbsp; &nbsp;
				<h5 style="color: red">${snError}</h5>
			</div>
			<br>

			<center><button type="submit" class="btn btn-primary">Edit</button></center>
		</form>
	</div>

</body>
</html>