<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<%@include file="./allComponate/allCss.jsp"%>
<style type="text/css">
.bg-coustm {
	background: #303f9f;
}
</style>
</head>
<body style="background-color: #D4CDCD;">
	<%@include file="./allComponate/navBar.jsp"%>
	<div class="container-fluid mb-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 mb-5">
					<div class="card-header text-center bg-coustm text-white ">
						<i class="fa-solid fa-user"></i>
						<h5>Login Page</h5>
						<%session.removeAttribute("Userobj"); %>
						<!-- error message password and email incorrect  -->
						<%
						String invalideMsg = (String) session.getAttribute("Failed-msg");

						if (invalideMsg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=invalideMsg%></div>
						<%
						session.removeAttribute("Failed-msg");
						}
						%>
						
						
						<%
						String successMsg = (String) session.getAttribute("success");
						if (successMsg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=successMsg%>
						</div>
						<%
						session.removeAttribute("success");
						}
						%>
						

						<!-- Here message  display start -->
						
						
					</div>

					<div class="card-body bg-coustm text-white">
						<form action="login" method="POST">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password" required>
							</div>
							<button type="submit"
								class="btn btn-primary btn-block badge-pill">Login</button>
							&nbsp;&nbsp;&nbsp;<a href="register.jsp" class="text-white">Create
								an account</a>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="./allComponate/footer.jsp"%>
</body>
</html>