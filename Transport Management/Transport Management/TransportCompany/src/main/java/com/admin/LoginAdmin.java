package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.entities.Admin;

@WebServlet("/loginAdmin")
public class LoginAdmin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		AdminDao dao = new AdminDao();
		Admin admin = dao.login(email, password);
		HttpSession session = req.getSession();
		if(admin != null) {
			session.setAttribute("adminIn", admin);
			session.setAttribute("name", admin.getName());		
			resp.sendRedirect("/TransportCompany/admin/index.jsp");
		}else {
			session.setAttribute("failed", "Invalid Login Crediantials");
			resp.sendRedirect("/TransportCompany/adminLogin.jsp");
		}
	}

	
}
