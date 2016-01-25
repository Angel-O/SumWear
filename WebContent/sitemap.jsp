<!-- <title>SumWear - Site map page</title> -->
<%! String title = "SumWear - Site map page"; %>
<% request.setAttribute("title", title); %>		
		<%@ include file = "includes/header.jsp" %>

				<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Home">HOME</a></li>
						<li><a href = "<%= root %>/Home?dest=shop">SHOP</a></li>
						<li><a href = "<%= root %>/Home?dest=join">JOIN US</a></li>
					</ul>
				</nav>
			<nav id = "location">
				<a href = "<%= root %>/Home">home</a> > sitemap
			</nav>
			<section id = "content">
				<article>
					<h2>Site map</h2>
					<ul>
						<li><a href = "<%= root %>/Home">home</a></li>
						<li>
							<a href = "<%= root %>/Home?dest=shop">shop</a>
							<ul>
								<li><a href = "#">trunks</li>
								<li><a href = "#">tops</li>
								<li><a href = "#">shades</li>
								<li><a href = "#">flip flops</li>
							</ul>
						</li>
						<li><a href = "<%= root %>/Home?dest=join">join us</a></li>
						<li><a href = "<%= root %>/Home?dest=sign">sign in</a></li>
						<li><a href = "<%= root %>/Home?dest=reg">register</a></li>
					</ul>
				</article>
			</section>

<%@ include file="/includes/footer.jsp" %>