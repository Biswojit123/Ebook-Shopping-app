
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
<title>All Recent Book</title>
<%@include file="./allComponate/allCss.jsp"%>
<style type="text/css">
.card-ho:hover {
	background-color: #ffb74d;
}
</style>
</head>
<body style="background-color: #D4CDCD;">
	<!-- NavBar Include here -->
	<%@include file="./allComponate/navBar.jsp"%>
	<!-- Start the Recent Book -->
	<div class="container-fluid mb-5 p-4">
		<div class="row">
			<%
			DaoBookDetailsImp dbi1 = new DaoBookDetailsImp(DBConnection.getConnection());
			List<BookDetails> list1 = dbi1.getAllRecentBook();
			for (BookDetails book1 : list1) {
			%>
			<div class="col-md-3">
				<div class="card card-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="./book/<%=book1.getPhoto()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p><%=book1.getBookName()%></p>
						<p><%=book1.getAuthor()%></p>
						<p>
							Categories:
							<%
						if (book1.getCategories().equals("old")) {
						%>
							<%=book1.getCategories()%></p>
						<div class="row ml-5">
							<a href="view_book.jsp?id=<%=book1.getBookId()%>" class="btn btn-success btn-sm ml-4">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-2">299 <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<%=book1.getCategories()%></p>
						<div class="row">
							<%
							if (us == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-4 mr-4"><i
								class="fa-solid fa-cart-shopping"></i>AddCart</a>
							<%
							} else {
							%>
							<a href="addcart?bid=<%=book1.getBookId()%>&&uid=<%=us.getId()%>"
								class="btn btn-danger btn-sm ml-4 mr-4"><i
								class="fa-solid fa-cart-shopping"></i>AddCart</a>
							<%
							}
							%>
							<a href="view_book.jsp?id=<%=book1.getBookId()%>" class="btn btn-success btn-sm ml-4">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-2"><%=book1.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
	<div class="mt-5">
		<%@include file="./allComponate/footer.jsp"%>
	</div>
</body>
</html>