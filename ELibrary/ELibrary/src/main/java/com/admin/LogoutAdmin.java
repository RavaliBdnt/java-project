package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutAdmin")
public class LogoutAdmin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("AdminIn");
		session.setAttribute("logoutSuccess", "Admin Logout Successfully");
		resp.sendRedirect("/ELibrary/adminLogin.jsp");
	}

	
}
