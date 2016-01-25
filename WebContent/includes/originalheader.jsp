<% String headerRoot = getServletContext().getInitParameter("root"); %>
 <%@ page import = "com.Angelo.beans.User" %>

<%  User user = (User) session.getAttribute("loggedInUser");
	boolean loggedin = false;
	if (user != null) {
		loggedin = user.isLoggedin();
	}
	String status = "You are not signed in"; 
	if (loggedin) {
		String username = ((User) session.getAttribute("loggedInUser")).getFirst();
		status = "Logged in as " + username;
	}
%>
	<link rel = "stylesheet" href = "swstyle.css">
		<!-- <meta charset= "utf-8">  -->
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name = "viewport" content = "width=device-width, initial-scale=1" >
	</head>
	<body>
		<div id = "pagecontainer">
			<header id = "topofpage">
				<nav id = "toplinks">
					<ul>
						<li> <%= status %> </li>
						<%-- <li><a href = "<%= headerRoot %>/Controller?dest=site">Sitemap</a></li>
						<li><a href = "mailto:sumwearoutfits@gmail.com">Contact us</a></li>
						<li><a href = "<%= headerRoot %>/Controller?dest=access">Accessibility</a></li> --%>
					</ul>
				</nav>
				<h1 class = "logo">SumWear</h1>
				
				<nav id = "signindiv" class = "<%= loggedin ? "below" : "ontop" %>" >
					<ul>
						<li><a href = "<%= headerRoot %>/Controller?dest=sign">Sign in</a></li>
						<li><a href = "<%= headerRoot %>/Controller?dest=reg">Register</a></li>
					</ul>
				</nav>
				
				<nav id = "signoutdiv" class = "<%= loggedin ? "ontop" : "below" %>" >
					<ul>
						<li><a href = "<%= headerRoot %>/Controller?dest=bye">Sign out</a></li>
						<li><a href = "<%= headerRoot %>/Controller?dest=more">More</a></li>
					</ul>
				</nav>
				
				<div id="tagdiv">
					<h3 class = "tagline">summer outfits and accessories</h3>
				</div>
				