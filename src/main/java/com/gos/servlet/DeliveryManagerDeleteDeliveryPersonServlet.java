package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
        int deliveryPersonId = Integer.parseInt(request.getParameter("id"));

        DeliveryPerson deliveryPerson = new DeliveryPerson();
        deliveryPerson.setId(deliveryPersonId);

        boolean isDeleted = DeliveryPersonService.deleteDeliveryPerson(deliveryPersonId);

        if (isDeleted) {
            response.sendRedirect(request.getContextPath() + "/manageDeliveryPersons");  
        } else {
            request.getRequestDispatcher("/deliveryManager/manageDeliveryPersons.jsp").forward(request, response);
        }
    }
}
