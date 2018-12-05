
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


	<header id="header" id="home" style="background-color: rgba(0,0,0,1)">

		<div class="container main-menu" style="opacity: 1.0">
			<div class="row align-items-center justify-content-between d-flex" >
				<div id="logo">
					<h3 style="color: white">Insert Student Details</h3>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="home.jsp" >Home</a></li>
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
	<div style="margin-left:350px">
	<section class="newclass">
		<div class="container">
			<div class="row">
			
				<a href="searchimage.jsp">
				<div class="col-lg-4">
				<div>
					<img src="img/search.jpeg"  height="200" width="200" style="margin-left:70px ;margin-bottom:10px"/>
				</div>
					<div class="single-feature">
						<div class="title">
							<h4>Search Student Record (Images)</h4>
						</div>
						<div class="desc-wrap">
							<p>View students in form of images and basic information.</p>
							<a href="searchimage.jsp">Search Student Info</a>
						</div>
					</div>
				</div>
				</a>
				<a href="searchtable.jsp">
				<div class="col-lg-4">
				<div>
					<img src="img/update.jpeg"  height="200" width="200" style="margin-left:70px ;margin-bottom:10px"/>
				</div>
					<div class="single-feature">
						<div class="title">
							<h4>Search Student Record (Table)</h4>
						</div>
						<div class="desc-wrap">
							<p>Search Students in Table by searching via Roll Number.
							</p>
							<a href="searchtable.jsp">Search Student Info</a>
						</div>
					</div>
				</div>
				</a>
			</div>
		</div>
	</section>
	</div>
	</body>
	</html>
	
	