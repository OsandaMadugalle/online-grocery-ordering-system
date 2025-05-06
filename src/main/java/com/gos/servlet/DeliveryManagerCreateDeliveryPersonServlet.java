package com.gos.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.gos.model.DeliveryManager;
import com.gos.service.DeliveryManagerService;

@WebServlet("/DeliveryManagerCreateDeliveryPersonServlet")
@MultipartConfig
public class DeliveryManagerCreateDeliveryPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create DeliveryManager object and set values
        DeliveryManager deliveryManager = new DeliveryManager();
        deliveryManager.setUsername(username);
        deliveryManager.setFirst_name(firstName);
        deliveryManager.setLast_name(lastName);
        deliveryManager.setPhone(phone);
        deliveryManager.setEmail(email);
        deliveryManager.setPassword(password);

        // Call service to add the delivery manager to the database
        boolean success = DeliveryManagerService.addDeliveryManager(username, firstName, lastName, phone, email, password);

        // Redirect or forward based on success
        if (success) {
            response.sendRedirect("manageDeliveryManagers"); // Redirect to the list of delivery managers
        } else {
            request.setAttribute("errorMessage", "Failed to add delivery manager.");
            request.getRequestDispatcher("/inventoryManager/addDeliveryManager.jsp").forward(request, response);
        }
    }
}
