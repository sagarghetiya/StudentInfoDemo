
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style rel="stylesheet" type="text/css">
.newclass {
	margin-top: 150px;
}

img {
    border-radius: 50%;
}
</style>


<!-- Site Title -->
<title>Student information system</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body style="background-color: #04091e">
	<header id="header" id="home">

		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div>
					<h1 style="color: white">Student Information System</h1>
				</div>
			</div>
		</div>
	</header>
	<div style="margin-top:80px">
		<div style="margin-left:450px">
	<form action="/CRUD/rest/student/add" id="myForm">
        <label for="login" style="color:#fff">Login ID</label> 
        <input type="text" id="login_id" name="login_id" required/>
         
        <label for="password" style="color:#fff">Password</label> 
        <input type="password" id="password" name="password" required/>
         
        <input type="button" style="background-color: #FF5006 ;border: 1px solid #000; margin-top:20px;  margin-bottom:20px;
		    border-color: #FF5006 ; color:#fff ;" id="submit_button" value="Login" onclick="login()"/>
        <input type="submit" style="display: none;"/>
        
    	</form>
   		<h3 id="failure_p" style="display: none; color:#fff">Please enter a valid login id or password</h3>		
       </div>
	</div>
	</body>
	</html>
	<script>
	function login(){
		var login_id = document.getElementById("login_id").value;
		var password = document.getElementById("password").value;
		if((login_id == "admin" && password == "admin123") || (login_id == "admin123" && password == "admin123")){
			window.location.href="/CRUD/home.jsp";
		}else{
			debugger;
			$('#failure_p').show();
		}
	}
	</script>
	
	