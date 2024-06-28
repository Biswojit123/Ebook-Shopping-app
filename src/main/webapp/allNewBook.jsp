
<%@page import="com.biswo.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.biswo.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.biswo.helper.DBConnection"%>
<%@page import="com.biswo.Dao.DaoBookDetailsImp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="./allComponate/allCss.jsp"%>
<style type="text/css">
.card-ho:hover {
	background-color: #ffb74d;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body style="background-color: #D4CDCD;">
	
	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>
	

	<%
	String addcart = (String) session.getAttribute("Addcart");
	if (addcart != null) {
	%>
	<div id="toast" class="text-center"><%=addcart%></div>
	<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
	</script>
	<%
	session.removeAttribute("Addcart");
	}
	%>
	<div class="container-fluid mb-5 p-4">
		<div class="row">
			<%
			DaoBookDetailsImp dbi = new DaoBookDetailsImp(DBConnection.getConnection());
			List<BookDetails> list = dbi.getAllNewBook();
			for (BookDetails book : list) {
			%>
			<div class="col-md-3">
				<div class="card card-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="./book/<%=book.getPhoto()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthor()%></p>
						<p>
							Categories:<%=book.getCategories()%></p>
					</div>
					<div class="row p-3">
						<%
						if (us == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-4 mr-4"><i
							class="fa-solid fa-cart-shopping"></i>AddCart</a>
						<%
						} else {
						%>
						<a href="addcart?bid=<%=book.getBookId()%>&&uid=<%=us.getId()%>"
							class="btn btn-danger btn-sm ml-4 mr-4"><i
							class="fa-solid fa-cart-shopping"></i>AddCart</a>
						<%
						}
						%>
						<a href="" class="btn btn-success btn-sm ml-4">View Details</a> <a
							href="" class="btn btn-danger btn-sm ml-2"><%=book.getPrice()%>
							<i class="fa-solid fa-indian-rupee-sign"></i></a>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
	</div>
</body>
</html>