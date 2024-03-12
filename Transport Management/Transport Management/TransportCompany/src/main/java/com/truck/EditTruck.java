package com.truck;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.TruckDao;

@MultipartConfig
@WebServlet("/editTruck1")
public class EditTruck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String color = req.getParameter("color");
		String truckNumber = req.getParameter("truckNumber");
		String companyName = req.getParameter("companyName");
		String purchaseDate = req.getParameter("pd");

		Part file = req.getPart("image");
		String imageFileName = file.getSubmittedFileName();

		String[] extensionFinder = imageFileName.split("\\.");
		String extension = "." + extensionFinder[1];
		String imageName = truckNumber + extension;
		System.out.println(imageName);
		TruckDao dao = new TruckDao();
		dao.updateTruck(id, name, color, truckNumber, companyName, purchaseDate, imageName);
		HttpSession session = req.getSession();
		try {
			String uploadPath = "C:/Users/HRM2/eclipse-workspace7/TransportCompany/src/main/webapp/truckImages/"
					+ imageName;

			FileOutputStream fos = new FileOutputStream(uploadPath);

			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();

			session.setAttribute("success", "Truck Update Successfully");
			resp.sendRedirect("/TransportCompany/admin/viewInstalledTrucks.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
