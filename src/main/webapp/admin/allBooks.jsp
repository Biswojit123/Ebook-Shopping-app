<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.biswo.Dao.DaoBookDetailsImp"%>
<%@ page import="com.biswo.helper.DBConnection"%>
<%@ page import="java.util.List"%>
<%@ page import="com.biswo.entity.BookDetails"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:AllBooks</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="navBar.jsp"%>
	<div class="container-fluid p-5">
		<h1 class="text-center">All Books</h1>

		<!--Success Message Display here -->
		<%
		String successMsg = (String) session.getAttribute("success-Msg");

		if (successMsg != null) {
		%>
		<div class="alert alert-success text-center" role="alert"><%=successMsg%>
		</div>
		<%
		session.removeAttribute("success-Msg");
		}
		%>
		<!-- End of Success Message -->
		<!-- Failed message display here -->
		<%
		String msgError = (String) session.getAttribute("failed-Msg");

		if (msgError != null) {
		%>
		<div class="alert alert-danger text-center" role="alert"><%=msgError%></div>
		<%
		session.removeAttribute("failed-Msg");
		}
		%>
		<!-- Failed message end here -->

		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">BookId</th>
					<th scope="col">Image</th>
					<th scope="col">Book name</th>
					<th scope="col">Author name</th>
					<th scope="col">Price</th>
					<th scope="col">Status</th>
					<th scope="col">categories</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				DaoBookDetailsImp bti = new DaoBookDetailsImp(DBConnection.getConnection());
				List<BookDetails> list = bti.disPlayAllBook();

				for (BookDetails b : list) {
				%>
				<tr>
					<th><%=b.getBookId()%></th>
					<th><img src="../book/<%=b.getPhoto()%>" height="50"
						width="50"></th>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getStatus()%></td>
					<td><%=b.getCategories()%></td>
					<td><a href="editDetails.jsp?id=<%=b.getBookId()%>"
						class="btn btn-primary btn-sm"><i
							class="fa-solid fa-pen-to-square"></i> Update</a> <a
						href="../deletebook?id=<%=b.getBookId()%>"
						class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Delete</a>
					</td>
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