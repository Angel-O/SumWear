<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome back</title>
</head>
<%@ page import = "com.Angelo.beans.User" %>

<%  
	String username = "";
	String greeting = ""; 
	User user = (User) session.getAttribute("loggedInUser");
	if (user != null) {
		username = ((User) session.getAttribute("loggedInUser")).getFirst();
		greeting += "Hi "+username+", come back soon for more";
	}
	 else {
		greeting += "You are not signed in";
	}
%>
<body>
	<p>
	
	   <%= greeting %>
	
	</p>
</body>
</html>