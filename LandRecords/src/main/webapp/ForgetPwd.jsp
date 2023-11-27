<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>

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

::-webkit-input-placeholder {
  /* Edge */
  color: rgba(255, 255, 255, 0.8);
}

:-ms-input-placeholder {
  /* Internet Explorer 10-11 */
  color: rgba(255, 255, 255, 0.8);
}

::placeholder {
  color: rgba(255, 255, 255, 0.8);
}

hr {
  border: none;
  border-top: 1px solid rgba(255, 255, 255, 0.5);
  margin: 15px 0;
}

body {
  background-image: url("https://cdn.create.vista.com/api/media/small/570173948/stock-photo-aerial-view-green-rice-paddy-field-farming-cultivation-agricultural-land");
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
  height: 120vh;
  width: 100vw;
  background-color: rgba(0, 0, 0, 0.5);
}

#wrapper {
  position: absolute;
  top: 60%;
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
  width: 500px;
  background: rgba(255, 255, 255, 0.3);
  color: white;
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.3);
  -webkit-backdrop-filter: blur(6px);
  backdrop-filter: blur(6px);
  border-radius: 10px;
  border: 1px solid rgba(255, 255, 255, 0.2);
  transition: 500ms;
}

#login,
#forgotpwd {
  padding: 22px;
}

.field {
  margin: 5px 0;
}

.field a {
  color: yellow;
}

input[type="text"],
input[type="email"],
input[type="number"],
input[type="password"] {
  margin: 5px 0;
  padding: 8px;
  font-size: 18px;
  width: 100%;
  border: 2px solid rgba(255, 255, 255, 0.5);
  background: none;
  color: white;
  border-radius: 5px;
}

input[type="text"]:focus-visible,
input[type="email"]:focus-visible,
input[type="number"]:focus-visible,
input[type="password"]:focus-visible {
  border-color: rgb(255 255 0 / 80%);
  outline: 1px solid rgb(255 255 0 / 90%);
}

label:not(label:last-child) {
  font-weight: bold;
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

.foot {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  margin: 15px 0 10px;
  gap: 10px;
}

.forgotpwd,
.login {
  cursor: pointer;
  color: yellow;
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
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
  
                <li class="nav-item"><a class="nav-link text-white" href="Index.jsp" style="padding-left: 1100px">HOME</a>
					</li>
      </ul>
    </div>
  </div>
</nav>

<div id="wrapper">
    <div class="container">
       <div class="box">
            
             <h5 style="color: orange;" align="center">${Login}</h5>
             <h5 style="color: red;" align="center">${Accont}</h5>
             
             <form id="forgotpwd" action="forget" method="post">
            
              <center><h2 class="title">Forgot Password</h2></center>

			<h6 style="color: orange;">${Checking}</h6>
			<h6 style="color: red;">${Foundotp}</h6>
			<h6 style="color: red;">${Findotp1}</h6>
			<h6 style="color: red;">${Findotp}</h6>
					 
		<hr>
        <div class="field">
          <label for="email">Email</label>
          <input id="email" type="email" name="email" value="<%= (request.getParameter("email") != null) ? request.getParameter("email") : "" %>" placeholder="example@gmail.com" required />
        </div>
        <h5 style="color: red;">${Email}</h5>
 		<p align="right"> <a href="ForgetPwd.jsp">Resend OTP</a></p>
		 <button type="submit" class="button">Send OTP</button>
				</form>
				
				<form id="login" action="checksotp" method="post">	 
				<hr>
				<div class="field">	                  
                <input name="email" type="hidden" value="${email}" >
                  <label for="otp">OTP</label>
                  <input type="number" name="otp" id="otp" placeholder="Enter OTP" required />
                  </div>
                <h6 style="color: orange;">${otpsent}</h6>
 				 	 
				<button type="submit" class="button">Submit</button>
				</form>	
				<br>
				
		</div>
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