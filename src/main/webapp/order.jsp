<%@page import="com.biswo.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.biswo.helper.DBConnection"%>
<%@page import="com.biswo.Dao.BookOrderDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Order</title>
<%@include file="./allComponate/allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>
	<%
	User user1 = (User) session.getAttribute("Userobj");
	if (user1 == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid p-3">
		<h4 class="text-center text-primary">My Orders</h4>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				User user = (User) session.getAttribute("Userobj");
				BookOrderDaoImp boi = new BookOrderDaoImp(DBConnection.getConnection());
				List<Book_Order> blist = boi.getOrderBook(user.getEmail());

				for (Book_Order b : blist) {
				%>

				<tr>
					<th><%=b.getOrderId() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>