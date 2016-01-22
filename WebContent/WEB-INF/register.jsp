<% String root = getServletContext().getInitParameter("root"); %>
<!doctype html>
<html>
	<head>
		<title>SumWear - Register page</title>
<%@ page import = "java.util.HashMap, java.util.Set" %>		
<%@ include file="/includes/header.jsp" %>

				<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Controller?dest=home">HOME</a></li>
						<li><a href = "<%= root %>/Controller?dest=shop">SHOP</a></li>
						<li><a href = "<%= root %>/Controller?dest=join">JOIN US</a></li>
					</ul>
				</nav>
			</header>
			<nav id = "location">
				<a href = "<%= root %>/Controller?dest=home">home</a> > register
			</nav>
			<section id = "content">
				<article>
					<br/>
					<h2 class = "homepage">Register today and become a SumWearer</h2>
					
					<br/><br/>
					<div id="formdiv">
						
						<% 
							HashMap<String, String> errors = new HashMap<String,String>();
							if (request.getAttribute("errors") != null) {
								errors = (HashMap<String,String>) request.getAttribute("errors"); 
							}
							else {
								Set<String> errorType = errors.keySet();
								for (String message: errorType) {
									message = "";
								}
							} 
						%>
						
						<h5 class="<%= request.getAttribute("class") %>"><%= request.getAttribute("notification") %></h5>
						
						<form method ="post" action="<%= root %>/Controller">
						
							<p>
								<label for="name"> First name:  </label>
								<input type="text" name="first" value="<%= request.getAttribute("first") %>"/> 
								<label for="name" class="error"> <%= errors.get("firstError") %> </label>
							<p/>
							<p>
								<label for="last"> Last name: </label>
								<input type="text" name="last" value="<%= request.getAttribute("last") %>"/> 
								<label for="last" class="error"> <%= errors.get("lastError") %>  </label>
							<p/>
							<p>
								<label for="email"> Email: </label>
								<input type="text" name="email" value="<%= request.getAttribute("email") %>"/>
								<label for="email" class="error"> <%= errors.get("emailError") %>  </label>
							<p/>
							<p>
								<label for="pwd"> Password: </label>
								<input type="password" name="pwd"/>
								<label for="pwd" class="error"> <%= errors.get("pwdError") %>  </label>
							<p/>
							<p>
								<label for="confirm"> Confirm password: </label>
								<input type="password" name="confirm"/>
								<label for="confirm" class="error"> <%= errors.get("confirmError") %>  </label>
							<p/>
							</br>
							<p>
								<label for="button"></label>
								<input type="submit" value="Sign up" name="button" class="button"/>
							<p/>
							<input type="hidden" name="action" value="dosignup"/>
						</form>
						
					</div>
				</article>
			</section>
			
<%@ include file="/includes/footer.jsp" %>