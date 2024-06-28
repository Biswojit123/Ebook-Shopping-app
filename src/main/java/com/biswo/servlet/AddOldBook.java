package com.biswo.servlet;

import java.io.File;
import java.io.IOException;

import com.biswo.Dao.DaoBookDetailsImp;
import com.biswo.entity.BookDetails;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addoldbook")
@MultipartConfig
public class AddOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//Read form data 
		String bookName = req.getParameter("bookname");
		String author = req.getParameter("authorname");
		double price = Double.parseDouble(req.getParameter("price"));
		String categories = "old";
		String status = "active";
		Part part = req.getPart("bimage");
		String fileName = part.getSubmittedFileName();
		String email = req.getParameter("useremail");
		
		//Set the all value to BookDeatils Object
		BookDetails bd = new BookDetails(bookName,author,price,categories,status,fileName,email);
		
		//Create the implement class object
		DaoBookDetailsImp dbd = new DaoBookDetailsImp(DBConnection.getConnection());
		
		HttpSession session = req.getSession();
		
		boolean value = dbd.addBook(bd);
		 
		if(value == true ) {
			
			//Get the path
			String path = getServletContext().getRealPath("")+"book";
			
			File file = new File(path);
			part.write(path+File.separator+fileName);
			session.setAttribute("success-Msg", "Book Sell Successfully...");
			res.sendRedirect("sell_book.jsp");
		}else {
			session.setAttribute("failed-Msg", "Something went worng in server....");
			res.sendRedirect("sell_book.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		doGet(req, res);
	}
}
