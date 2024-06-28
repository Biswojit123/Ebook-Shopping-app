<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Address</title>
<%@include file="./allComponate/allCss.jsp"%>
</head>
<body style="background-color: #D4CDCD;">

	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 offset-md-3 mt-5">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Address</h4>
						<form action="" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPhone4">Address</label> <input
										type="text" class="form-control" id="inputPhone4"
										value="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="text-center">
								<button class="btn btn-warning text-white">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</html>