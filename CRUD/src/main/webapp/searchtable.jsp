<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/main.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <title>Student information system</title>
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
 
    <script>
        $.jgrid = $.jgrid || {};
        $.jgrid.no_legacy_api = true;
        $(document).ready(function() {
        	  jQuery.fn.carousel.Constructor.TRANSITION_DURATION = 2000  // 2 seconds
        	});
    </script>
    
    <script>
    
    function search(){
    	
    	
    	$('#grid1b').jqGrid('GridUnload');
		$.ajax({
		    type: 'POST',
		    contentType:"application/json" ,
		    url: "http://localhost:10001/CRUD/rest/student/search",
		    data : formToJSON(),
		    dataType : "json", 
		    success: function(data){
		    	populateGrid(data);
		    	
		    },
		    error: function(data) {
		    	alert("No student with that roll number found");
		    }
		});
	}
    
  
	function populateGrid(data_passed) {
        "use strict";
        $("#grid1b").jqGrid({
            colModel: [
                { name: "rollNumber", label: "Roll Number", key:true, width: 100, align: "center", sorttype: "number" },
                { name: "name", label: "Name", width: 100, align: "center" },
                { name: "dob", label: "Date of Birth", width: 100, align: "center", sorttype: "date",
                    formatter: "date", formatoptions: { newformat: "d-M-Y" } },
                { name: "physicsMarks", label: "Physics Marks", width: 100, template: "number", align: "center"},
                { name: "chemistryMarks", label: "Chemistry Marks", width: 100, template: "number", align: "center"},
                { name: "mathMarks", label: "Math Marks", width: 100, template: "number", align: "center"},
                { name: "total", label: "Total Marks", width: 100, template: "number", align: "center"},
                { name: "grade", label: "Grade", width: 100, align: "center",
                	formatter: "select",
                    formatoptions: { value: "A:A;B:B;C:C;D:D;F:F", defaultValue: "A	" },
                    stype: "select",
                    searchoptions: { value: ":Any;A:A;B:B;C:C;D:D;F:F" } },
                { name: "profile_pic", label: "Profile pic", formatter: profile_formatter, align: "center", search:false},
            ],
            data: data_passed,
            iconSet: "fontAwesome",
            idPrefix: "g5_",
            rownumbers: true,
            sortname: "rollNumber",
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
	
	function profile_formatter(options, rowObject) 
    {	
		var cellvalue = rowObject.rowData.rollNumber;
		cellvalue = "img/"+cellvalue+".png;"
      	var html = "<img width=\"100\" height=\"50\" src='"+cellvalue+"'/>";
      	return html;
    }
	function formToJSON() 
	{
		var from_rollNum = document.getElementById("from_rollNum").value;
		var to_roll = document.getElementById("to_roll").value;
		var eqn = JSON.stringify({
			"from_rollNum": from_rollNum,
			"to_roll": to_roll
        });
		return eqn;
	}
    </script>
 <style rel="stylesheet" type="text/css">
 .carousel-inner .carousel-item {
  transition: -webkit-transform 1s ease;
  transition: transform 1s ease;
  transition: transform 1s ease, -webkit-transform 1s ease;
}
.newclass {
	margin-top: 200px;
	margin-left: 300px;
}
th, td {
    border-bottom: 1px solid #ddd;
     padding: 15px;
    text-align: center;
}
</style>

<title>Student Information System</title>

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
</head>
<body style="background:rgba(4,9,30,1)">
	<header id="header" id="home" style="background-color: rgba(0,0,0,1)">

		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<h3 style="color: white">Search Student Details</h3>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="home.jsp">Home</a></li>
						<li><a href="insert.jsp">Insert Student Info</a></li>
						<li><a href="update.jsp">Update Student Info</a></li>
						<li><a href="messages.jsp">Messages</a></li>
						<li><a href="index.jsp">Logout</a></li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
		<div class="container main-menu">
			<div style="margin-left:180px">
			<input id="from_rollNum" type="number" name="fromrollnumber"
				placeholder="From Roll Number" onfocus="this.placeholder = ''"
				onblur="this.placeholder = 'From Roll Number'"> <input
				type="number" id="to_roll" name="to_rollNum" placeholder="To Roll Number"
				onfocus="this.placeholder = ''"
				onblur="this.placeholder = 'To Roll Number'">

				<button style="background-color: #FF5006 ;border: 1px solid #000;
		    border-color: #FF5006 ; color:#fff ; width:150px ; padding: 2px 4px;" onclick="search()">Submit</button>
			</div>
		</div>

	</header>
	<!-- #header -->
	
	<div style="margin-top:200px;margin-left:180px"><table id="grid1b"></table></div>

	<div style="margin-top:200px;margin-left:180px"><table id="grid1b"></table></div>
      			
</body>
</html>