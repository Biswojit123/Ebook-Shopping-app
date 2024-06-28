
<%@page import="com.biswo.entity.User"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> Ebooks
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<%
		User us = (User) session.getAttribute("Userobj");
		if (us != null) {
		%>
		<div class="col-md-3">
			<a href="cart.jsp" class="p-3 text-primary"><i
				class="fa-solid fa-cart-plus fa-2x"></i>Cart</a> <a
				class="btn btn-success" href="login.jsp"><i
				class="fa-solid fa-user-plus"></i> <%=us.getName()%></a> <a
				class="btn btn-danger text-white" href="logoutServlet"><i
				class="fa-solid fa-right-from-bracket"></i>Logout</a>
		</div>
		<%
		}
		%>
		<%
		if (us == null) {
		%>
		<div class="col-md-3">
			<a class="btn btn-success" href="login.jsp"><i
				class="fa-solid fa-right-to-bracket"></i> Login</a> <a
				class="btn btn-primary text-white" href="register.jsp"><i
				class="fa-solid fa-user-plus"></i>Register</a>
		</div>
		<%
		}
		%>
	</div>
</div>









<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i
		class="fa-solid fa-house-chimney"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allRecentBook.jsp"><i class="fa-solid fa-book-open"></i>
					RecentBook</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allOldBook.jsp"><i class="fa-solid fa-book-open"></i>
					OldBook</a></li>
			<li class="nav-item active"><a class="nav-link "
				href="allNewBook.jsp"><i class="fa-solid fa-book-open"></i>
					NewBook</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0 text-white">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"> <i
				class="fa-solid fa-gears"></i> Setting
			</a> <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-2"><i
				class="fa-solid fa-address-card"></i> Contact Us</a>

		</form>
	</div>
</nav>