<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String root = getServletContext().getInitParameter("root"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>SumWear - Home page</title>
		
<%@ include file = "includes/header.jsp" %>

				<nav id = "mainnavigationmenu">
					<ul>
						<li><a class = "currentpage">HOME</a></li>
						<li><a href = "<%= root %>/Controller?dest=shop">SHOP</a></li>
						<li><a href = "<%= root %>/Controller?dest=join">JOIN US</a></li>
					</ul>
				</nav>
			</header>
			<nav id = "hiddenlocation">
				<a href = "<%= root %>/Controller?dest=home">home</a>
			</nav>
			<section id = "content">
				<article>
					<h2 class = "homepage">Wear the summer</h2>
					<img src = "images/trunks.png" width= "43" height= "43" alt = "trunks icon">
					<img src = "images/top.png" width= "43" height= "43" alt = "top icon">
					<img src = "images/sunglasses.png" width= "43" height= "43" alt = "shades icon">
					<img src = "images/flipflops.png" width= "43" height= "43"  alt = "flip flops icon">
					<p><span class = "brand">SumWear</span> stands for Summer Wear. We design and produce our own summer clothes and accessories, for men.<br>
					We created the brand in 1996 after a memorable holiday in Panama. The sun, the beach and the colours: we aim to give you the same experience with our products line.<br>
					You will find the best swimming trunks, the coolest tops, the most popular sunglasses and the most comfortable and trendy flip flops: our mission is to bring the summer to you!<br> 
					Wear the summer...with <span class = "brand">SumWear</span>.
					</p>
				</article>
				<article>
					<h2 class = "homepage">Visit our shops</h2>
					<img src = "images/map.png" width= "43" height= "43" alt = "map icon">
					<p>We have 2 shops in London:</p>
					<ul>
						<li class = "homepage"><span class = "venue">Earlsfield</span><br>
							address: 95 southern road - SW4 7RB<br>
							tel: 023478651<br>
							opening times:
							<ul>
								<li>mon-fri: 9am - 8pm</li>
								<li>sat: 10am - 5pm</li>
								<li>sun: closed</li>
							</ul>
						</li>
						<li class = "homepage"><span class = "venue">Stratford</span><br>
							address: 342 regent close - E51 6BV<br>
							tel: 028765348<br>
							opening times:
							<ul>
								<li>mon-fri: 9am - 8pm</li>
								<li>sat: 10am - 5pm</li>
								<li>sun: 11am - 4pm</li>
							</ul>
						</li>
					</ul>
					<p id = "bottom">
					New opening coming soon. As we like to say: SumWear is somewhere...near you.
					</p>
				</article>
			</section>
			
<%@ include file="/includes/footer.jsp" %>