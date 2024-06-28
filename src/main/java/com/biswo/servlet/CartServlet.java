package com.biswo.servlet;

import java.io.IOException;

import com.biswo.Dao.DaoBookDetailsImp;
import com.biswo.Dao.DaoCartImp;
import com.biswo.entity.BookDetails;
import com.biswo.entity.Cart;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addcart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		// Get the URL data
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));

		DaoBookDetailsImp bdi = new DaoBookDetailsImp(DBConnection.getConnection());
		BookDetails book = bdi.getDetailsById(bid);
		
		//Set the all value s to the Cart 
		Cart ct = new Cart();
		ct.setBid(bid);
		ct.setUid(uid);
		ct.setBookName(book.getBookName());
		ct.setAuthor(book.getAuthor());
		ct.setPrice(book.getPrice());
		ct.setTotal_price(book.getPrice());
		
		//call the the DaoCartImp 
		DaoCartImp dci = new DaoCartImp(DBConnection.getConnection());
		boolean b = dci.addToCart(ct);
		
		//Write the HTTP session Object
		HttpSession session = req.getSession();
		
		
		if(b == true) {
			session.setAttribute("Addcart", "Book added to cart...");
			res.sendRedirect("allNewBook.jsp");
		}else {
			session.setAttribute("Failed", "Something went wrong in server...");
			res.sendRedirect("allNewBook.jsp");
		}

	}

}
