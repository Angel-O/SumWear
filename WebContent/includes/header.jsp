<% String root = response.encodeURL(request.getContextPath()); %>
<%@ page import = "com.Angelo.beans.User" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<!-- <meta charset= "utf-8">  -->
		<meta name = "viewport" content = "width=device-width, initial-scale=1" >
		<title><%= request.getAttribute("title") %></title>
		<link rel = "stylesheet" href = "style/swstyle.css">
	</head>
	<body>
		<div id = "pagecontainer">
			<header>
				<div id = "topofpage">
					<div id="logodiv">
						<img id="mainlogoimg" alt="brush" src="images/enlight.png">
						<img id="logoimg" alt="brush" src="images/Brush.png">
					</div>
					<div id="titlediv">
						<h1 class = "logo">SumWear</h1>
						<h3 class = "tagline">summer outfits</h3>
					</div>
					<div id = "loggedstatus">
						<%-- <p> <%= status %> </p> --%>
						<p>
							<c:choose>
								<c:when test="${loggedInUser.loggedin == true}"> Logged in as ${loggedInUser.first} </c:when>
								<c:otherwise> You are not signed in </c:otherwise>
							</c:choose>
						</p>
					</div>
					<div id = "signindiv" >
						<ul>
							<c:choose>
								<c:when test = "${loggedInUser.loggedin == true}">
									<li><a href = "<%= root %>/Home?dest=bye">Sign out</a></li>
									<li><a href = "<%= root %>/Home?dest=more">More</a></li>
								</c:when>
								<c:otherwise> 
									<li><a href = "<%= root %>/Home?dest=sign">Sign in</a></li>
									<li><a href = "<%= root %>/Home?dest=reg">Register</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</header>	