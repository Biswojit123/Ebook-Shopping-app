<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:AddBooks</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="navBar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h4>Add Books</h4>
					</div>
					<!--Success Message Display here -->
					<%
					String successMsg = (String) session.getAttribute("success-Msg");

					if (successMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=successMsg%>
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
					<div class="alert alert-danger" role="alert"><%=msgError%></div>
					<%
					session.removeAttribute("failed-Msg");
					}
					%>
					<!-- Failed message end here -->
					<div class="card-body">
						<form action="../addbook" method="POST"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputBookName">Book Name</label> <input
									type="text" class="form-control" id="exampleInputBookName"
									aria-describedby="emailHelp" placeholder="Book Name"
									name="bookname">
							</div>
							<div class="form-group">
								<label for="exampleInputAuthorName">Author Name</label> <input
									type="text" class="form-control" id="exampleInputAuthorName"
									placeholder="Author Name" name="authorname">
							</div>
							<div class="form-group">
								<label for="exampleInputPrice">Price</label> <input
									type="number" class="form-control" id="exampleInputPrice"
									placeholder="Price" name="price">
							</div>
							<div class="form-group">
								<label for="exampleInputCategories">Categories</label> <select
									id="exampleInputCategories" class="form-control" name="btype">
									<option selected>--Select--</option>
									<option value="new">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputCategories">Book status</label> <select
									id="exampleInputCategories" class="form-control" name="bstatus">
									<option selected>--Select--</option>
									<option value="active">Active</option>
									<option value="inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputPhoto">Upload Photo</label> <input
									type="file" class="form-control-file" id="exampleInputPhoto"
									placeholder="Choose file" name="bimage">
							</div>
							<button type="submit" class="btn btn-primary p-2">Add
								Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>