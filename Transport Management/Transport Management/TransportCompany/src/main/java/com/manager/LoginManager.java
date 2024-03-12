package com.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ManagerDao;
import com.entities.Manager;

@WebServlet("/loginManager")
public class LoginManager extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		ManagerDao dao = new ManagerDao();
		Manager manager = dao.loginManager(email, password);
		HttpSession session = req.getSession();
		if(manager!=null) {
			session.setAttribute("managerIn", manager);
			session.setAttribute("name", manager.getName());
			session.setAttribute("branchName", manager.getBranch());
			
			resp.sendRedirect("/TransportCompany/manager/index.jsp");
		}else {
			session.setAttribute("failed", "Invalid Login Creditial Please Try again");
			resp.sendRedirect("/TransportCompany/ManagerLogin.jsp");
		}
		
	}

	
}
