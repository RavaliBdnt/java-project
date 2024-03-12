package com.truck;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TruckDao;

@WebServlet("/deleteTruck")
public class deleteTruck extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		TruckDao dao = new TruckDao();
		boolean f = dao.deleteTruckByid(id);
		HttpSession session = req.getSession();
		session.setAttribute("SuccessDeleteTruck", "Delete Truck Successfully ");
		resp.sendRedirect("/TransportCompany/admin/viewInstalledTrucks.jsp");
		
		
	}


	
}
