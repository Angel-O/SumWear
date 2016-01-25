<!-- <title>SumWear - Welcome page</title> -->
<%! String title = "SumWear - Welcome page"; %>
<% request.setAttribute("title", title); %>	
	<%@ include file = "includes/header.jsp" %>


				<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Home">HOME</a></li>
						<li><a class = "currentpage">SHOP</a></li>
						<li><a href = "<%= root %>/Home?dest=join">JOIN US</a></li>
					</ul>
				</nav>
			<nav id = "hiddenlocation">
				<a href = "<%= root %>/Home">home</a> > welcome
			</nav>
			<div id = "columnsbox">
				<p>
					Welcome on board ${first}! Here are your details <br/> 
					${first} <br/> 
					${last} <br/> 
					${email} <br/> 
					${pwd}
				</p>
			</div>
			
<%@ include file="/includes/footer.jsp" %>	

	
