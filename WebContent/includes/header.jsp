<% String headerRoot = getServletContext().getInitParameter("root"); %>
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
						<li><a href = "<%= headerRoot %>/Controller?dest=site">Sitemap</a></li>
						<li><a href = "mailto:sumwearoutfits@gmail.com">Contact us</a></li>
						<li><a href = "<%= headerRoot %>/Controller?dest=access">Accessibility</a></li>
					</ul>
				</nav>
				<h1 class = "logo">SumWear</h1>
				
				<nav id = "signindiv">
					<ul>
						<li><a href = "<%= headerRoot %>/Controller?dest=sign">Sign in</a></li>
						<li><a href = "<%= headerRoot %>/Controller?dest=reg">Register</a></li>
					</ul>
				</nav>
				
				<div id="tagdiv">
					<h3 class = "tagline">summer outfits and accessories</h3>
				</div>
				