package com.admin.servlet;

import java.io.IOException;

import com.biswo.Dao.DaoBookDetailsImp;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deletebook")
public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Get the id from the URL pattern
		int id = Integer.parseInt(request.getParameter("id"));
		
		DaoBookDetailsImp bdi = new DaoBookDetailsImp(DBConnection.getConnection());
		
		boolean b = bdi.deleteBook(id);
		
		//Create the Session Object
				HttpSession session = request.getSession();
				
				if(b) {
					session.setAttribute("success-Msg", "Book Delete Sucessfully...");
					response.sendRedirect("./admin/allBooks.jsp");
				}else {
					session.setAttribute("failed-Msg", "Something Went Worng In Server...");
					response.sendRedirect("./admin/allBooks.jsp");
				}
		
	}

}
