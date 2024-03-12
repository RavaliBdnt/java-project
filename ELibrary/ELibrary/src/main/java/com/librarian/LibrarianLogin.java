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
import com.entities.Librarian;

@WebServlet("/librarianLogin")
public class LibrarianLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		LibrarianDao dao = new LibrarianDao(DbConnection.getConnection());
		Librarian librarian = dao.loginLibrarian(email, password);
		HttpSession session = req.getSession();
		if(librarian!=null) {
			session.setAttribute("LibrarianIn", librarian);
			session.setAttribute("id",librarian.getId());
			session.setAttribute("name", librarian.getName());
			session.setAttribute("email", librarian.getEmail());
			resp.sendRedirect("/ELibrary/librarian/index.jsp");
		}else {
			session.setAttribute("loginFailed", "Invalid Creditial, try again");
			resp.sendRedirect("/ELibrary/librarianLogin.jsp");
		}
	}

	
}
