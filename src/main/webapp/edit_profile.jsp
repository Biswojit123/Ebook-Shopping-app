<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit:Profile</title>
<%@include file="./allComponate/allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">
	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-5">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Update Profile</h4>
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
						<form action="updateprofile1" method="POST">
							<input type="hidden" name="id" value="<%=us.getId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Full name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=us.getName()%>"
									name="name" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=us.getEmail()%>"
									name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=us.getPhNumber()%>"
									name="number" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password" required>
							</div>

							<button type="submit"
								class="btn btn-primary btn-block badge-pill">Update</button>

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