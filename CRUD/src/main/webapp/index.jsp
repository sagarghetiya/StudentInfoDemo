
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
<p align="center">Home</p>
<form method="post">
<input type="button" onclick="location.href = 'index.jsp';" value="Home Page" id="home_button" >
<input type="button" onclick="location.href = 'insert.jsp';" value="Insert page" id="insert_button" >
<input type="button" onclick="location.href = 'update.jsp';" value="Update page" id="update_button" >
<input type="button" onclick="location.href = 'search.jsp';" value="Search page" id="search_button" >
</form>
</div>
</html>