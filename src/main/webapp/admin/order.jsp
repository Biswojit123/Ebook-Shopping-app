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
<title>Admin:Orders Book</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="navBar.jsp"%>
	<%
	User user1 = (User) session.getAttribute("Userobj");
	if (user1 == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid p-5">
		<h1 class="text-center">Order Books</h1>
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookOrderDaoImp boi = new BookOrderDaoImp(DBConnection.getConnection());
				List<Book_Order> blist = boi.getAllOrderBook();

				for (Book_Order b : blist) {
				%>
				<tr>
					<th><%=b.getOrderId() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getFulladd() %></td>
					<td><%=b.getPhoneNo() %></td>
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
	<%@include file="footer.jsp"%>
</body>
</html>