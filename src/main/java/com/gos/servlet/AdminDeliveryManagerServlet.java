package com.gos.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

import com.gos.model.DeliveryManager;
import com.gos.service.DeliveryManagerService;


@WebServlet("/AdminDeliveryManagerServlet")
public class AdminDeliveryManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			//DeliveryManagerService service = new DeliveryManagerService();
			ArrayList<DeliveryManager> deliveryManager = DeliveryManagerService.getAllDeliveryManagers();
			
			request.setAttribute("deliveryManager", deliveryManager);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/manageDeliveryManagers.jsp");
			dispatcher.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
