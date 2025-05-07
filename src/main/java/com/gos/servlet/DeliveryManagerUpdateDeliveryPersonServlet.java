package com.gos.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.gos.model.DeliveryPerson;
import com.gos.service.DeliveryPersonService;

@WebServlet("/DeliveryManagerUpdateDeliveryPersonServlet")
public class DeliveryManagerUpdateDeliveryPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get all parameters
            String id = request.getParameter("id");
            String username = request.getParameter("username");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Validate required fields
            if (id == null || username == null || password == null) {
                response.sendRedirect(request.getContextPath() + "/manageDeliveryPersons?error=missingfields");
                return;
            }

            // Update in database
            boolean isUpdated = DeliveryPersonService.updateDeliveryPerson(
                id, username, firstName, lastName, phone, email, password);

            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/manageDeliveryPersons?success=updated");
            } else {
                response.sendRedirect(request.getContextPath() + "/manageDeliveryPersons?error=updatefailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/manageDeliveryPersons?error=server");
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id"); // Changed from deliveryPersonId to id
        List<DeliveryPerson> deliveryPersonDetails = DeliveryPersonService.getDeliveryPersonById(id);
        
        if (deliveryPersonDetails != null && !deliveryPersonDetails.isEmpty()) {
            request.setAttribute("deliveryPersonDetails", deliveryPersonDetails);
            request.getRequestDispatcher("/deliveryManager/updateDeliveryPerson.jsp").forward(request, response);
        } else {
            // Handle case where delivery person not found
            response.sendRedirect(request.getContextPath() + "/manageDeliveryPersons?error=notfound");
        }
    }
}

