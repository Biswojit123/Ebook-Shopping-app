package com.biswo.servlet;

import java.io.IOException;

import com.biswo.Dao.DaoCartImp;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removebook")
public class RemoveBookFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get the book id
		int bid = Integer.parseInt(request.getParameter("bid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		DaoCartImp dci = new DaoCartImp(DBConnection.getConnection());
		boolean b = dci.removeBookFromCart(bid,uid,cid);
		
		HttpSession session = request.getSession();
		
		if(b) {
			session.setAttribute("successMsg", "Book Removed Successfully....");
			response.sendRedirect("cart.jsp");
		}else {
			session.setAttribute("failedMsg", "Something Went Worng In Server....");
			response.sendRedirect("cart.jsp");
		}
	}

}
