package com.manager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ManagerDao;
import com.entities.Manager;

@WebServlet("/addManager")
public class AddManager extends HttpServlet {

	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String branchName = req.getParameter("branchName");
		String dob = req.getParameter("dob");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String doj = req.getParameter("doj");
		double salary = Double.parseDouble(req.getParameter("salary"));
		String password = req.getParameter("password");
		PrintWriter out = resp.getWriter();
		
		
		
		
		Manager manager = new Manager(name, branchName, dob, gender, email, doj, salary, password);
		
		
		ManagerDao dao = new ManagerDao();
		HttpSession session = req.getSession();
		
		
		if(manager!=null){
			dao.addManager(manager);
			session.setAttribute("success", "Manager Add Succesfully...");
			resp.sendRedirect("/TransportCompany/admin/addManager.jsp");
		}else {
			session.setAttribute("failed", "oops something went wrong...");
			resp.sendRedirect("/TransportCompany/admin/addManager.jsp");
		}
		
		
		
		

		
	}

	
}
