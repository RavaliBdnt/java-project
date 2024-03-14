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

@WebServlet("/addLibrarian")
public class AddLibrarian extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        LibrarianDao libDao = new LibrarianDao(DbConnection.getConnection());
        boolean f = libDao.addEmployee(name, email, password);
        HttpSession session = req.getSession();
        if(f) {
            session.setAttribute("success", "Librarian Added Successfully");
            resp.sendRedirect("/ELibrary/admin/addLibrarian.jsp");
        } else {
            session.setAttribute("failed", "Oops something went wrong");
            resp.sendRedirect("/ELibrary/admin/addLibrarian.jsp");
        }
    }
}
