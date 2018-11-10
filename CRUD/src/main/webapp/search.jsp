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
	<form method="post">
		
		<label for="roll">Roll Number</label> 
		<input type="text" id="rollNum" name="roll" required> 
		
		<input type="button" value="Search" onclick="search()">
		<button onclick="location.href = 'index.jsp';" id="insert_button" >Insert Page</button>
		<button onclick="location.href = 'update.jsp';" id="update_button" >Update Page</button>
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
		
		<label for="profile_pic">Pic</label>
		<input type="image" id="profile_pic" readonly/> 
</div>
</html>
<script>
	function search(){
		var rollNum = document.getElementById("rollNum").value;
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
		    	alert("Problem occurred while fetching data");
		    }
		});
	}
	function populateValues(data){
		document.getElementById("name").value = data.name;
		document.getElementById("physics").value = data.physicsMarks;
		document.getElementById("chemistry").value = data.chemistryMarks;
		document.getElementById("maths").value = data.mathMarks;
		document.getElementById('profile_pic').src = "img/"+document.getElementById("rollNum").value+".png";
		total = data.physicsMarks + data.chemistryMarks + data.mathMarks;
		$("#total").val(total);
	}
</script>