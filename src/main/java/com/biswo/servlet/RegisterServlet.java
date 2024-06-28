package com.biswo.servlet;

import java.io.IOException;

import com.biswo.Dao.DaoClassImple;
import com.biswo.entity.User;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//Read Form data
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phoneNo = req.getParameter("number");
		String password = req.getParameter("password");
		String check = req.getParameter("check");
		
		//Set the All user value to the User class
		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhNumber(phoneNo);
		us.setPassword(password);
		
		
		//Create the Session Object
		HttpSession session = req.getSession();
		
		//Here we check the user read the term and condition or not
		if(check != null) {
			//Create the DaoImplematation class Object
			DaoClassImple dai = new DaoClassImple(DBConnection.getConnection());
			boolean f5 = dai.checkUser(email);
			if(f5) {
				//Register the user
				boolean status = dai.register(us);
				
				if(status == true) {
					session.setAttribute("SuccessMsg", "Registration Successfully...");
					res.sendRedirect("register.jsp");
				}else {
					session.setAttribute("FailedMsg", "Registration Failed...");
					res.sendRedirect("register.jsp");
				}
			}else {
				session.setAttribute("SuccessMsg", "User already exits plz login....");
				res.sendRedirect("register.jsp");
			}
		}else {
			session.setAttribute("CheckMsg", "Plz agree with term and condition...");
			res.sendRedirect("register.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
