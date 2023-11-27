<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Records</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

@media screen and (max-width: 715px) {
  body,
  body::before {
   height: 1200px;
  }
   
</style>

 <script type="text/javascript">

function populateDropdowns() {
	var selectedState = document.getElementById("state");
    var districtDropdown = document.getElementById("district");
    var talukDropdown = document.getElementById("taluk"); // Fix this line
    var hobliDropdown = document.getElementById("hobli");
    var villageDropdown = document.getElementById("village");

  
	
    if (selectedState === "KARNATAKA") {
        populateDropdown(districtDropdown, [
            "--Select District--",
            "BELGAUM",
            "MYSORE",
            "SHIVAMOGGA",
            "PANDAVAPURA",
       
        ]);
    }
	
    
    document.getElementById("district").addEventListener("change", function() {
        var selectedDistrict = this.value;
        var talukDropdown = document.getElementById("taluk");
        talukDropdown.innerHTML = ""; // Clear existing options 
        
        if (selectedDistrict === "SHIVAMOGGA") {
           
            populateDropdown(talukDropdown, [
                "--SELECT TALHUK--",
                "HOSANAGARA",
                "SAGARA",
                "SORABA",
                "THIRTHAHALLI"
                
            ]);

            
            
        } else if (selectedDistrict === "MANDYA") {
            populateDropdown(talukDropdown, [
                "--SELECT TALHUK--",
                "KRPET",
                "MADDUR",
                "NAGAMANGALA",
                "PANDAVAPURA"
                
            ]);
           
        }

        else if (selectedDistrict === "MYSORE") {
            populateDropdown(talukDropdown, [
                "--SELECT TALHUK--",
                "HEGGADADEVANAKOTE",
                "HUNSUR",
                "MYSORE",
                "NANJANGUD"  
                
            ]);
            
        }

        else if (selectedDistrict === "BELGAUM") {
            populateDropdown(talukDropdown, [
                "--SELECT TALHUK--",
                "GOKAK",
                "KHANAPUR",
                "RAIBAG",
                "RAMDURG"
           
            ]);
            
        }
    });

    document.getElementById("taluk").addEventListener("change", function() {
    var selectedTaluk  = this.value;
    var hobliDropdown = document.getElementById("hobli");
    hobliDropdown.innerHTML =" ";
      
    if (selectedTaluk === "HOSANAGARA") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "HUNCHA",
            "NAGARA"
        ]);
       
    } else if (selectedTaluk === "THIRTHAHALLI") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "AGRAHARA",
            "AGUMBE"
        ]);
    } else if (selectedTaluk === "SAGARA") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "ANANDAPURA",
            "AVINAHALLI"
        ]);
    } else if (selectedTaluk === "SORABA") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "JADE",
            "ULAVI"
        ]);
    }

    else if (selectedTaluk === "KRPET") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "AKKIHEBBAL",
            "BUKINAKERE"
        ]);  
    }else if (selectedTaluk === "MADDUR") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "ATAGURU HOBLI",
            "KOPPA HOBALI"
        ]);  
    }else if (selectedTaluk === "PANDAVAPURA") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
          
            "CHINAKURALI",
            "MELUKOTE"
             
        ]);  
    }else if (selectedTaluk === "NAGAMANGALA") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
             
            "BELLURU",
            "BINDIGANAVILLE"    
            
        ]);  
    }else if (selectedTaluk === "MYSORE") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "KASABA",
            "VARUNA",
           
          
        ]);  
    }else if (selectedTaluk ===  "HEGGADADEVANAKOTE") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "ANTARASANTE",
            "HAMPAPURA"
        ]);  
    }else if (selectedTaluk === "HUNSUR") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "BILIKERE",
            "GAVADAGERE",
           
        ]);  
    }else if (selectedTaluk === "NANJANGUD") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "CHIKKAYYANACHATRA",
            "HULLAHALLI"
        ]);  
    }else if (selectedTaluk === "RAIBAG") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "KUDACHI",
            "RAYBAGA"
        ]);  
    }else if (selectedTaluk === "GOKAK") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "GOKAK",
            "KOWJALAGI"
        ]);  
    }else if (selectedTaluk === "RAMDURG") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "K CHANDARAGI",
            "KATAKOLA",
           
            
        ]);  
    }else if (selectedTaluk === "KHANAPUR") {
        populateDropdown(hobliDropdown, [
            "--SELECT HOBLI--",
            "BEEDI",
			"GUNJI"
        ]);  
    }
 
});


document.getElementById("hobli").addEventListener("change", function() {
    var selectedHobli  = this.value;
    var villageDropdown = document.getElementById("village");
    villageDropdown.innerHTML = ""; // Clear existing options

     if (selectedHobli === "HUNCHA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "AMRUTA",
            "ANEGADDE",
            "BILLODI",
            "BORIKOPPA"
           
            
            
        ]);  
    } else if (selectedHobli === "NAGARA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "ANDAGADUDURU",
           "BAISE",
           "KABALE",
           "KADIGERI"
        ]);  
    }else if (selectedHobli === "AGRAHARA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "AGALABAGILU",
             "AGASADI",
             "ALURU",
            "ARALASURALI"
        ]);  
    }else if (selectedHobli === "AGUMBE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "AREHALLI",
            "BALEHALLI",
            "CHAKKODABILU",
            "CHANGARA"
        ]);  
    }else if (selectedHobli === "ANANDAPURA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "ACHAPURA",
             "ADURU",
            "ATAVDI",
           "BALLIBYELU"
        ]);  
    }else if (selectedHobli === "AVINAHALLI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "AMBARAGODLU",
          "ARALEEKOPPA",
             "BESURU",
             "DEVASA"
        ]);  
    }else if (selectedHobli === "JADE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "ARETALAGADDE",
            "BANKSANA",
            "BANKAVALLI",
             "BILAGALI"
        ]);  
    }else if (selectedHobli === "ULAVI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "AVALAGODU",
           "BALAGODU",
           "BARIGE",
           "BHADRAPURA",
          
        ]);  
    }else if (selectedHobli === "AKKIHEBBAL") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "AIPANAHALLI",
             "AKKIHEBBAL",
              "ALAMBADI",
              "ALENAHALLI"
                            
        ]);  
    }else if (selectedHobli === "BUKINAKERE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "AGASARAHALLI",
            "AICHANAHALLI",
             "ARALAKUPPE",
            "ATTUPPE"
                            
                            
        ]);  
    }else if (selectedHobli === "ATAGURU HOBLI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
          "ALANSHETTIHALLI",
          "ANKANATHAPURA" , 
           "ATAGURU",
        "BYALADAKERE"
                            
                            
        ]);  
    }else if (selectedHobli === "KOPPA HOBALI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "BEKKALALE",
             "BOLARE",
            "HOSAGALI",
           "KIRANGURU"
                            
                            
        ]);  
    }else if (selectedHobli === "BELLURU") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
                "ADAKATAHALLI",  
                "AGACHAHALLI",
               "AMBALAJEERAHALLI",
                "ANAKANAHALLI"
                            
                            
        ]);  
    }else if (selectedHobli === "BINDIGANAVILLE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "A CHENNAPURA",
            "A NAGATTIHALLI",
            "ADDIHALLI",
            "ALEESANDRA",
           
           
           
                            
        ]);  
    }else if (selectedHobli === "CHINAKURALI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "ALPHALLI",
           "ANTANAHALLI",
            "ARALAKUPPE",
            "ARALAKUPPENALA"
                                   
                            
        ]);  
    }else if (selectedHobli === "MELUKOTE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "AMRUTHI",
            "ANUNAHALLI",
            "ANUVALLU",        
            "ARAKANAKERE"
                                   
                            
        ]);  
    }else if (selectedHobli === "KASABA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "BOGADI",
		    "GORURU",
		     "KESARE",
			"SATAGALLI"         
                            
        ]);  
    }else if (selectedHobli === "VARUNA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "DANDIKERE",
			"HONGATE",
			"MARASHE",
			"YADAKOLA"
						 
                            
        ]);  
    }else if (selectedHobli === "ANTARASANTE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "ANAGATTI",
			"ANEMALA",
			"HOSURU",
			"JIYARA",
						
                            
        ]);  
    }else if (selectedHobli === "HAMPAPURA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "BETTAHALLI",
			"DEVALAPURA",
			"KARIGALA",
			 "PURA",
             		
                            
        ]);  
    }else if (selectedHobli === "BILIKERE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "ASVALU",
			"DALLALU",
            "MADLAPURA",
			"TIPPURU",
			
						
                            
        ]);  
    }else if (selectedHobli === "GAVADAGERE") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "AGRAHARA",
			"ATTIGUPPE",
			"BELATTURU",
			"HARAVE",
						
                            
        ]);  
    }else if (selectedHobli === "CHIKKAYYANACHATRA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
          "ADAKANANAHALLI",
			"ALATTURU",
			"BASAVANAPURA",
			"BIDARAGUDU"

        ]);  
    }else if (selectedHobli === "HULLAHALLI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
             "AKALA",
			 "AMAKALLI",
			 "AMBALE",
			 "ARIYURU"

        ]);  
    }else if (selectedHobli === "KUDACHI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "KUDACHI",
           
            "MORABA",
            "MUGALAKHODA",
			"NEELAJI",
			
		   
        ]);  
    }else if (selectedHobli === "RAYBAGA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
             "BAVACHI",
		     "CHINCHALI",
		    "DEVANAKATTI",
		      "JODATTI"
        ]);  
    }else if (selectedHobli === "GOKAK") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "BALOBAL",
			"BUDIHALA",
			"DANDAPUR",
			"GOKAKA"

        ]);  
    }else if (selectedHobli === "KOWJALAGI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
                "ADIBATTI",
				"BETAGERI",
				"KANDRATTI",
				"MANNIKERI"

        ]);  
    }else if (selectedHobli === "K CHANDARAGI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "BEEDAKI",
		   "BHAGOJIKOPPA",
			"BIJAGUPI",
			"BUDANURA"
        ]);  
    }else if (selectedHobli === "KATAKOLA") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
            "ARIBENCHI",
			"BANNURA",
			"BOCHABALA",
			"CHILAMURA"
						
        ]);  
    }else if (selectedHobli === "BEEDI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
           "ADI",
			"BALAGUNDA",
			"BEEDI",
			"BHURANAKI"
						
						
        ]);  
    }else if (selectedHobli === "GUNJI") {
        populateDropdown(villageDropdown, [
            "--SELECT VILLAGE--",
          "ABANALLE",
		  "AKRALLI",
		  "AMBEVADI",
		  "ANAGADI",
						
						
        ]);  
    }


});


    function populateDropdown(dropdown, options) {
        for (var i = 0; i < options.length; i++) {
            var option = document.createElement("option");
            option.value = options[i];
            option.text = options[i];
            dropdown.appendChild(option);
        }
    }


}

</script>  
 
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light text-white " style="background-color:#0d6efd;">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#" style="padding-right: 10px;">LandRecords</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <h5 style="color: white; padding-left: 1000px;">${Admin.adminName}</h5>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      <li class="nav-item">
                    <a class="nav-link text-white" href="UserSignIn.jsp">LOGOUT</a>
                </li>
          <li class="nav-item">
          <a class="nav-link text-white" href="User.jsp">HOME</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div id="wrapper">
	<div class="container">

		<h5 style="color: orange;">${Saved}</h5>
		<h5 style="color: red;">${Exist}</h5>
		
		<h1 align="center"><b style="color: white;">Land Records</b></h1>
		<br>
		<br>

		<form class="form" action="save" method="post">
			<div class="row">

				<div class="col-md-3" style="padding-right: 1px">
					<label class="form-lbl" style="font-size: large;" ><b style="color: white;">Owner Name</b></label> 
					<input type="text" name="ownerName" class="form-control" id="" placeholder="" required>
				</div>

				<div class="col-md-3" style="padding-left: 10px; padding-right: 2px">
					<label class="form-lbl" style="font-size: large;"><b style="color: white;">Mobile Number</b></label> 
					<input type="number" name="mobileNumber" class="form-control" id="" placeholder="" required>
				</div>

				<div class="col-md-3" style="padding-left: 5px; padding-right: 4px">
					<fieldset class="form-group">
						<label class="form-lbl" style="font-size: large;"><b style="color: white;">Aadhar Number</b></label> 
					    <input type="number" name="aadharNumber" class="form-control" id="" placeholder="" required>
					</fieldset>
				</div>

				<div class="col-md-3" style="padding-left: 4px;">
						<label class="form-lbl" style="font-size: large;"> <b style="color: white;">Year</b></label>
						<input type="number" name="year" class="form-control" id="" placeholder="" required>
				</div>
			</div>

			<div class="form-row">
				<div class="col-md-3">

					<label class="form-lbl"><b style="color: white;">State</b></label> <select
						class="form-control" id="state" name="state" onchange="populateDropdowns()" required>
						<option value="" style="font-size: large;">SELECT A STATE</option>
						<option value="KARNATAKA">KARNATAKA</option>

					</select>

				</div>

				<div class="col-md-3" style="padding-right: 4px">

					<label for="district" class="form-lbl" style="font-size: large;"><b style="color: white;">District</b></label>
					<select id="district" class="form-control" name="district" required>

						<option value="">SELECT A DISTRICT</option>
						<option value="SHIVAMOGGA">SHIVAMOGGA</option>
						<option value="MANDYA">MANDYA</option>
						<option value="MYSORE">MYSORE</option>
						<option value="BELGAUM">BELGAUM</option>

					</select>

				</div>

				<div class="col-md-3" style="padding-right: 4px">

					<label for="taluk" class="form-lbl" style="font-size: large;"><b style="color: white;">Taluk</b></label>
					<select id="taluk" class="form-control" name="taluk" required>
						<option value="">SELECT A TALUK</option>
						<option value="HOSANAGARA">HOSANAGARA</option>
						<option value="THIRTHAHALLI">THIRTHAHALLI</option>
						<option value="SAGARA">SAGARA</option>
						<option value="SORABA">SORABA</option>

						<option value="KRPET">KRPET</option>
						<option value="MADDUR">MADDUR</option>
						<option value="PANDAVAPURA">PANDAVAPURA</option>
						<option value="NAGAMANGALA">NAGAMANGALA</option>

						<option value="mysore">MYSORE</option>
						<option value="HeggadaDevanakote">HEGGADADEVANAKOTE</option>
						<option value="Hunsur">HUNSUR</option>
						<option value="Nanjangud">NANJANGUD</option>

						<option value="Raibag">RAIBAG</option>
						<option value="gokak">GOKAK</option>
						<option value="ramdurg">RAMDURG</option>
						<option value="khanapur">KHANAPUR</option>

					</select>
				</div>

				<div class="col-md-3">

					<label class="form-lbl" for="hobli" style="font-size: large;">
						<b style="color: white;">Hobli</b>
					</label> <select class="form-control" name="hobli" id="hobli" required>
						<option value="">SELECT A HOBLI</option>
						
						<option value="HUNCHA">HUNCHA</option>
						<option value="NAGARA">NAGARA</option>

						<option value="AGRAHARA">AGRAHARA</option>
						<option value="AGUMBE">AGUMBE</option>

						<option value="ANANDAPURA">ANANDAPURA</option>
						<option value="AVINAHALLI">AVINAHALLI</option>

						<option value="JADE">JADE</option>
						<option value="ULAVI">ULAVI</option>

						<!-- MANDYA:KRPET AND MADDUR  -->

						<option value="AKKIHEBBAL">AKKIHEBBAL</option>
						<option value="BUKINAKERE">BUKINAKERE</option>

						<option value="ATAGURU HOBLI">ATAGURU HOBLI</option>
						<option value="KOPPA HOBALI">KOPPA HOBALI</option>

						<!-- mandya:nagamangala -->
						<option value="Belluru">BELLURU</option>
						<option value="Bindiganaville">BINDIGANAVILLE</option>
						<!-- mandya:pandavapura-->
						<option value="chinakurali">CHINAKURALI</option>
						<option value="melukote">MELUKOTE</option>

						<!-- Mysuru -->
						<option value="Kasaba">KASABA</option>
						<option value="Varuna">VARUNA</option>

						<!-- Heggada Devana kote -->
						<option value="Antarasante">ANTARASANTE</option>
						<option value="Hampapura">HAMPAPURA</option>

						<!-- Hunsur -->
						<option value="Bilikere">BILIKERE</option>
						<option value="Gavadagere">GAVADAGERE</option>

						<!-- Nanjangud -->
						<option value="Chikkayyanachatra">CHIKKAYYANACHATRA</option>
						<option value="Hullahalli">HULLAHALLI</option>

						<option value="kudachi">KUDACHI</option>
						<option value="raybaga">RAYBAG</option>

						<option value="gokak">GOKAK</option>
						<option value="kowjalagi">KOWJALAGI</option>

						<option value="K Chandaragi">K CHANDARAGI</option>
						<option value="katakola">KATAKOLA</option>

						<option value="Beedi">BEEDI</option>
						<option value="Gunji">GUNJI</option>

					</select>
				</div>
			</div>
			<br>
			
			<div class="row">
				<div class="col-md-3" style="padding-right: 1px">

					<label class="form-lbl" for="village" style="font-size: large;"><b style="color: white;">Village</b></label>
					<select class="form-control select2" name="village" id="village" required>
						<option value="">SELECT A VILLAGE</option>
						<option value="AMRUTA">AMRUTA</option>
						<option value="ANEGADDE">ANEGADDE</option>
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

						<!-- MANDTA -->
						
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

						<option value="Adakatahalli">ADAKATAHALLI</option>
						<option value="Agachahalli">ADACHAHALLI</option>
						<option value="Ambalajeerahalli">AMBALAJEERAHALLI</option>
						<option value="Anakanahalli">AMAKANAHALLI</option>
						<!-- mandya :Bindiganaville -->
						<option value="A Chennapura">A CHENNAPURA</option>
						<option value="A Nagattihalli">A NAGATTIHALLI</option>
						<option value="Addihalli">ADDIHALLI</option>
						<option value="Aleesandra">ALEESANDRA</option>

						<!-- mandya :chinakurali -->
						<option value="Alpahalli">ALPAHALLI</option>
						<option value="Antanahalli">ANTANAHALLI</option>
						<option value="Aralakuppe">ARALAKUPPE</option>
						<option value="Aralakuppenala">ARALAKUPPENALA</option>

						<!-- mandya :mekote -->
						<option value="Amruthi">AMRUTHI</option>
						<option value="Anunahalli">ANUNAHALLI</option>
						<option value="anuvallu">ANUVALLU</option>
						<option value="Arakanakere">ARAKANAKERE</option>

						<!-- Mysore(kasaba)  -->
						<option value="Bogadi">BOGADI</option>
						<option value="Goruru">GORURU</option>
						<option value="Kesare">KESARE</option>
						<option value="Satagalli">SATAGALLI</option>

						<!-- Mysore(varuna)  -->
						<option value="Dandikere">DANDIKERE</option>
						<option value="Hongate">HONGATE</option>
						<option value="Marashe">MARASHE</option>
						<option value="Yadakola">YADAKOLA</option>

						<!-- Antarasante -->
						<option value="Anagatti">ANAGATTI</option>
						<option value="Anemala">ANEMALA</option>
						<option value="Hosuru">HOSURU</option>
						<option value="Jiyara">JIYARA</option>

						<!-- Hampapura -->
						<option value="Bettahalli">BETTAHALLI</option>
						<option value="Devalapura">DEVALAPURA</option>
						<option value="Karigala">KARIGALA</option>
						<option value="Pura">PURA</option>

						<!-- Bilikere -->
						<option value="Asvalu">ASVALU</option>
						<option value="Dallalu">DALLALU</option>
						<option value="Tippuru">TIPPURU</option>
						<option value="Mudlapura">MUDLAPURA</option>

						<!-- Gavadagere -->
						<option value="Agrahara">AGRAHARA</option>
						<option value="Attiguppe">ATTIGUPPE</option>
						<option value="Belatturu">BELATTURU</option>
						<option value="Harave">HARAVE</option>

						<!-- Chikkayyanachatra -->
						<option value="Adakanahalli">ADAKANAHALLI</option>
						<option value="Alatturu">ALATTURU</option>
						<option value="Basavanapura">BASAVANAPURA</option>
						<option value="Bidaragudu">BIDARAGUDU</option>

						<!-- Hullahalli -->
						<option value="Akala">AKALA</option>
						<option value="Amakalli">AMAKALLI</option>
						<option value="Ambale">AMBALE</option>
						<option value="Ariyuru">ARIYURU</option>

						<option value="mugalakhoda">MUGALAKHODA</option>
						<option value="neelaji">NEELAJI</option>
						<option value="moraba">MORABA</option>
						<option value="kudachi">KUDACHI</option>

						<!-- raybaga  -->
						<option value="bavachi">BAVACHI</option>
						<option value="chinchali">CHINCHALI</option>
						<option value="devanakatti">DEVANAKATTI</option>
						<option value="jodatti">JODATTI</option>

						<!-- gokak  -->
						<option value="balobal">BALOBAL</option>
						<option value="budihala">BUDIHALA</option>
						<option value="dandapur">DANDAPUR</option>
						<option value="gokaka">GOKAKA</option>

						<!-- kowjalagi -->
						<option value="adibatti">ADIBATTI</option>
						<option value="betageri">BETAGERI</option>
						<option value="kandrattti">KANDRATTI</option>
						<option value="mannikeri">MANNIKERI</option>
						<!-- K Chandaragi -->

						<option value="beedaki">BEEDAKI</option>
						<option value="bhagojikoppa">BHAGOJIKOPPA</option>
						<option value="bijagupi">BIJAGUPI</option>
						<option value="budanura">BUDANURA</option>

						<!-- katakola -->
						<option value="Aribenchi">ARIBENCHI</option>
						<option value="bannura">BANNURA</option>
						<option value="bochabala">BOCHABALA</option>
						<option value="CHILAMURA">CHILAMURA</option>

						<!-- beedi -->
						<option value="adi">ADI</option>
						<option value="balagunda">BALAGUNDA</option>
						<option value="beedi">BEEDI</option>
						<option value="bhuranaki">BHURANAKI</option>

						<!-- Gunji -->
						<option value="Abanalle">ABANALLE</option>
						<option value="Akralli">AKRALLI</option>
						<option value="Ambevadi">AMBEVADI</option>
						<option value="Anagadi">ANAGADI</option>

					</select>

				</div>		 

				<div class="col-md-3" style="padding-left: 8px; padding-right: 4px">
					<fieldset class="form-group">
						<label class="form-lbl" style="font-size: large;"> <b style="color: white;">Survey Number</b></label> 
						<input type="number" name="surveyNumber" class="form-control" id="" placeholder="">
					</fieldset>
				</div>

				<div class="col-md-3" style="padding-left: 4px; padding-right: 4px">
					<fieldset class="form-group">
						<label class="form-lbl" style="font-size: large;"> <b style="color: white;">Hissa Number</b></label> 
						<input type="number" name="hissaNumber" class="form-control" id="" placeholder="">
						</fieldset>
					</div>

				<div class="col-md-3" style="padding-left: 4px;">
				    <fieldset class="form-group">
					  <label class="form-lbl" style="font-size: large;"><b style="color: white;">Total Acres</b></label> 
					  <input type="text" name="totalAcres" class="form-control" id="" placeholder="">
					</fieldset>
				</div>

			</div>
			<div class="col-md-3" style="padding-left: 4px;">
		 				<div class="form-group view-password">  
                            <label class="form-lbl" style="font-size: large;"><b style="color: white;">Image</b></label> 
                            	<input type="file" name="image" class="form-control" id="" placeholder="">
                         </div>
            </div>
			<br>
			<center><button type="submit" class="btn btn-warning" 
			style="padding-right: 40px; padding-left: 40px"><b style="color: white;">save</b></button></center>

		</form>
		<br>
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