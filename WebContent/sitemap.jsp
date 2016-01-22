<% String root = getServletContext().getInitParameter("root"); %>
<!doctype html>
<html>
	<head>
		<title>SumWear - Site map page</title>
		
<%@ include file = "includes/header.jsp" %>

				<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Controller?dest=home">HOME</a></li>
						<li><a href = "<%= root %>/Controller?dest=shop">SHOP</a></li>
						<li><a href = "<%= root %>/Controller?dest=join">JOIN US</a></li>
					</ul>
				</nav>
			</header>
			<nav id = "location">
				<a href = "<%= root %>/Controller?dest=home">home</a> > sitemap
			</nav>
			<section id = "content">
				<article>
					<h2>Site map</h2>
					<ul>
						<li><a href = "<%= root %>/Controller?dest=home">home</a></li>
						<li>
							<a href = "<%= root %>/Controller?dest=shop">shop</a>
							<ul>
								<li><a href = "#">trunks</li>
								<li><a href = "#">tops</li>
								<li><a href = "#">shades</li>
								<li><a href = "#">flip flops</li>
							</ul>
						</li>
						<li><a href = "<%= root %>/Controller?dest=join">join us</a></li>
						<li><a href = "<%= root %>/Controller?dest=sign">sign in</a></li>
						<li><a href = "<%= root %>/Controller?dest=reg">register</a></li>
					</ul>
				</article>
			</section>

<%@ include file="/includes/footer.jsp" %>