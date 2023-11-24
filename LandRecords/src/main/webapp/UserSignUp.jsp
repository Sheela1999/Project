<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User SignUp Page</title>

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
  height: 160vh;
  width: 100vw;
  background-color: rgba(0, 0, 0, 0.5);
}

#wrapper {
  position: absolute;
  top: 80%;
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

#signup,
#login {
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

.login,
.signup {
  cursor: pointer;
  color: yellow;
  font-weight: bold;
}

@media screen and (max-width: 715px) {
  body,
  body::before {
    height: 1200px;
  }
}

</style>
</head>

<body style="background-image: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB3Xi1bsw9BOR_SDNX1gKvVSP23g87W-f_Sg&usqp=CAU">

<nav class="navbar navbar-expand-lg navbar-light text-white " style="background-color:#0d6efd;">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#">LandRecords</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
          <li class="nav-item">
          <a class="nav-link text-white" href="Index.jsp">Home</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div id="wrapper">
  <div class="container">
    <div class="box">
      <form id="signup" action="saveUserRecords" method="post">
      
              <h5 style="color: green;" align="center">${Registration}</h5>
              <h5 style="color: red;" align="center">${NotRegistration}</h5>
              <h5 style="color: red;" align="center">${Exist}</h5>
              
        <center><h2 class="title">Registration Page</h2></center>
        
        <hr />
        <div class="field">
          <label for="name">Name</label>
          <input type="text" name="name" id="name" placeholder="Enter Your Name" required />
        </div>
        <div class="field">
          <label for="yourEmail">Email</label>
          <input type="email" name="email" id="yourEmail" placeholder="example@gmail.com" required />
        </div>
        <div class="field">
          <label for="enterMobileNo">Mobile Number</label>
          <input type="number" name="mobileNumber" id="enterMobileNo" placeholder="Your MobileNo" required />
        </div>
        <h5 style="color: red;">${MobileNumber}</h5>
        <div class="field">
          <label for="enterAadharNo">Aadhar Number</label>
          <input type="number" name="aadharNumber" id="enterAadharNo" placeholder="Your AadharNo" required />
        </div>
        <div class="field">
          <label for="enterPassword">Password</label>
          <input type="password" name="password" id="enterPassword" minlength="8" placeholder="At least 8 characters" required />
        </div>
         <div class="field">
          <label for="enterCPassword">Confirm Password</label>
          <input type="password" name="confirmPassword" id="enterCPassword" minlength="8" placeholder="Confirm Password" required />
        </div>
        <h5 style="color: red;">${ConfirmPassword}</h5>
        <div class="field">
          <input type="checkbox" id="agree" required />
          <label for="agree">I agree with <a href="#">Terms</a> and
            <a href="#">Privacy</a></label>
        </div>
        <button type="submit" class="button">REGISTER</button>
        <hr />  
        <div class="foot">
          <p class="info">Already have an account? <a href="UserSignIn.jsp"
                    class="login"><u>Login here</u></a></p>
        </div>
        
      </form>
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