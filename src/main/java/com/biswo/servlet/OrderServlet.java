package com.biswo.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.IllegalFormatCodePointException;
import java.util.List;
import java.util.Random;

import com.biswo.Dao.BookOrderDaoImp;
import com.biswo.Dao.DaoCartImp;
import com.biswo.entity.Book_Order;
import com.biswo.entity.Cart;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderservlet1")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		//Get the form data
		int userId = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phoneNum = req.getParameter("phone");
		String address = req.getParameter("address");
		String landmark = req.getParameter("landmark");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");
		String paymentType = req.getParameter("payment");
		
		String fullAddress = address+","+landmark+","+city+","+state+","+zip;
		
		//Get the cart book details we want to oder
		DaoCartImp dio = new DaoCartImp(DBConnection.getConnection());
		List<Cart> list = dio.getUserCartById(userId);
		
		BookOrderDaoImp bod = new BookOrderDaoImp(DBConnection.getConnection());
		Book_Order bookOrd = null;
		
		//Create a Array list
		ArrayList<Book_Order> blist = new ArrayList<Book_Order>();
		
		//Create a Random class
		Random random = new Random();
		if(list.isEmpty()) {
			session.setAttribute("failedMsg", "Plz add book to cart...");
			res.sendRedirect("cart.jsp");
		}else {
			for(Cart c:list) {
				bookOrd = new Book_Order();
				bookOrd.setOrderId("BOOK-ORD-00"+random.nextInt(1000));
				bookOrd.setUserName(name);
				bookOrd.setEmail(email);
				bookOrd.setPhoneNo(phoneNum);
				bookOrd.setFulladd(fullAddress);
				bookOrd.setBookName(c.getBookName());
				bookOrd.setAuthor(c.getAuthor());
				bookOrd.setPrice(c.getPrice());
				bookOrd.setPaymentType(paymentType);
				blist.add(bookOrd);
			}
			
			if("noselect".equals(paymentType)) {
				session.setAttribute("failedMsg", "Plz select the payment type..");
				res.sendRedirect("cart.jsp");
			}else {
				boolean b = bod.saveorder(blist);
				
				if(b) {
					res.sendRedirect("order_successful.jsp");
				}else {
					session.setAttribute("failedMsg", "Something went wrong in server...");
					res.sendRedirect("cart.jsp");
				}
				
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
