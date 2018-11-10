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

</style>
</head>
<div class="container">
<p align="center">SEARCH STUDENT</p>
	<form method="post">
		
		<label for="roll">Roll Number</label> 
		<input type="text" id="rollNum" name="roll" required> 
		
		<input type="button" value="Search" onclick="search()">
		<input type="button" onclick="location.href = 'index.jsp';" value="Insert page" id="insert_button" >
		<input type="button" onclick="location.href = 'update.jsp';" value="Update page" id="update_button" >
	</form>
</div>

<div id="division" class="container">
		<label for="name">Student Name</label> 
		<input type="text" id="name" name="name" readonly>
		 
		<label for="physics">Physics</label> 
		<input type="number" id="physics" name="physics" readonly>
		 
		<label for="chemistry">Chemistry</label>
		<input type="number" id="chemistry" name="chemistry" readonly>
		
		<label for="Maths">Maths</label> 
		<input type="number" id="maths" name="maths" readonly>
		 
		<label for="total">Total</label>
		<input type="number" id="total" name="total" readonly>
		
		<label for="grade">Grade</label>
		<input type="text" id="grade" name="grade" readonly>
		
		<label for="profile_pic">Pic</label>
		<input type="image" id="profile_pic" src="img/index.png" readonly/> 
</div>
</html>
<script>
	function search(){
		var rollNum = document.getElementById("rollNum").value;
		debugger;
		if(rollNum == null || rollNum == ""){
			alert("Please enter roll number");
			return;
		}
		$.ajax({
		    type: 'POST',
		    contentType:"application/json" ,
		    url: "http://localhost:10001/CRUD/rest/student/search",
		    data :rollNum,
		    dataType : "json", 
		    timeout: 7000,
		    success: function(data){
		    	populateValues(data);
		    },
		    error: function(data) {
		    	alert("No student with that roll number found");
		    }
		});
	}
	function populateValues(data){
		document.getElementById("name").value = data.name;
		document.getElementById("physics").value = data.physicsMarks;
		document.getElementById("chemistry").value = data.chemistryMarks;
		document.getElementById("maths").value = data.mathMarks;
		document.getElementById("grade").value = data.grade;
		document.getElementById('profile_pic').src = "img/"+document.getElementById("rollNum").value+".png";
		total = data.physicsMarks + data.chemistryMarks + data.mathMarks;
		$("#total").val(total);
	}
</script>