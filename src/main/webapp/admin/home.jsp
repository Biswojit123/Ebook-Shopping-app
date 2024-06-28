<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: blue;
}

a:hover {
	text-decoration: none;
	color: green;
}
</style>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="navBar.jsp"%>
	<!-- Restriction for accessing the ADMIN home page -->
	<%
	User userObject = (User) session.getAttribute("Userobj");
		if(userObject == null) {
			response.sendRedirect("../login.jsp");
		}
	%>
	<!-- End -->
	<div class="container-fluid mb-5">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="addBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							---------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="allBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>All Books</h4>
							---------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-bag-shopping fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a  data-toggle="modal" data-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-success"></i><br>
							<h4>Logout</h4>
							------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<!-- Logout Model Start  -->
	
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you want to logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a type="button" class="btn btn-danger" href="../logoutServlet">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- Logout model End -->
</body>
</html>