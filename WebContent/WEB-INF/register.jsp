<%-- <%@ page import = "java.util.HashMap, java.util.Set" %>	 not needed with JSTL !!!!--%>	
<%! String title = "SumWear - Register page"; %>
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
				<a href = "<%= root %>/Home">home</a> > register
			</nav>
			<section id = "content">
				<article>
					<br/>
					<h2 class = "homepage">Register today and become a SumWearer</h2>
					
					<br/><br/>
					<div id="formdiv">
						<%-- NOT NEEDED with JSTL !!! --%>
						<%-- <% 
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
						%> --%>
						
						<%-- <h5 class="<%= request.getAttribute("h5class") %>"><%= request.getAttribute("notification") %></h5> --%>
						<%-- note an attribute called class would cause issues with JSTL!!! that's why I renamed it h5class --%>
						<h5 class='<c:out value="${h5class}"/>' > <c:out value="${notification}"/> </h5>
						
						<form method ="post" action="<%= root %>/Home">
						
							<p>
								<label for="name"> First name:  </label>
								<input type="text" name="first" value="${first}"/> 
								<label for="name" class="error"> <c:out value='${errors.get("firstError")}'/> </label> 
							<p/>
							<p>
								<label for="last"> Last name: </label>
								<input type="text" name="last" value="${last}"/> 
								<label for="name" class="error"> <c:out value='${errors.get("lastError")}'/> </label> 
							<p/>
							<p>
								<label for="email"> Email: </label>
								<input type="text" name="email" value="${email}"/>
								<label for="name" class="error"> ${errors["emailError"]} </label> 
							<p/>
							<p>
								<label for="pwd"> Password: </label>
								<input type="password" name="pwd"/>
								<%-- <label for="pwd" class="error"> <%= errors.get("pwdError") %>  </label> --%>
								<label for="name" class="error"> <c:out value='${errors.get("pwdError")}'/> </label> 
							<p/>
							<p>
								<label for="confirm"> Confirm password: </label>
								<input type="password" name="confirm"/>
								<%-- <label for="confirm" class="error"> <%= errors.get("confirmError") %>  </label> --%>
								<label for="name" class="error"> <c:out value='${errors.get("confirmError")}'/> </label> 
							<p/>
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