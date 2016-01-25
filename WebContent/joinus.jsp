<!-- <title>SumWear - Join us page</title> -->
<%! String title = "SumWear - Join us page"; %>
<% request.setAttribute("title", title); %>		
		<%@ include file = "includes/header.jsp" %>

				<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Home">HOME</a></li>
						<li><a href = "<%= root %>/Home?dest=shop">SHOP</a></li>
						<li><a class = "currentpage">JOIN US</a></li>
					</ul>
				</nav>
			<nav id = "location">
				<a href = "<%= root %>/Home">home</a> > join us
			</nav>
			<section id = "content">
				<article>
					<h2>Get in touch: we need you!</h2>
					<p>At <span class = "brand">SumWear</span> we are always looking for new talent. If you have ideas and you love summer clothing we will definitely want to know more about you. Walk into one of our shops or <a href = "mailto:sumwearoutfits/recruitment@gmail.com">send us</a> your curriculum vitae. <br><br><span class = "introduction"> Current vacancies:</span>
					</p>
					<ul>
						<li>Cashier - (Earlsfield)</li>
						<li>Shop manager - (Stratford)</li>
						<li>Promoter - (Stratford)</li>
					</ul>
				</article>
				<article>
					<p>We aim to respond to each applicant within 3 weeks.</p>
				</article>
			</section>
			
<%@ include file="/includes/footer.jsp" %>