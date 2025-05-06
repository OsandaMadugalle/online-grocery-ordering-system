package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.gos.model.DeliveryPerson;
import com.gos.service.DeliveryPersonService;

@WebServlet("/ DeliveryManagerDeleteDeliveryPersonServlet")
public class DeliveryManagerDeleteDeliveryPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Delegate GET to POST
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the delivery person ID from the request
        int deliveryPersonId = Integer.parseInt(request.getParameter("id"));

        // Create a DeliveryPerson object and set the ID
        DeliveryPerson deliveryPerson = new DeliveryPerson();
        deliveryPerson.setDelivery_person_id(deliveryPersonId);

        boolean isDeleted = DeliveryPersonService.deleteDeliveryPerson(deliveryPersonId);

        if (isDeleted) {
            response.sendRedirect(request.getContextPath() + "/manageDeliveryPersons");  // Redirect to list of delivery persons
        } else {
            // Handle the failure case, possibly redirect to a page with an error message
            request.setAttribute("errorMessage", "Failed to delete the delivery person.");
            request.getRequestDispatcher("/deliveryManager/manageDeliveryPersons.jsp").forward(request, response);
        }
    }
}
