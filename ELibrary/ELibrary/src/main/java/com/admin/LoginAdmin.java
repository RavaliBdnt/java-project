package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.AdminDao;
import com.entities.Admin;


public class LoginAdmin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		System.out.println("Admin Login Main aya that");
		
		AdminDao adminDao = new AdminDao(DbConnection.getConnection());
		Admin admin = adminDao.login(email, password);
		
		HttpSession session = req.getSession();
		
		if(admin!=null) {
			session.setAttribute("adminIn", admin);
			session.setAttribute("id", admin.getId());
			session.setAttribute("name", admin.getName());
			session.setAttribute("emailID", admin.getEmailId());
			session.setAttribute("password", admin.getPassword());
			session.setAttribute("Success", "Success");
			resp.sendRedirect("/ELibrary/admin/index.jsp");
		}else {
			session.setAttribute("failed", "Invalid Admin Creditial..");
			resp.sendRedirect("/ELibrary/adminLogin.jsp");
		}
	}

	
}
