package com.issueBooks;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.BookDao;
import com.dao.IssueBookDao;
import com.entities.IssueBook;

@WebServlet("/issuebook")
public class IssueBooks extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int regSno = Integer.parseInt(req.getParameter("regSno"));
		String title = req.getParameter("title");
		String author = req.getParameter("author");
		String dateOfIssue = req.getParameter("date");
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String librarian = req.getParameter("librarian");
		
		IssueBookDao dao = new IssueBookDao(DbConnection.getConnection());
		boolean f = dao.issueBook(regSno, title, author, dateOfIssue, name, address, librarian);
		BookDao bkdao = new BookDao(DbConnection.getConnection());
		boolean g =bkdao.balanceBook(regSno);
		HttpSession session = req.getSession();
		if(f && g) {

			session.setAttribute("success", "Book Issue Successfuly");
			resp.sendRedirect("/ELibrary/librarian/issueBook.jsp");
		}else {
			session.setAttribute("failed", "Failed Try Again");
			resp.sendRedirect("/ELibrary/librarian/issueBook.jsp");
		}
	}

	
}
