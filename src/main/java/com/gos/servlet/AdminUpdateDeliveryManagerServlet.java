package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import com.gos.model.DeliveryManager;
import com.gos.service.DeliveryManagerService;

@WebServlet("/adminUpdateDeliveryManagerServlet")
public class AdminUpdateDeliveryManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Display edit form - GET request
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        ArrayList<DeliveryManager> manager = DeliveryManagerService.getDeliveryManagerById(id);
        
        if (manager != null && !manager.isEmpty()) {
            request.setAttribute("manager", manager.get(0));
            request.getRequestDispatcher("/admin/updateDeliveryManager.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/manageDeliveryManagers.jsp");
        }
    }

	 // Process form submission - POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
   
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isSuccess = DeliveryManagerService.updateDeliveryManager(
                id, username, fName, lName, phone, email, password);

        if (isSuccess) {
        
            ArrayList<DeliveryManager> updatedList = DeliveryManagerService.getDeliveryManagerById(id);
            request.getSession().setAttribute("deliveryManagers", updatedList);
        }        
        response.sendRedirect(request.getContextPath() + "/manageDeliveryManager");
        
        System.out.println("Update Delivery Manager Success");
    }
}