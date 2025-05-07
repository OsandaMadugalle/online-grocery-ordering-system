package com.gos.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.gos.service.DeliveryPersonService;

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

        // Call service to add the delivery person to the database
        boolean success = DeliveryPersonService.addDeliveryPerson(username, firstName, lastName, phone, email, password);

        // Redirect or forward based on success
        if (success) {
            response.sendRedirect("manageDeliveryPersons"); // Redirect to the list of delivery persons
        } else {
            request.setAttribute("errorMessage", "Failed to add delivery person.");
            request.getRequestDispatcher("/deliveryManager/createDeliveryPerson.jsp").forward(request, response);
        }
    }
}