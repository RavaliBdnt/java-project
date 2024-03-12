package com.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.BookDao;
import com.dao.LibrarianDao;

@WebServlet("/updateBook")
public class UpdateBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sno = Integer.parseInt(req.getParameter("sno"));
		String title = req.getParameter("title");
		String author = req.getParameter("author");
		String date = req.getParameter("date");
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		
		BookDao dao = new BookDao(DbConnection.getConnection());
		boolean f = dao.updateBook(sno, title, author, date, quantity);
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("updateSuccess", "Update Book Details SuccessFully");
			resp.sendRedirect("/ELibrary/librarian/viewBooks.jsp");
		}else {
			session.setAttribute("updateFailed", "Update Book Details Failed");
			resp.sendRedirect("/ELibrary/librarian/viewBooks.jsp");
		}
	}

}
