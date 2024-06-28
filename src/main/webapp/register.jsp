<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<style type="text/css">
.c-custom {
	background-color: #303f9f;
}
</style>

<%@include file="./allComponate/allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="./allComponate/navBar.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-header text-center text-white"
						style="background: #303f9f;">
						<i class="fa-solid fa-user-plus"></i>
						<h5>Register Page</h5>
					</div>
					<!-- Here message  display start -->
					<%
					String successMsg = (String) session.getAttribute("SuccessMsg");
					if (successMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=successMsg%>Login...<a
							href="login.jsp">Click here</a>
					</div>
					<%
					session.removeAttribute("SuccessMsg");
					}
					%>

					<!-- Error Occur-->
					<%
					String msgError = (String) session.getAttribute("FailedMsg");

					if (msgError != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=msgError%></div>
					<%
					session.removeAttribute("FailedMsg");
					}
					%>

					<div class="card-body c-custom text-white">
						<form action="register" method="POST">
							<div class="form-group">
								<label for="exampleInputEmail1">Full name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name"
									name="name" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter number"
									name="number" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password" required>
							</div>

							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree &
									term condition</label>
							</div>
							<%
							String checkMsg = (String) session.getAttribute("CheckMsg");

							if (checkMsg != null) {
							%>
							<div class="alert alert-danger" role="alert"><%=checkMsg%></div>
							<%
							session.removeAttribute("CheckMsg");
							}
							%>

							<button type="submit"
								class="btn btn-primary btn-block badge-pill">Register</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="./allComponate/footer.jsp"%>
</body>
</html>