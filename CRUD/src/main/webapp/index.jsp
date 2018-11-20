
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>

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
	<header id="header" id="home">

		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div>
					<h1 style="color: white">Student Information System</h1>
				</div>
			</div>
		</div>
	</header>
	<!-- #header -->


	<section class="newclass">
		<div class="container">
			<div class="row">
			<a href="insert.jsp">
				<div class="col-lg-4">
				<div>
					<img src="img/add.jpeg"  height="200" width="200" style="margin-left:70px ;margin-bottom:10px"/>
				</div>
					<div class="single-feature">
						<div class="title">
							<h4>Insert New Student Details</h4>
						</div>
						<div class="desc-wrap">
							<p>Insert new Student details in the Organization.</p>
							<a href="insert.jsp">Add Student Info</a>
						</div>
					</div>
				</div>
				</a>
				<a href="search.jsp">
				<div class="col-lg-4">
				<div>
					<img src="img/search.jpeg"  height="200" width="200" style="margin-left:70px ;margin-bottom:10px"/>
				</div>
					<div class="single-feature">
						<div class="title">
							<h4>Search Student Record</h4>
						</div>
						<div class="desc-wrap">
							<p>Search one or multiple Student records based on their Roll
								Number.</p>
							<a href="search.jsp">Search Student Info</a>
						</div>
					</div>
				</div>
				</a>
				<a href="update.jsp">
				<div class="col-lg-4">
				<div>
					<img src="img/update.jpeg"  height="200" width="200" style="margin-left:70px ;margin-bottom:10px"/>
				</div>
					<div class="single-feature">
						<div class="title">
							<h4>Update Student Record</h4>
						</div>
						<div class="desc-wrap">
							<p>Update Student's information by searching via Roll Number.
							</p>
							<a href="update.jsp">Update Student Info</a>
						</div>
					</div>
				</div>
				</a>
			</div>
		</div>
	</section>
	
</body>
</html>