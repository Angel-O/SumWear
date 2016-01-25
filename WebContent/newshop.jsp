<%! String title = "SumWear - Shop page"; %>
<% request.setAttribute("title", title); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>		
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
					
				</nav>
				<section id = "contentrightcol">
					<article>
						<div id = "latestbox">
							<%-- <%= request.getAttribute("shop")  %> --%>
							<%-- <c:set var="stuff" value="${shop}"/> --%>
							<p>
								<table id = "shoptable">
										<tr> <th>Name</th> <th>Description</th> <th>Price</th> <th>Cat.</th> </tr>
									<c:forEach var="item" items="${itemList}">
										<tr>
											<td>${item.prodName}</td>
											<td>${item.prodDesc}</td>
											<td>£ ${item.prodPric}</td>
											<td class = "noRightBorder">${item.prodCate}</td>
										</tr>
									</c:forEach>
								</table>
							</p>
						</div>
					</article>
					<article>
						
					</article>
				</section>
			</div>
			
<%@ include file="/includes/footer.jsp" %>			