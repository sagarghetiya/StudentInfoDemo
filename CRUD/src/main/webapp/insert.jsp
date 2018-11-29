<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" crossorigin="anonymous"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha256-eSi1q2PG6J7g7ib17yAaWMcrr5GrtohYChqibrV7PBE=">
<link rel="stylesheet" crossorigin="anonymous"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=">
<link rel="stylesheet" crossorigin="anonymous"
	href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css"
	integrity="sha256-3oIi71IMpsoA+8ctSTIM+6ScXYjyZEV06q6bbK6CjsM=">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<script src="js/superfish.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.tabs.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script>
        $.jgrid = $.jgrid || {};
        $.jgrid.no_legacy_api = true;
    </script>
<script crossorigin="anonymous"
	src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/jquery.jqgrid.min.js"
	integrity="sha256-ELi2cs17gL2MqNzkRkogxZsVLmL+oWfeVOwZQLcp8ek="></script>

<style rel="stylesheet" type="text/css">

label {
 margin-top: 6px;
    margin-bottom: 16px;
    width: 50%;
 	color: white;
}
input {
    width: 50%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
}
h3{
	color: white;
}
</style>

<title>Student information system</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!-- CSS FILES -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jqgrid.css">
<link rel="stylesheet" href="css/main.css">

</head>
<body style="background-color: #04091e">


	<header id="header" id="home" style="background-color: rgba(0,0,0,1)">

		<div class="container main-menu" style="opacity: 1.0">
			<div class="row align-items-center justify-content-between d-flex" >
				<div id="logo">
					<h3 style="color: white">Insert Student Details</h3>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="home.jsp" >Home</a></li>
						<li><a href="search.jsp">Search Student Info</a></li>
						<li><a href="update.jsp">Update Student Info</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>

	</header>
	<!-- #header -->

	<div style="margin-top:80px">
		<div style="margin-left:450px">
	<form action="/CRUD/rest/student/add" id="myForm">
        <label for="name">Student Name</label> 
        <input type="text" id="name" name="name" required/>
         
        <label for="roll">Roll Number</label> 
        <input type="number" id="rollNumber" name="roll" required/>
         
        <label for="physics">Physics</label> 
        <input type="number" id="physics" name="physics" required/>
         
        <label for="chemistry">Chemistry</label>
        <input type="number" id="chemistry" name="chemistry" required/>
        
        <label for="Maths">Maths</label> 
        <input type="number" id="maths" name="maths" required/>
         
        <label for="dob">Date Of Birth</label>
        <input type="date" id="dob" name="dob" required/> 
        
        <label for="profile_pic">Pic</label>
        <input type="file" id="profile_pic" name="profile_pic" />
        
        <input type="button" style="background-color: #FF5006 ;border: 1px solid #000; margin-top:20px;  margin-bottom:20px;
		    border-color: #FF5006 ; color:#fff ;" id="submit_button" value="Insert" onclick="submitForm()"/>
        <input type="submit" style="display: none;"/>
        
    	</form>
		<h3 id="success_p" style="display: none; color:#fff" >Student added successfully</h3>
   		<h3 id="failure_p" style="display: none; color:#fff">Student with mentioned roll number already exists please enter another roll number</h3>		
       </div>
	</div>

</body>
</html>

<script>
		
		function submitForm(){
			$('#failure_p').hide();
			$('#success_p').hide();
			var isvalidate = $("#myForm")[0].checkValidity();
			debugger;
			if(isvalidate){
				event.preventDefault();
				$.ajax({
				    	 	type: 'POST', // GET
				    	 	contentType:"application/json" ,
							url:"http://localhost:10001/CRUD/rest/student/add",
				        	dataType : "json", 
				        	data : formToJSON(),
				    		error: function(data){
				    			if(data.status == 200){
				    				uploadImage();
				    			}else{
					    			$('#success_p').hide();
					    			$('#failure_p').show();
				    			}
				    		}
				    });
			}else{
				var $myForm = $("#myForm");
				$myForm.find(':submit').click();
			}
		}
		function uploadImage(){
			debugger;
			var formData = new FormData();
			var rollno = document.getElementById("rollNumber").value;
			var pic_url = "/home/sagar/git/repository/CRUD/src/main/webapp/img/"+rollno;
			var file = $('input[name="profile_pic"').get(0).files[0];
			formData.append("pic", file);
			formData.append("pic_url",pic_url);
			debugger;
			$.ajax({
				type:"POST",
				processData: false,
				contentType: false,
				url:"http://localhost:10001/CRUD/rest/student/upload",
				data: formData,
				success:function(data){
					$('#failure_p').hide();
	            	$('#success_p').show();
				},
				error:function(){
					$('#success_p').hide();
	    			$('#failure_p').show();
				}
			});
		}
		
		function formToJSON() 
		{
			var name = document.getElementById("name").value;
			var rollno = document.getElementById("rollNumber").value;
			var physicsmarks = document.getElementById("physics").value;
			var chemistrymarks = document.getElementById("chemistry").value;
			var mathmarks = document.getElementById("maths").value;
			var dob = document.getElementById("dob").value;
			var pic_url = "/home/sagar/git/repository/CRUD/src/main/webapp/img/"+rollno+".png";
			var eqn = JSON.stringify({
				"name": name,
				"rollNumber": rollno,
				"physicsMarks": physicsmarks,
				"chemistryMarks": chemistrymarks,
				"mathMarks": mathmarks,
		        "dob": dob,// serializes the form's elements.
		        "picUrl":pic_url
	        });
			return eqn;
		}
		
</script>
