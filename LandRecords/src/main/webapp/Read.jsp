<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Records</title>

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

<nav class="navbar navbar-expand-lg navbar-light bg-primary"
		style="height: 60px;">
		<div class="container">
			<a class="navbar-brand" id="land" href="#">LandRecords</a>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" id="home"
						style="color: white" href="Index.jsp">Home</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<br>
	<h1 align="center">Land Records</h1>
	<h6 style="color: green;">${Saved}</h6>
	<br>
	<form class="form" action="search" method="get">
		<div class="row">

			<div class="col-md-3">
				<fieldset class="form-group">
					<label style="text-transform: capitalize" class="form-lbl">State</label> <select class="form-control"
						name="state">
						<option selected>Select State</option>
						<option value="Karnataka">Karnataka</option>
					</select>
				</fieldset>
			</div>

			<div class="col-md-3">
				<fieldset class="form-group">
					<label class="form-lbl">District</label> <select
						class="form-control" name="district">
						<option selected>Select District</option>
						<option value="Belgaum">Belgaum</option>
						<option value="Mysore">Mysore</option>
						<option value="Mandya">Mandya</option>
						<option value="Shivamogga">Shivamogga</option>
					</select>
				</fieldset>
			</div>
			<div class="col-md-3">
				<fieldset class="form-group">
					<label class="form-lbl">Taluk</label> <select class="form-control"
						name="taluk">
						<option selected>Select Taluk</option>
						<option value="Raibag">Raibag</option>
						<option value="Gokak">Gokak</option>
						<option value="Ramdurg">Ramdurg</option>
						<option value="Khanapur">Khanapur</option>

						<option value="Mysore">Mysore</option>
						<option value="Heggada Devana kote">Heggada Devana kote</option>
						<option value="Hunsur">Hunsur</option>
						<option value="Nanjangudi">Nanjangudi</option>

						<!--Mandya-->
						<option value="Maddur">Maddur</option>
						<option value="Krishnarajpet ">Krishnarajpet</option>
						<option value="Nagamangala">Nagamangala</option>
						<option value="Pandavapura">Pandavapura</option>

						<option value="Hosanagara">Hosanagara</option>
						<option value="Thirthahalli">Thirthahalli</option>
						<option value="Sagara">Sagara</option>
						<option value="Soraba">Soraba</option>
					</select>
				</fieldset>
			</div>

			<div class="col-md-3">
				<fieldset class="form-group">
					<label class="form-lbl">Hobli</label> <select
						class="form-control select2" name="hobli">
						<option selected>Select Hobli</option>
						<!-- belgaum -->
						<option value="Kudachi">Kudachi</option>
						<option value="Raybaga">Raybaga</option>

						<option value="Gokak">Gokak</option>
						<option value="Kowjalagi">Kowjalagi</option>

						<option value="K Chandaragi">K Chandaragi</option>
						<option value="Katakola">Katakola</option>

						<option value="Beedi">Beedi</option>
						<option value="Gunji">Gunji</option>

						<!-- Mysore -->
						<option value="Kasaba">Kasaba</option>
						<option value="Varuna">Varuna</option>

						<!-- Mysore(Heggada Devana kote) -->
						<option value="Antarasante">Antarasante</option>
						<option value="Hampapura">Hampapura</option>

						<!-- Mysore(Hunsur) -->
						<option value="Bilikere">Bilikere</option>
						<option value="Gavadagere">Gavadagere</option>

						<!-- Mysore(Nanjangud) -->
						<option value="Chikkayyanachatra">Chikkayyanachatra</option>
						<option value="Hullahalli">Hullahalli</option>

						<!-- mandya:nagamangala -->
						<option value="Belluru">Belluru</option>
						<option value="Bindiganaville">Bindiganaville</option>

						<!-- mandya:pandavapura-->
						<option value="Chinakurali">Chinakurali</option>
						<option value="Melukote">Melukote</option>

						<!-- MANDYA:KRPET AND MADDUR  -->

						<option value="Akkihebbal">Akkihebbal</option>
						<option value="Bukinakere">Bukinakere</option>

						<option value="Ataguru Hobli">Ataguru Hobli</option>
						<option value="Koppa Hobli">Koppa Hobli</option>

						<!-- Shivmoga -->
						<option value="Huncha">Huncha</option>
						<option value="Nagara">Nagara</option>

						<option value="Agrahara">Agrahara</option>
						<option value="Agumbe">Agumbe</option>


						<option value="Anandapura">Anandapura</option>
						<option value="Avinahalli">Avinahalli</option>

						<option value="Jade">Jade</option>
						<option value="Ulavi">Ulavi</option>


					</select>
				</fieldset>
			</div>
			<div class="col-md-3">
				<fieldset class="form-group">
					<label class="form-lbl">Village</label> <select
						class="form-control select2" name="village">
						<option selected>Select Village</option>

						<!-- kudachi -->
						<option value="Mugalakhoda">Mugalakhoda</option>
						<option value="Neelaji">Neelaji</option>
						<option value="Moraba">Moraba</option>
						<option value="Kudachi">Kudachi</option>

						<!-- raybaga  -->
						<option value="Bavachi">Bavachi</option>
						<option value="Chinchali">Chinchali</option>
						<option value="Devanakatti">Devanakatti</option>
						<option value="Jodatti">Jodatti</option>

						<!-- gokak  -->
						<option value="Balobal">Balobal</option>
						<option value="Budihala">Budihala</option>
						<option value="Dandapur">Dandapur</option>
						<option value="Gokaka">Gokaka</option>

						<!-- kowjalagi -->
						<option value="Adibatti">Adibatti</option>
						<option value="Betageri">Betageri</option>
						<option value="Kandrattti">Kandrattti</option>
						<option value="Mannikeri">Mannikeri</option>
						<!-- K Chandaragi -->

						<option value="Beedaki">Beedaki</option>
						<option value="Bhagojikoppa">Bhagojikoppa</option>
						<option value="Bijagupi">Bijagupi</option>
						<option value="Budanura">Budanura</option>

						<!-- katakola -->
						<option value="Aribenchi">Aribenchi</option>
						<option value="Bannura">Bannura</option>
						<option value="Bochabala">Bochabala</option>
						<option value="Budanura">Budanura</option>

						<!-- beedi -->
						<option value="Adi">Adi</option>
						<option value="Balagunda">Balagunda</option>
						<option value="Beedi">Beedi</option>
						<option value="Bhuranaki">Bhuranaki</option>

						<!-- Gunji -->
						<option value="Abanalle">Abanalle</option>
						<option value="Akralli">Akralli</option>
						<option value="Ambevadi">Ambevadi</option>
						<option value="Anagadi">Anagadi</option>

						<!-- Mysore(kasaba)  -->
						<option value="Bogadi">Bogadi</option>
						<option value="Goruru">Goruru</option>
						<option value="Kesare">Kesare</option>
						<option value="Satagalli">Satagalli</option>

						<!-- Mysore(varuna)  -->
						<option value="Dandikere">Dandikere</option>
						<option value="Hongate">Hongate</option>
						<option value="Marashe">Marashe</option>
						<option value="Yadakola">Yadakola</option>

						<!-- Antarasante -->
						<option value="Anagatti">Anagatti</option>
						<option value="Anemala">Anemala</option>
						<option value="Hosuru">Hosuru</option>
						<option value="Jiyara">Jiyara</option>

						<!-- Hampapura -->
						<option value="Bettahalli">Bettahalli</option>
						<option value="Devalapura">Devalapura</option>
						<option value="Karigala">Karigala</option>
						<option value="Pura">Pura</option>

						<!-- Bilikere -->
						<option value="Asvalu">Asvalu</option>
						<option value="Dallalu">Dallalu</option>
						<option value="Tippuru">Tippuru</option>
						<option value="Mudlapura">Mudlapura</option>

						<!-- Gavadagere -->
						<option value="Agrahara">Agrahara</option>
						<option value="Attiguppe">Attiguppe</option>
						<option value="Belatturu">Belatturu</option>
						<option value="Harave">Harave</option>

						<!-- Chikkayyanachatra -->
						<option value="Adakanahalli">Adakanahalli</option>
						<option value="Alatturu">Alatturu</option>
						<option value="Basavanapura">Basavanapura</option>
						<option value="Bidaragudu">Bidaragudu</option>

						<!-- Hullahalli -->
						<option value="Akala">Akala</option>
						<option value="Amakalli">Amakalli</option>
						<option value="Ambale">Ambale</option>
						<option value="Ariyuru">Ariyuru</option>

						<!-- mandya :belluru -->
						<option value="Adakatahalli">Adakatahalli</option>
						<option value="Agachahalli">Agachahalli</option>
						<option value="Ambalajeerahalli">Ambalajeerahalli</option>
						<option value="Anakanahalli">Anakanahalli</option>

						<!-- mandya :Bindiganaville -->
						<option value="A Chennapura">A Chennapura</option>
						<option value="A Nagattihalli">A Nagattihalli</option>
						<option value="Addihalli">Addihalli</option>
						<option value="Addihalli">Addihalli</option>

						<!-- mandya :chinakurali -->
						<option value="Alpahalli">Alpahalli</option>
						<option value="Antanahalli">Antanahalli</option>
						<option value="Aralakuppe">Aralakuppe</option>
						<option value="Aralakuppenala">Aralakuppenala</option>

						<!-- mandya :mekote -->
						<option value="Amruthi">Amruthi</option>
						<option value="Anunahalli">Anunahalli</option>
						<option value="anuvallu">anuvallu</option>
						<option value="Arakanakere">Arakanakere</option>

						<option value="AIPANAHALLI">AIPANAHALLI</option>
						<option value="AKKIHEBBAL">AKKIHEBBAL</option>
						<option value="ALAMBADI">ALAMBADI</option>
						<option value="ALENAHALLI">ALENAHALLI</option>

						<option value="AGASARAHALLI">AGASARAHALLI</option>
						<option value="AICHANAHALLI">AICHANAHALLI</option>
						<option value="ARALAKUPPE">ARALAKUPPE</option>
						<option value="ATTUPPE">ATTUPPE</option>


						<option value="ALANSHETTIHALLI">ALANSHETTIHALLI</option>
						<option value="ANKANATHAPURA">ANKANATHAPURA</option>
						<option value="ATAGURU">ATAGURU</option>
						<option value="BYALADAKERE">BYALADAKERE</option>

						<option value="BEKKALALE">BEKKALALE</option>
						<option value="BOLARE">BOLARE</option>
						<option value="HOSAGALI">HOSAGALI</option>
						<option value="KIRANGURU">KIRANGURU</option>

						<!-- Shivmoga -->
						<option value="AMRUTA">AMRUTA</option>
						<option value="ANEGADDA">ANEGADDA</option>
						<option value="BILLODI">BILLODI</option>
						<option value="BORIKOPPA">BORIKOPPA</option>


						<option value="ANDAGADUDURU">ANDAGADUDURU</option>
						<option value="BAISE">BAISE</option>
						<option value="KABALE">KABALE</option>
						<option value="KADIGERI">KADIGERI</option>

						<option value="AGALABAGILU">AGALABAGILU</option>
						<option value="AGASADI">AGASADI</option>
						<option value="ALURU">ALURU</option>
						<option value="ARALASURALI">ARALASURALI</option>

						<option value="AREHALLI">AREHALLI</option>
						<option value="BALEHALLI">BALEHALLI</option>
						<option value="CHAKKODABILU">CHAKKODABILU</option>
						<option value="CHANGARA">CHANGARA</option>

						<option value="ACHAPURA">ACHAPURA</option>
						<option value="ADURU">ADURU</option>
						<option value="ATAVDI">ATAVDI</option>
						<option value="BALLIBYELU">BALLIBYELU</option>

						<option value="AMBARAGODLU">AMBARAGODLU</option>
						<option value="ARALEEKOPPA">ARALEEKOPPA</option>
						<option value="BESURU">BESURU</option>
						<option value="DEVASA">DEVASA</option>

						<option value="ARETALAGADDE">ARETALAGADDE</option>
						<option value="BANKSANA">BANKSANA</option>
						<option value="BANKAVALLI">BANKAVALLI</option>
						<option value="BILAGALI">BILAGALI</option>

						<option value="AVALAGODU">AVALAGODU</option>
						<option value="BALAGODU">BALAGODU</option>
						<option value="BARIGE">BARIGE</option>
						<option value="BHADRAPURA">BHADRAPURA</option>
					</select>
				</fieldset>
			</div>

			<br>
			<div class="col-md-3">
				<fieldset class="form-group">
				   <label class="form-lbl"> . </label>
					<button type="submit" class="form-control btn btn-primary">Go</button>
				</fieldset>
			</div>
		</div>

	</form>
	<br>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<div style="height: 255px"></div>

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