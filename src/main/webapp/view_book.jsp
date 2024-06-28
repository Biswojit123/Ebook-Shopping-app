<%@page import="com.biswo.entity.User"%>
<%@page import="com.biswo.entity.BookDetails"%>
<%@page import="com.biswo.helper.DBConnection"%>
<%@page import="com.biswo.Dao.DaoBookDetailsImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details</title>
<%@include file="./allComponate/allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="./allComponate/navBar.jsp"%> 

	<div class="container-fluid p-3">
		<div class="row p-3">
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			DaoBookDetailsImp dbi = new DaoBookDetailsImp(DBConnection.getConnection());
			BookDetails book = dbi.getDetailsById(id);
			%>
			<div class="col-md-6 text-center p-4 border bg-white">
				<img src="./book/<%=book.getPhoto()%>" width="150" height="150">
				<h3 class="mt-2">
					Book Name:<span class="text-success"><%=book.getBookName()%></span>
				</h3>
				<h3>
					Author name:<span class="text-success"><%=book.getAuthor()%></span>
				</h3>
				<h3>
					categories:<span class="text-success"><%=book.getCategories()%></span>
				</h3>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=book.getBookName()%></h2>
				<%
				if ("old".equals(book.getCategories())) {
				%>
				<h4 class="text-primary">Contact To Seller</h4>
				<h4 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:<%=book.getEmail()%></h4>
				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fa-solid fa-sack-dollar fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fa-solid fa-person-walking-arrow-loop-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shopping</p>
					</div>
				</div>
				<%
				if ("old".equals(book.getCategories())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i> Continue Shopping</a> <a
						href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%></a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<%
							if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-success btn-sm ml-4 mr-4"><i
								class="fa-solid fa-cart-shopping"></i>AddCart</a>
							<%
							} else {
							%>
							<a href="addcart?bid=<%=book.getBookId()%>&&uid=<%=us.getId()%>"
								class="btn btn-success btn-sm ml-4 mr-4"><i
								class="fa-solid fa-cart-shopping"></i>AddCart</a>
							<%
							}
							%>
						 <a href=""
						class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%></a>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>
</body>
</html>