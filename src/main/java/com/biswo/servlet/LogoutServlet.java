package com.biswo.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Remove the object that comes from the NavBar.jsp that is 'Userobj'
		HttpSession session = request.getSession();
		session.removeAttribute("Userobj");
		
		
		
		HttpSession session1 = request.getSession();
		
		session1.setAttribute("success", "Logout Successfully....");
		response.sendRedirect("./login.jsp");
		
	}

}
