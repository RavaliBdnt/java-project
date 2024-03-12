package com.truck;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.TruckDao;
import com.entities.Truck;

@MultipartConfig
@WebServlet("/installTruck")
public class InstallTruck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String name = req.getParameter("name");
		String color = req.getParameter("color");
		String truckNumber = req.getParameter("truckNumber");
		String companyName = req.getParameter("companyName");
		String branchName = req.getParameter("branchName");
		String purchaseDate = req.getParameter("pd");
		String installedBy = req.getParameter("installedBy");

		Part file = req.getPart("image");
		String imageFileName = file.getSubmittedFileName();

		String[] extensionFinder = imageFileName.split("\\.");
		String extension = "." + extensionFinder[1];
		String imageName = truckNumber + extension;
		System.out.println(imageFileName);
		TruckDao dao = new TruckDao();
		
		if(!branchName.equals("none")) {
			Truck truck = new Truck(name, color, truckNumber, companyName,branchName, purchaseDate, installedBy, imageName);
			PrintWriter out = resp.getWriter();

			boolean f = dao.installTruck(truck);
			
			if(f) {
				try {
					String uploadPath = "C:/Users/HRM2/eclipse-workspace7/TransportCompany/src/main/webapp/truckImages/"
							+ imageName;

					FileOutputStream fos = new FileOutputStream(uploadPath);

					InputStream is = file.getInputStream();

					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();

					session.setAttribute("success", "Truck Installed Successfully");
					resp.sendRedirect("/TransportCompany/admin/installTruck.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				}
				

			}else {
				session.setAttribute("failed", "Truck Installation Failed");
				resp.sendRedirect("/TransportCompany/admin/installTruck.jsp");
			}
			

		}else {
			session.setAttribute("branchFailed", "Please Select Branch...");
			resp.sendRedirect("/TransportCompany/admin/installTruck.jsp");
		}
			

		
	}

}
