
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<%@include file="variables.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
	$.jgrid = $.jgrid || {};
	$.jgrid.no_legacy_api = true;
	</script>
<script crossorigin="anonymous"
            src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/jquery.jqgrid.min.js"
            integrity="sha256-ELi2cs17gL2MqNzkRkogxZsVLmL+oWfeVOwZQLcp8ek="></script>
    <link rel="stylesheet" crossorigin="anonymous"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=">
    <link rel="stylesheet" crossorigin="anonymous"
          href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css"
          integrity="sha256-3oIi71IMpsoA+8ctSTIM+6ScXYjyZEV06q6bbK6CjsM=">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
<style rel="stylesheet" type="text/css">
.newclass {
	margin-top: 150px;
}

img {
	border-radius: 50%;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
	background-color: #FF5006;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	opacity: 0.8;
	position: fixed;
	bottom: 23px;
	right: 28px;
	width: 280px;
}

.open-button-get {
	background-color: #FF5006;
	color: white;
	border: none;
	cursor: pointer;
	opacity: 0.8;
	width: 180px;
	height : 35px;	
	margin-top : -15px;
	margin-left: 330px;
	
}

/* The popup form - hidden by default */
.form-popup {
	display: none;
	position: fixed;
	bottom: 0;
	right: 15px;
	border: 3px solid #f1f1f1;
	z-index: 9;
}

/* Add styles to the form container */
.form-container {
	max-width: 300px;
	padding: 10px;
	background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus
	{
	background-color: #ddd;
	outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
	background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
	opacity: 1;
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
	<header id="header" id="home"
		style="background-color: rgba(0, 0, 0, 1)">

		<div class="container main-menu" style="opacity: 1.0">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<h3 style="color: white">Messages</h3>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="home.jsp">Home</a></li>
						<li><a href="insert.jsp">Insert Student Info</a></li>
						<li><a href="searchhome.jsp">Search Student Info</a></li>
						<li><a href="update.jsp">Update Student Info</a></li>
						<li><a href="index.jsp">Logout</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>

	</header>
	<!-- #header -->
	<div style="margin-top: 150px">
		<div style="margin-left: 250px">
		<div>
			<h4 style="color: white">Received messages
			<button type="button" class="open-button-get" id = "get_messages" onclick="getMessages()">Get messages</button>
			</h4>
		</div>	
			<div style="margin-top: 20px"><table id="grid1b"></table></div>
			<button class="open-button" onclick="openForm()">Send Message</button>

			<div class="form-popup" id="myForm">
				<form class="form-container">
					<h2>Send Messages</h2>

					<label for="email"><b>User List</b></label> 
					<select id="to_user">
					
					</select>
					 <label for="psw"><b>Message</b></label>
					<!-- <input type="password" placeholder="Enter Password" name="psw" required> -->
					<textarea rows="7" id="message_text" cols="21"></textarea>
					<button type="button" style="margin-top: 10px" id="send_button" onclick="sendMessage()" class="btn">Send</button>
					<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<script>
$( document ).ready(function() {
	 populateDropDown();
	 setInterval("getMessages()", 2000);
});
function sendMessage(){
   	var message = document.getElementById("message_text").value;
   	var toUser = $('#to_user').find(":selected").text();
   	var formData = new FormData();
   	formData.append("message", message);
   	formData.append("toUser", toUser);
   	$.ajax({
	    type: 'POST',
		processData: false,
		contentType: false,
	    url: "http://localhost:10001/CRUD/rest/student/sendmessage",
	    data : formData,
	    success: function(data){
	    	alert("Your message is sent");
	    	$('#message_text').val('');
	    }, error: function(data) {
	    	alert("Your message is sent");
	    	$('#message_text').val('');
	    }
	});
}


function getMessages() {
	$('#grid1b').jqGrid('GridUnload');
	var formData = new FormData();
	$.ajax({
	    type: 'POST',
		processData: false,
		contentType: false,
	    url: "http://localhost:10001/CRUD/rest/student/getmessages",
	    data : formData,
	    success: function(data){
	    	populateGrid(data);
	    },
	    error: function(data) {
	    	alert("No new messages");
	    }
	});
}

function openForm() {
    document.getElementById("myForm").style.display = "block";
}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
}
function populateGrid(data_passed) {
    "use strict";
    $("#grid1b").jqGrid({
        colModel: [
            { name: "id",hidden: true, key:true, width: 100, align: "center", sorttype: "number" },
            { name: "fromUser", label: "From", width: 100, align: "center" },
            { name: "sentOn", label: "Date & Time", width: 163, align: "center", sorttype: "date",
                formatter: "date", formatoptions: { srcformat: "ISO8601Long", newformat: "d/m/Y h:i:s A" } },
            { name: "message", label: "Message", width: 400, align: "center" },
            {name:'delete',hidden:true ,search:false,index:'id',width:118,sortable: false,formatter: deleteLink},
        ],
        data: data_passed,
        iconSet: "fontAwesome",
        idPrefix: "g5_",
        rownumbers: true,
        sortname: "sentOn",
        sortorder: "asc",
        threeStateSort: true,
        sortIconsBeforeText: true,
        headertitles: true,
        toppager: true,
        pager: true,
        rowNum: 5,
        viewrecords: true,
        searching: {
            defaultSearch: "cn"
        },
    }).jqGrid("filterToolbar");
}

function deleteLink(cellValue, options, rowdata, action)  {
    return "<a href='javascript:deleteRecord(" + rowdata.id + ")'></a>";
}

function deleteRecord(id){
	var formData = new FormData();
	formData.append("id",id);
	$.ajax({
	    type: 'POST',
		processData: false,
		contentType: false,
	    url: "http://localhost:10001/CRUD/rest/student/deletemessage",
	    data : formData,
	    success: function(data){
	    	$('#grid1b').jqGrid('GridUnload');
	    	var formData = new FormData();
	    	formData.append("user",user);
	    	$.ajax({
	    	    type: 'POST',
	    		processData: false,
	    		contentType: false,
	    	    url: "http://localhost:10001/CRUD/rest/student/getmessages",
	    	    data : formData,
	    	    success: function(data){
	    	    	populateGrid(data);
	    	    },
	    	    error: function(data) {
	    	    	alert("Error occured while retriving messages");
	    	    }
	    	});
	    },
	    error: function(data) {
	    	alert("Error occured while deleting messages");
	    }
	});
}
function populateDropDown(){
	debugger;
	var formData = new FormData();
	$("#to_user").empty();
	$.ajax({
	    type: 'POST',
		processData: false,
		contentType: false,
	    url: "http://localhost:10001/CRUD/rest/student/getloginusers",
	    data : formData,
	    success: function(datas){
	    	addDropDown(datas);
	    },
	});
}
function addDropDown(datas){
	debugger;
	for (i = 0; i < datas.length; i++) {
		$('#to_user').append('<option value="' + datas[i].loginId + '">' + datas[i].loginId + '</option>');
	}
}
</script>
