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

@WebServlet("/updateprofile1")
public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//Read form data
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phoneNo = req.getParameter("number");
		String password = req.getParameter("password");
		
		//Set the value to the User 
		User us = new User();
		us.setId(id);
		us.setName(name);
		us.setEmail(email);
		us.setPhNumber(phoneNo);
		
		DaoClassImple dci = new DaoClassImple(DBConnection.getConnection());
		
		//Check the Password is correctly Matching or not 
		boolean b = dci.checkPassword(id, password);
		
		HttpSession session = req.getSession();
		
		if(b) {
			boolean b2 = dci.updateProfila(us);
			
			if(b2) {
				session.setAttribute("SuccessMsg", "User Update Successfully...");
				res.sendRedirect("edit_profile.jsp");
			}else {
				session.setAttribute("FailedMsg", "Something Went Worng in server...");
				res.sendRedirect("edit_profile.jsp");
			}
			
		}else {
			session.setAttribute("FailedMsg", "Password Mismatch....");
			res.sendRedirect("edit_profile.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
