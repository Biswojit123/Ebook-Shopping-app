 package com.biswo.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.biswo.Dao.DaoClassImple;
import com.biswo.entity.User;
import com.biswo.helper.DBConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			
			DaoClassImple dio = new DaoClassImple(DBConnection.getConnection());
			
			HttpSession session = req.getSession();
			// Read form data
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			if ("biswojitjena36@gmail.com".equals(email) && "admin".equals(password)) {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("Userobj",us );
				res.sendRedirect("./admin/home.jsp");
			}else {
				User us = dio.login(email, password);
				
				if(us != null) {
					session.setAttribute("Userobj", us);
					res.sendRedirect("index.jsp");
				}else {
					session.setAttribute("Failed-msg", "Invalide email & password");
					res.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

}
