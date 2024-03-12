package com.librarian;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.LibrarianDao;

@WebServlet("/updateLibrarian")
public class UpdateLibrarian  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		LibrarianDao dao = new LibrarianDao(DbConnection.getConnection());
		boolean f = dao.updateEmployee(id, name, email, password);
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("updateSuccess", "Update Librarian Details SuccessFully");
			resp.sendRedirect("/ELibrary/admin/viewLibrarian.jsp");
		}else {
			session.setAttribute("updateFailed", "Update Librarian Details Failed");
			resp.sendRedirect("/ELibrary/admin/viewLibrarian.jsp");
		}
	}

	
}
