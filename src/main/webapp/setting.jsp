<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Setting</title>

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


<%@include file="./allComponate/allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<%
	User user = (User) session.getAttribute("Userobj"); 
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>

	<div class="container-fluid">
		<h2 class="text-center">Hello, <%=user.getName() %></h2>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4>Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h4>Login & Security (Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-5">
				<a href="order.jsp">
					<div class="card p-1">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-suitcase-rolling fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-5">
				<a href="helpline.jsp">
					<div class="card p-1">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa-solid fa-address-book fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 services</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="mt-5">
		<%@include file="./allComponate/footer.jsp"%>
	</div>
</body>
</html>