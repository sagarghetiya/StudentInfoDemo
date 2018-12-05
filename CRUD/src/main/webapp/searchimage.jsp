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
    	$("#list_carousel").empty();
    	$("#div_carousel").empty();
    	$('#grid1b').jqGrid('GridUnload');
		$.ajax({
		    type: 'POST',
		    contentType:"application/json" ,
		    url: "http://localhost:10001/CRUD/rest/student/search",
		    data : formToJSON(),
		    dataType : "json", 
		    success: function(data){
		    	
		    	corousal(data);
		    },
		    error: function(data) {
		    	alert("No student with that roll number found");
		    }
		});
	}
    
    function corousal(students)
    {
    	debugger;
    	for (i = 0; i < students.length; i=i+3) {
			if(i==0){
				$(".carousel-indicators").append("<li data-target="+"#myCarousel"+ " data-slide-to="+i+" class="+"active"+"></li>");
				var path1 = "img/"+students[i].rollNumber+".png";
				var path2 = "img/"+students[i+1].rollNumber+".png";
				var path3 = "img/"+students[i+2].rollNumber+".png";
				$(".carousel-inner").append("<div style='margin-left:340px; margin-bottom:100px;' class="+"'carousel-item active'"+"><img src="+path1+" width='200' height='200'><img style='margin-left:10px;' src="+path2+" width='200' height='200'><img style='margin-left:10px;' src="+path3+" width='200' height='200'><div class='flex-container'><div><table style='margin-left:20px'><tr><td style='color: white'>Name : "+students[i].name+"</td></tr><tr><td style='color: white'>Roll Number : "+students[i].rollNumber+"</td></tr></table></div><div><table style='margin-left:60px'><tr><td style='color: white'>Name : "+students[i+1].name+"</td></tr><tr><td style='color: white'>Roll Number : "+students[i+1].rollNumber+"</td></tr></table></div><div><table style='margin-left:80px'><tr><td style='color: white'>Name : "+students[i+2].name+"</td></tr><tr><td style='color: white'>Roll Number : "+students[i+2].rollNumber+"</td></tr></table></div></div></div>");
			}
			else{
				var path1 = "img/"+students[i].rollNumber+".png";
				var path2 = "img/"+students[i+1].rollNumber+".png";
				var path3 = "img/"+students[i+2].rollNumber+".png";
				$(".carousel-indicators").append("<li data-target="+"#myCarousel"+ " data-slide-to="+i+"></li>");
				$(".carousel-inner").append("<div style='margin-left:340px; margin-bottom:100px;' class="+"'carousel-item'"+"><img src="+path1+" width='200' height='200'><img style='margin-left:10px;' src="+path2+" width='200' height='200'><img style='margin-left:10px;' src="+path3+" width='200' height='200'><div class='flex-container'><div><table style='margin-left:20px'><tr><td style='color: white'>Name : "+students[i].name+"</td></tr><tr><td style='color: white'>Roll Number : "+students[i].rollNumber+"</td></tr></table></div><div><table style='margin-left:60px'><tr><td style='color: white'>Name : "+students[i+1].name+"</td></tr><tr><td style='color: white'>Roll Number : "+students[i+1].rollNumber+"</td></tr></table></div><div><table style='margin-left:80px'><tr><td style='color: white'>Name : "+students[i+2].name+"</td></tr><tr><td style='color: white'>Roll Number : "+students[i+2].rollNumber+"</td></tr></table></div></div></div>");
		
			}			
		}
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
		//var from_rollNum = document.getElementById("from_rollNum").value;
		//var to_roll = document.getElementById("to_roll").value;
		var eqn = JSON.stringify({
			"from_rollNum": 1,
			"to_roll": 10000
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
.flex-container {
        display: flex;
        align-items: center; /* Use another value to see the result */
        width: 100%;
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
		

	</header>
	<!-- #header -->
	
	<script>search();</script>

	<div style="margin-top:200px;margin-left:180px"><table id="grid1b"></table></div>
      				<div id="myCarousel" class="carousel slide" data-ride="carousel">
      					<ul id="list_carousel" class="carousel-indicators">      						
      					</ul>
      					<div id="div_carousel" class="carousel-inner">
      					</div>
      					
      					<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
      						<span class="carousel-control-prev-icon"></span>
    					</a>
    					<a class="carousel-control-next" href="#myCarousel" data-slide="next">
      						<span class="carousel-control-next-icon"></span>
    					</a>
     				</div>
</body>
</html>