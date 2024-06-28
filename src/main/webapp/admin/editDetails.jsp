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
<title>Admin:Edit Book</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="navBar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h4>Update Books</h4>
					</div>
					<!-- Get the Id value from the request  -->
					<%
					int id = Integer.parseInt(request.getParameter("id"));
					DaoBookDetailsImp dbi = new DaoBookDetailsImp(DBConnection.getConnection());
					BookDetails b = dbi.getDetailsById(id);
					%>
					<div class="card-body">
						<form action="../editbook" method="POST">

							<!-- Using Hidden Form field we can provide the data to update the Book details -->
							<div class="form-group">
								<input type="hidden" name="id" value="<%=b.getBookId()%>">
							</div>


							<div class="form-group">
								<label for="exampleInputBookName">Book Name</label> <input
									type="text" class="form-control" id="exampleInputBookName"
									aria-describedby="emailHelp" placeholder="Book Name"
									name="bookname" value="<%=b.getBookName()%>">
								<!-- this line give the actual value that you want to edit -->
							</div>
							<div class="form-group">
								<label for="exampleInputAuthorName">Author Name</label> <input
									type="text" class="form-control" id="exampleInputAuthorName"
									placeholder="Author Name" name="authorname"
									value="<%=b.getAuthor()%>">
								<!-- this line give the actual value that you want to edit -->
							</div>
							<div class="form-group">
								<label for="exampleInputPrice">Price</label> <input
									type="number" class="form-control" id="exampleInputPrice"
									placeholder="Price" name="price" value="<%=b.getPrice()%>">
								<!-- this line give the actual value that you want to edit -->
							</div>
							<div class="form-group">
								<label for="exampleInputCategories">Book status</label> <select
									id="exampleInputCategories" class="form-control" name="bstatus">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="active">Active</option>
									<!-- this line give the actual value that you want to edit -->
									<option value="inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
									<%
									}
									%>
								</select>
							</div>
							<button type="submit" class="btn btn-primary p-2">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>