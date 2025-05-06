package com.gos.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.gos.model.DeliveryManager;
import com.gos.service.DeliveryManagerService;


@WebServlet("/AdminDeliveryManagerServlet")
public class AdminDeliveryManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			DeliveryManagerService service = new DeliveryManagerService();
			ArrayList<DeliveryManager> deliveryManager = service.getAllDelivaryManager();
			
			request.setAttribute("deliveryManager", deliveryManager);
			RequestDispatcher dis = request.getRequestDispatcher("admin/manageDeliveryManagers.jsp");
			dis.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
