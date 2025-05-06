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

        // Get form data
        String deliveryPersonId = request.getParameter("deliveryPersonId");
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Update delivery person details in the database
        boolean isUpdated = DeliveryPersonService.updateDeliveryPerson(deliveryPersonId, username, firstName, lastName, phone, email, password);

        if (isUpdated) {
            // Retrieve the updated delivery person details to display
            List<DeliveryPerson> updatedDeliveryPersonDetails = DeliveryPersonService.getDeliveryPersonById(deliveryPersonId);

            HttpSession session = request.getSession();
            session.setAttribute("deliveryPersonDetails", updatedDeliveryPersonDetails);

            // Redirect to the updated list or dashboard
            response.sendRedirect("manageDeliveryPersons");
        } else {
            // If update fails, show an error message
            request.setAttribute("errorMessage", "Failed to update delivery person.");
            request.getRequestDispatcher("/deliveryManager/updateDeliveryPerson.jsp").forward(request, response);
        }
    }
}

