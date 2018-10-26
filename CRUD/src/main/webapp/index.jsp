<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
}

/* Style the submit button */
input[type=submit] {
    background-color: #4CAF50;
    color: white;
}

/* Style the container for inputs */
.container {
    background-color: #f1f1f1;
    padding: 20px;
     margin-left: 480px;
     margin-right: 480px;   
}

</style></head>
<div class="container">
    <form action="/CRUD/rest/student/add" id="myForm">
        <label for="name">Student Name</label> 
        <input type="text" id="name" name="name" required>
         
        <label for="roll">Roll Number</label> 
        <input type="number" id="psw" name="roll" required>
         
        <label for="physics">Physics</label> 
        <input type="number" id="physics" name="physics" required>
         
        <label for="chemistry">Chemistry</label>
        <input type="number" id="chemistry" name="chemistry" required>
        
        <label for="Maths">Maths</label> 
        <input type="number" id="maths" name="maths" required>
         
        <label for="dob">Date Of Birth</label>
        <input type="date" id="dob" name="dob" required> 
        
        <input type="button" id="submit_button" value="Insert" onclick="submitForm()">
    </form>
</div>
</html>
<script>
	
		function submitForm(){
			    $.ajax({
			    	 	type: 'POST', // GET
			    	 	contentType:"application/json" ,
						url:"http://localhost:10001/CRUD/rest/student/add",
			        	dataType : "json", 
			        	data : formToJSON(),
			          	success: function(data)
			           	{
			            	alert(data); // show response from the php script.
			           	}
			    });
		}
		
		function formToJSON() 
		{
			var name = document.getElementById("name").value;
			var rollno = document.getElementById("psw").value;
			var physicsmarks = document.getElementById("physics").value;
			var chemistrymarks = document.getElementById("chemistry").value;
			var mathmarks = document.getElementById("maths").value;
			var dob = document.getElementById("dob").value;
			var eqn = JSON.stringify({
				"name": name,
				"rollNumber": rollno,
				"physicsMarks": physicsmarks,
				"chemistryMarks": chemistrymarks,
				"mathMarks": mathmarks,
		        "dob": dob// serializes the form's elements.
	        });
			return eqn;
		}
		
</script>
