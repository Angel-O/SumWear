<%! String title = "SumWear - Sign out page"; %>
<% request.setAttribute("title", title); %>
<%@ include file = "includes/header.jsp" %>
<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Home">HOME</a></li>
						<li><a href = "<%= root %>/Home?dest=shop">SHOP</a></li>
						<li><a class = "currentpage">JOIN US</a></li>
					</ul>
				</nav>
			<nav id = "hiddenlocation">
				<a href = "<%= root %>/Home">home</a> > logout
			</nav>
			<section id = "content">
				<article>
					<p>
						You successfully logged out.
					</p>
				</article>
			</section>
			
<%@ include file="/includes/footer.jsp" %>