<% String root = getServletContext().getInitParameter("root"); %>
<!doctype html>
<html>
	<head>
		<title>SumWear - Sign in page</title>
<%@ page import = "java.util.HashMap" %>	
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
				<a href = "<%= root %>/Controller?dest=home">home</a> > sign in
			</nav>
			<section id = "content">
				<article>
					<br/>
					<h2 class = "homepage">Sign in</h2>
					
					<br/><br/>
					<div id="formdiv">
						
						<% HashMap<String, String> errors = (HashMap<String,String>) request.getAttribute("errors"); %>
						
						<h5 class="<%= request.getAttribute("class") %>"><%= request.getAttribute("notification") %></h5>
						
						<form method ="post" action="<%= root %>/Controller">
						
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
							<%-- <p>
								<label for="confirm"> Confirm password: </label>
								<input type="password" name="confirm"/>
								<label for="confirm" class="error"> <%= errors[3] %>  </label>
							<p/> --%>
							</br>
							<p>
								<label for="button"></label>
								<input type="submit" value="Log in" name="button" class="button"/>
							<p/>
							<input type="hidden" name="action" value="dologin"/>
						</form>
						
					</div>
				</article>
			</section>
			
<%@ include file="/includes/footer.jsp" %>