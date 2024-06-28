
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
<title>All Old Book</title>
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
	<div class="container-fluid mb-5 p-4">
		<div class="row">
			<%
			DaoBookDetailsImp dbi2 = new DaoBookDetailsImp(DBConnection.getConnection());
			List<BookDetails> list2 = dbi2.getAllOldBook();
			for (BookDetails book2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card card-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="./book/<%=book2.getPhoto()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p><%=book2.getBookName()%></p>
						<p><%=book2.getAuthor()%></p>
						<p>
							Categories:
							<%=book2.getCategories()%></p>
					</div>
					<div class="row mb-4 ml-3">
						<a href="view_book.jsp?id=<%=book2.getBookId()%>" class="btn btn-success btn-sm ml-4">View Details</a> <a
							href="" class="btn btn-danger btn-sm ml-2"><%=book2.getPrice()%>
							<i class="fa-solid fa-indian-rupee-sign"></i></a>
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