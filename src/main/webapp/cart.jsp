<%@page import="java.util.List"%>
<%@page import="com.biswo.helper.DBConnection"%>
<%@page import="com.biswo.entity.Cart"%>
<%@page import="com.biswo.Dao.DaoCartImp"%>
<%@page import="com.biswo.Dao.DaoCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:cart</title>
<%@include file="./allComponate/allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">


	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>

	<%
	User user = (User) session.getAttribute("Userobj");
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String successMsg = (String) session.getAttribute("successMsg");
	if (successMsg != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=successMsg%>
	</div>
	<%
	session.removeAttribute("successMsg");
	}
	%>
	<% String failedMsg = (String) session.getAttribute("failedMsg");
		if(failedMsg != null) {
	%>
	<div class="alert alert-danger text-center" role="alert"><%=failedMsg%></div>
	<%	
		session.removeAttribute("failedMsg");
		}
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 p-4">
				<div class="card">
					<h2 class="text-center text-success">Your Selected Items</h2>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("Userobj");
								DaoCartImp dci = new DaoCartImp(DBConnection.getConnection());

								List<Cart> lis = dci.getUserCartById(u.getId());
								Double totalprice = 0.0;
								for (Cart c : lis) {
									totalprice = c.getTotal_price();
								%>

								<tr>
									<th><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="removebook?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()  %>"
										class="btn btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalprice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="cpl-md-6 p-4">
				<div class="card">
					<h2 class="text-center text-success">Your Details For Order</h2>
					<div class="card-body">
						<form action="orderservlet1" method="post">
							<input type="hidden" name="id" value="<%= u.getId()%>">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputName4">Name</label> <input type="text" name="name"
										class="form-control" id="inputName4"  value="<%=u.getName() %>"></div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Email</label> <input type="email" name="email"
										class="form-control" id="inputEmail4" value="<%=u.getEmail() %>">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPhone4">Phone Number</label> <input
										type="text" class="form-control" id="inputPhone4" value="<%=u.getPhNumber() %>" name="phone">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input
										type="text" class="form-control" id="inputPassword4" name="address" required
										>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text" name="landmark"
										class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text" name="city"
										class="form-control" id="inputPassword4" required
										>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text" name="state"
										class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="text" name="zip"
										class="form-control" id="inputPassword4" required
										>
								</div>
							</div>
							<div class="form-group">
								<label for="selection">Payment Type</label> <select name="payment"
									id="selection" class="form-control">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>