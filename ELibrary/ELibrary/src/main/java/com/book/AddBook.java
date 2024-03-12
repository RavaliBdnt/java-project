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

@WebServlet("/addbook")
public class AddBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String author = req.getParameter("author");
		String date = req.getParameter("date");
		int price = Integer.parseInt(req.getParameter("quantity"));
		
		BookDao dao = new BookDao(DbConnection.getConnection());
		boolean f =dao.addBook(title, author, date, price); 
		HttpSession session = req.getSession();
		if(f) {
			session.setAttribute("success", "Book Added Successfully");
			resp.sendRedirect("/ELibrary/librarian/addNewBook.jsp");
		}else {
			session.setAttribute("failed", "oops something went wrong try again");
			resp.sendRedirect("/ELibrary/librarian/addNewBook.jsp");
		}
		
		
	}

	
}
