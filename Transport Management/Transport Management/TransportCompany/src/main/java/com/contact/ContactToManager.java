package com.contact;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ContactDao;
import com.entities.Contact;

@WebServlet("/contactToManager")
public class ContactToManager extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String topic = req.getParameter("topic");
		String message = req.getParameter("message");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phoneNumber = req.getParameter("phoneNumber");
		
		HttpSession session = req.getSession();
		ContactDao dao = new ContactDao();

		
		
			if(email.equals(null) && phoneNumber.equals(null)) {
				Contact contact = new Contact(topic, message, name);
				
				if(message.length()>499) {
					session.setAttribute("morethan499", "oops character more than 499");
					resp.sendRedirect("/TransportCompany/manager/contactAdmin.jsp");
				}else {
					dao.contactToManager(contact);
					
					session.setAttribute("success", "Send Message Successfully...");
					resp.sendRedirect("/TransportCompany/manager/contactAdmin.jsp");
				}
				

			}else {
				
				if(message.length()>499) {
					session.setAttribute("morethan499", "oops character more than 499");
					resp.sendRedirect("/TransportCompany/contactAdmin.jsp");
				}else {
					Contact contact = new Contact(topic, message, name, email, phoneNumber);
					dao.contactToManager(contact);
					session.setAttribute("success", "Send Message Successfully...");
					resp.sendRedirect("/TransportCompany/contactAdmin.jsp");
				}
				
				
				

			}
		
		

		

	}

	
	
}
