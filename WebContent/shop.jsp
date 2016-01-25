<%! String title = "SumWear - Shop page"; %>
<% request.setAttribute("title", title); %>		
		<%@ include file = "includes/header.jsp" %>

				<nav id = "mainnavigationmenu">
					<ul>
						<li><a href = "<%= root %>/Home">HOME</a></li>
						<li><a class = "currentpage">SHOP</a></li>
						<li><a href = "<%= root %>/Home?dest=join">JOIN US</a></li>
					</ul>
				</nav>
			<nav id = "location">
				<a href = "<%= root %>/Home">home</a> > shop
			</nav>
			<div id = "columnsbox">
				<nav id = "navigationleftcol">
					<ul>
						<li><a href = "#">Trunks</a></li>
						<li><a href = "#">Tops</a></li>
						<li><a href = "#">Shades</a></li>
						<li><a href = "#">Flip flops</a></li>
					</ul>
				</nav>
				<section id = "contentrightcol">
					<article>
						<div id = "latestbox">
							<h2>Latest Arrivals</h2>
							<img src = "images/shirt.jpg" width= "123" height= "123" alt = "shirt">
							<img src = "images/sung2.jpg" width= "133" height= "103" alt = "shades">
							<img src = "images/flip3.jpg" width= "123" height= "123" alt = "flip flop">
							<img src = "images/trunks3.jpg" width= "123" height= "123" alt = "trunks">
						</div>
						<p>
						Our products are selected according to the latest fashion trends: here you will find the most wanted items of the season: We regularly update the catalogue to bring you the best you could ever find. Shirts or t-shirts, sunglasses, flip flops and swimming trunks: take your pick!
						</p>
					</article>
					<article>
						<h2>Offers</h2>
						<ul class = "offer">
							<li class = "offer">Buy a hawayan shirt and trunks and get a pair of sunglasses for free</li>
							<li class = "offer">Walk in with your used t-shirt to get up to 15% discount on a new item <br>
							<a href = "<%= root %>/Controller?dest=terms">Terms apply</a></li>
						</ul>
					</article>
				</section>
			</div>
			
<%@ include file="/includes/footer.jsp" %>			