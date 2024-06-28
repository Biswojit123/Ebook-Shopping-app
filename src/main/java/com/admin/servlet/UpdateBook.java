package com.admin.servlet;

import java.io.IOException;

import com.biswo.Dao.DaoBookDetailsImp;
import com.biswo.entity.BookDetails;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editbook")
public class UpdateBook extends HttpServlet {
	
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//Get the from data to update the Book Details
		int id = Integer.parseInt(req.getParameter("id"));
		String bookName = req.getParameter("bookname");
		String author = req.getParameter("authorname");
		double price = Double.parseDouble(req.getParameter("price"));
		String status = req.getParameter("bstatus");
		
		
		//here set the Value to the Object
		BookDetails bd = new BookDetails();
		bd.setBookId(id);
		bd.setBookName(bookName);
		bd.setAuthor(author);
		bd.setPrice(price);
		bd.setStatus(status);
		
		DaoBookDetailsImp dbi = new DaoBookDetailsImp(DBConnection.getConnection());
		
		//Call the Update Method
		Boolean b = dbi.updateBookDetails(bd);
		
		//Create the Session Object
		HttpSession session = req.getSession();
		
		if(b) {
			session.setAttribute("success-Msg", "Book Updated Sucessfully...");
			res.sendRedirect("./admin/allBooks.jsp");
		}else {
			session.setAttribute("failed-Msg", "Something Went Worng In Server...");
			res.sendRedirect("./admin/allBooks.jsp");
		}
		
	}

	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}

}
