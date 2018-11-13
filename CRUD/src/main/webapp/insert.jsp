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
	<p align="center">INSERT STUDENT</p>
    <input type="button" onclick="location.href = 'index.jsp';" value="Home page" id="home_button" >
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
        
        <input type="button" id="submit_button" value="Insert" onclick="submitForm()"/>
        <input type="submit" style="display: none;"/>
    </form>
    <p id="success_p" style="display: none;">Student added successfully</p>
    <p id="failure_p" style="display: none;">Student already exists please enter another number</p>
</div>
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
