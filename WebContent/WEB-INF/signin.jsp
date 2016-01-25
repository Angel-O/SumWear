<%-- <%@ page import = "java.util.HashMap" %> --%>	
<%! String title = "SumWear - Sign in page"; %>
<% request.setAttribute("title", title); %>
<%@ include file="/includes/header.jsp" %>

				<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Home">HOME</a></li>
						<li><a href = "<%= root %>/Home?dest=shop">SHOP</a></li>
						<li><a href = "<%= root %>/Home?dest=join">JOIN US</a></li>
					</ul>
				</nav>
			</header>
			<nav id = "location">
				<a href = "<%= root %>/Home">home</a> > sign in
			</nav>
			<section id = "content">
				<article>
					<br/>
					<h2 class = "homepage">Sign in</h2>
					
					<br/><br/>
					<div id="formdiv">
						
						<%-- <% HashMap<String, String> errors = (HashMap<String,String>) request.getAttribute("errors"); %>
						<% 
							String email = ""; 
							//User user = (User) session.getAttribute("loggedInUser"); // user is declared in the header!!!
							email = user != null ?  user.getEmail() : (String) request.getAttribute("email");
						%> --%>
						
						<h5 class='<c:out value = "${h5class}"/>'> <c:out value="${notification}"/> </h5>
						<form method ="post" action="<%= root %>/Home">
						
							<p>
								<label for="email"> Email: </label>
								<input type="text" name="email" value='<c:out value = "${email}"/>'/>
								<label for="email" class="error"> <c:out value='${errors.get("emailError")}'/>  </label>
							<p/>
							<p>
								<label for="pwd"> Password: </label>
								<input type="password" name="pwd"/>
								<label for="pwd" class="error"> ${errors.get("pwdError")} </label>
							<p/>
							<p>
								<label for="button"></label>
								<input type="submit" value="Sign in" name="button" class="button"/>
							<p/>
							<input type="hidden" name="action" value="dologin"/>
						</form>
						
					</div>
				</article>
			</section>
			
<%@ include file="/includes/footer.jsp" %>