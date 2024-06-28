package com.biswo.servlet;

import java.io.IOException;

import com.biswo.Dao.DaoBookDetailsImp;
import com.biswo.helper.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deletebook5")
public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		// Get the URl data
		String email = req.getParameter("email");
		String cate = req.getParameter("cate");
		int id = Integer.parseInt(req.getParameter("id"));

		DaoBookDetailsImp dbi = new DaoBookDetailsImp(DBConnection.getConnection());

		boolean b = dbi.deleteOldBook(email, cate, id);

		HttpSession session = req.getSession();

		if (b) {
			session.setAttribute("successMsg", "Old Book Removed Successfully....");
			res.sendRedirect("old_book.jsp");
		} else {
			session.setAttribute("failedMsg", "Something Went Worng In Server....");
			res.sendRedirect("old_book.jsp");
		}
	}

}
