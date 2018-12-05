<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<script>
var user;
function setUser(data){
	debugger;
	<%String username = (String)request.getAttribute("un");
	session.setAttribute("UserName", username);%>
}

function getUser(){
	debugger;
	return user;
}
</script>
</body>
</html>