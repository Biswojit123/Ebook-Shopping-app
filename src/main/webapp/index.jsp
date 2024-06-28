
<%@page import="com.biswo.entity.BookDetails"%>
<%@page import="com.biswo.helper.DBConnection"%>
<%@page import="com.biswo.Dao.DaoBookDetailsImp"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index-Form</title>
<%@include file="./allComponate/allCss.jsp"%>
<style type="text/css">
.bgimg {
	background: url(./img/book1.jpeg);
	height: 70vh;
	width: 100%;
	background-size: cover;
	background-repeat: no repeat;
}

.card-ho:hover {
	background-color: #ffb74d;
}
</style>
</head>
<body style="background-color: #D4CDCD;">
	
	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>
	 <%User user = (User) session.getAttribute("Userobj"); %> 


	<!-- This is the Background image -->
	<div class="container-fluid bgimg">
		<h1 class="text-center" style="color: #e0e0e0">EBook Management
			System</h1>
	</div>
	<!-- End of back ground image -->

	<!-- Start the Recent Book -->
	<div class="container-fluid">
		<h1 class="text-center">Recent BOOK</h1>
		<div class="row">
			<%
			DaoBookDetailsImp dbi1 = new DaoBookDetailsImp(DBConnection.getConnection());
			List<BookDetails> list1 = dbi1.getRecentBook();
			for (BookDetails book1 : list1) {
			%>
			<div class="col-md-3">
				<div class="card card-ho">
					<div class="card-body text-center">
						<img alt="" src="./book/<%=book1.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book1.getBookName()%></p>
						<p><%=book1.getAuthor()%></p>
						<p>
							Categories:
							<%
						if (book1.getCategories().equals("old")) {
						%>
							<%=book1.getCategories()%></p>
						<div class="row ml-5">
							<a href="view_book.jsp?id=<%=book1.getBookId()%>"
								class="btn btn-success btn-sm ml-4">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2">299 <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<%=book1.getCategories()%></p>
						<div class="row">
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-4 mr-4"><i
								class="fa-solid fa-cart-shopping"></i>AddCart</a>
							<%
							} else {
							%>
							<a href="addcart?bid=<%=book1.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm ml-4 mr-4"><i
								class="fa-solid fa-cart-shopping"></i>AddCart</a>
							<%
							}
							%>
							<a href="view_book.jsp?id=<%=book1.getBookId()%>"
								class="btn btn-success btn-sm ml-4">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"><%=book1.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="./allRecentBook.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>

	<!-- End of recent Book -->
	<hr>
	<!-- Start Of New Book -->

	<div class="container-fluid">
		<h1 class="text-center">New BOOK</h1>
		<div class="row">
			<%
			DaoBookDetailsImp dbi = new DaoBookDetailsImp(DBConnection.getConnection());
			List<BookDetails> list = dbi.getNewBook();
			for (BookDetails book : list) {
			%>
			<div class="col-md-3">
				<div class="card card-ho">
					<div class="card-body text-center">
						<img alt="" src="./book/<%=book.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthor()%></p>
						<p>
							Categories:<%=book.getCategories()%></p>
					</div>
					<div class="row mb-4 ml-3">

						<%
						if (user == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-4 mr-4"><i
							class="fa-solid fa-cart-shopping"></i>AddCart</a>
						<%
						} else {
						%>
						<a href="addcart?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>"
							class="btn btn-danger btn-sm ml-4 mr-4"><i
							class="fa-solid fa-cart-shopping"></i>AddCart</a>
						<%
						}
						%>
						<a href="view_book.jsp?id=<%=book.getBookId()%>"
							class="btn btn-success btn-sm ml-4">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-2"><%=book.getPrice()%> <i
							class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="./allNewBook.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- End of New Book -->
	<hr>
	<!-- Start of Old Book -->
	<div class="container-fluid">
		<h1 class="text-center">Old BOOK</h1>
		<div class="row">
			<%
			DaoBookDetailsImp dbi2 = new DaoBookDetailsImp(DBConnection.getConnection());
			List<BookDetails> list2 = dbi2.getOldBook();
			for (BookDetails book2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card card-ho">
					<div class="card-body text-center">
						<img alt="" src="./book/<%=book2.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book2.getBookName()%></p>
						<p><%=book2.getAuthor()%></p>
						<p>
							Categories:
							<%=book2.getCategories()%></p>
					</div>
					<div class="row mb-4 ml-3">
						<a href="view_book.jsp?id=<%=book2.getBookId()%>"
							class="btn btn-success btn-sm ml-4">View Details</a> <a href=""
							class="btn btn-danger btn-sm ml-2"><%=book2.getPrice()%> <i
							class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="./allOldBook.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- End of Old BOOK -->
	<!-- Footer Start -->
	<%@include file="./allComponate/footer.jsp"%>
	<!-- Footer End -->
</body>
</html>