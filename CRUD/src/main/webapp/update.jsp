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
	<p align="center">UPDATE STUDENT</p>
	<form method="post">
		
		<label for="roll">Roll Number to update</label> 
		<input type="text" id="rollNum" name="roll" required> 
		
		<input type="button" value="Search" onclick="search()">
		<input type="button" id="insert_button" value="Insert page" onclick="insert_click()">
		<input type="button" id="search_button" value="Search page" onclick="search_click()">
	</form>
</div>

<div id="division" class="container">
<form id="update_form" >
		<label for="name">Student Name</label> 
		<input type="text" id="name" name="name" required="required"/>
		 
		<label for="physics">Physics</label> 
		<input type="number" id="physics" name="physics" required="required"/>
		 
		<label for="chemistry">Chemistry</label>
		<input type="number" id="chemistry" name="chemistry" required="required"/>
		
		<label for="Maths">Maths</label> 
		<input type="number" id="maths" name="maths" required="required"/>
		
		<label for="dob">DOB</label> 
		<input type="date" id="dob" name="dob" required="required"/>
		 
		<label for="total">Total</label>
		<input type="number" id="total" name="total" readonly/>
		
		<label for="grade">Grade</label>
		<input type="text" id="grade" name="grade" readonly>
		
		<label for="profile_pic">Pic</label>
		<input type="image"  src="img/index.png" id="profile_pic"/> 
		
		<input type="file" id="profile_pic"  name="profile_pic" />
		
		<input type="button" id="update_btn" value="Update" onclick="update()"/>
		<input type="submit" style="display: none;"/>
</form>
		<p id="success_p" style="display: none;">Student updated successfully</p>
    	<p id="failure_p" style="display: none;">Error occurred while updating student</p>
</div>
</html>
<script>
	function search(){
		var rollNum = document.getElementById("rollNum").value;
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
	    function insert_click() {
	    	location.reload();
	        window.location.assign('index.jsp');
	    }
	    function search_click() {
	    	location.reload();
	        window.location.assign('search.jsp');
	    }

	
	function populateValues(data){
		document.getElementById("name").value = data.name;
		document.getElementById("physics").value = data.physicsMarks;
		document.getElementById("chemistry").value = data.chemistryMarks;
		document.getElementById("maths").value = data.mathMarks;
		document.getElementById("dob").value = data.dob;
		document.getElementById("grade").value = data.grade;
		debugger;
		document.getElementById('profile_pic').src = "img/"+document.getElementById("rollNum").value+".png";
		total = data.physicsMarks + data.chemistryMarks + data.mathMarks;
		$("#total").val(total);
	}
	
	function update(){
		var isvalidate = $("#update_form")[0].checkValidity();
		debugger;
		if(!isvalidate){
			var $myForm = $("#update_form");
			$myForm.find(':submit').click();
		}else{
			$.ajax({
	    	 	type: 'POST', // GET
	    	 	contentType:"application/json" ,
				url:"http://localhost:10001/CRUD/rest/student/update",
	        	dataType : "json", 
	        	data : formToJSON(),
	    		error: function(data){
	    			if(data.status == 200){
	    				debugger;
	    				$('#failure_p').hide();
		            	$('#success_p').show();
	    				uploadImage();
	    			}else{
		    			$('#success_p').hide();
		    			$('#failure_p').show();
	    			}
	    		}
	    	});
			setTimeout(function(){ location.reload(); }, 2000);
		}
	}
	function uploadImage(){
		var formData = new FormData();
		var rollno = document.getElementById("rollNum").value;
		var pic_url = "/home/sagar/git/repository/CRUD/src/main/webapp/img/"+rollno;
		var file = $('input[name="profile_pic"').get(0).files[0];
		formData.append("pic", file);
		formData.append("pic_url",pic_url);
		if(file != null){
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
		
	}
	
	function formToJSON(){
		var name = document.getElementById("name").value;
		var rollno = document.getElementById("rollNum").value;
		var physicsmarks = document.getElementById("physics").value;
		var chemistrymarks = document.getElementById("chemistry").value;
		var mathmarks = document.getElementById("maths").value;
		var dob = document.getElementById("dob").value;
		var pic_url = "/home/sagar/git/repository/CRUD/src/main/webapp/img/"+rollno;
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