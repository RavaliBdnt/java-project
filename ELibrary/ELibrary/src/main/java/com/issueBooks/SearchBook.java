package com.issueBooks;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.BookDao;
import com.entities.Book;

@WebServlet("/searchBook")
public class SearchBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sno = Integer.parseInt(req.getParameter("bookSno"));
		
		BookDao dao = new BookDao(DbConnection.getConnection());
		Book book = dao.getBookBySNO(sno);
		HttpSession session = req.getSession();
		
		if(book!=null) {
			session.setAttribute("regSno",book.getSno());
			session.setAttribute("title", book.getTitle());
			session.setAttribute("author", book.getAuthor());
			session.setAttribute("quantity", book.getPrice());
			if(book.getPrice()>0) {
				resp.sendRedirect("/ELibrary/librarian/issuingBook.jsp");
			}else {

				
				
				
			}
			
		}else {
			
		}
	}

	
}
