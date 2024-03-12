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

@WebServlet("/deleteBook")
public class DeleteBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sno = Integer.parseInt(req.getParameter("sno"));
		
		BookDao dao = new BookDao(DbConnection.getConnection());
		boolean f = dao.deleteBook(sno);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("deleteSuccess", "Book Delete Successfuly");
			resp.sendRedirect("/ELibrary/librarian/viewBooks.jsp");
		}else {
			session.setAttribute("deleteFailed", "oops something wrong try again");
			resp.sendRedirect("/ELibrary/librarian/viewBooks.jsp");
		}
		
	}
}
