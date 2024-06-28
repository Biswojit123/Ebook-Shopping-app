<%@page import="com.biswo.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.biswo.helper.DBConnection"%>
<%@page import="com.biswo.Dao.DaoBookDetailsImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old:Book</title>
<%@include file="./allComponate/allCss.jsp"%>
</head>
<body>
	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>
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

	<div class="container-fluid p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%User u = (User) session.getAttribute("Userobj");
				if (u == null) {
					response.sendRedirect("login.jsp");
				}
				String email = u.getEmail();
				DaoBookDetailsImp bdi = new DaoBookDetailsImp(DBConnection.getConnection());
				List<BookDetails> list = bdi.getDetailsOfOldBook(email, "old");
				
				for(BookDetails b :list) {
				%>
				<tr>
					<th><%=b.getBookName() %></th>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getCategories() %></td>
					<td><a href="deletebook5?email=<%= b.getEmail() %>&&cate=<%=b.getCategories() %>&&id=<%=b.getBookId()%>" class="btn btn-danger">Delete</a></td>
				</tr>
				<%	
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>