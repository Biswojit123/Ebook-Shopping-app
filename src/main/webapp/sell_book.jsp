<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell:Book</title>
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

	<!--Container start here -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-5">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Sell Old Book</h4>
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
						<form action="addoldbook" method="POST"
							enctype="multipart/form-data">

							<input type="hidden" name="useremail" value="<%=us.getEmail()%>">
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
								<label for="exampleInputPhoto">Upload Photo</label> <input
									type="file" class="form-control-file" id="exampleInputPhoto"
									placeholder="Choose file" name="bimage">
							</div>
							<button type="submit" class="btn btn-primary  p-2 ">Sell
								Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5">
		<%@include file="./allComponate/footer.jsp"%>
	</div>
</body>
</html>