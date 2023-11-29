<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>

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

.logo img {
  position : relative;
  max-height: 150px;
  margin-right: 10px;
  margin-left: 10px;
  margin-top: 30px;
}

.centered-text {
    position: absolute;
    top: 27%;
    left: 27%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: white;
  }

.word {
    position : relative;
    font-weight: bold;
    color: aqua;
    text-align: center;
      display: inline-block;
      opacity: 0;
      transition: opacity 1s ease-in-out;
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
          <a class="nav-link text-white" href="SignIn.jsp" style="padding-left: 1050px">ADMIN</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="User.jsp">USER</a>
        </li>
          
      </ul>
    </div>
  </div>
</nav>

<div class="logo">
<img src="https://landconversion.karnataka.gov.in/rd/assets/img/bhoomi/karnataka.png">
</div>

<div class="centered-text">
<h3>Government of Karnataka</h3>
</div>

<br>
<br>
<br>

<div class="land">
<h1 align="center">
    <span class="word">WELCOME</span>
    <span class="word">TO</span>
    <span class="word">KARNATAKA</span>
    <span class="word">LAND</span>
    <span class="word">RECORDS</span>
  </h1>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
      const words = document.querySelectorAll('.word');

      function animateWords(index) {
        if (index < words.length) {
          words[index].style.opacity = 1;
          setTimeout(() => {
            animateWords(index + 1);
          }, 500); // Adjust the delay between words (in milliseconds)
        }
      }

      animateWords(0);
    });
  </script>
      
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