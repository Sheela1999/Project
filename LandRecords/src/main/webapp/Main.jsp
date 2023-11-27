<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Main Page</title>

<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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
  background-image: url("https://www.ugaoo.com/cdn/shop/articles/shutterstock_391127050.jpg?v=1661876959");
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

.button {
  width: 100%;
  padding: 10px;
  font-size: 20px;
  border-radius: 5px;
  border: none;
  margin: 15px 0 0;
  cursor: pointer;
  background-color: rgb(255 255 0 / 60%);
  color: white;
  font-weight: bold;
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
    
    <h5 style="color: white; padding-left: 1000px;">${Admin.adminName}</h5>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
          <li class="nav-item">
          <a class="nav-link text-white" href="Index.jsp">HOME</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

	<div id="wrapper">
	
	<div class="container" style="text-align: center">

				<a class="btn btn-warning" href="Save.jsp" role="button"
					style="font-weight: bold; color: white;">ADD RECORDS</a> &nbsp; &nbsp; <a class="btn btn-warning"
					href="Read.jsp" role="button"
					style="font-weight: bold; color: white;">VIEW RECORDS</a>
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