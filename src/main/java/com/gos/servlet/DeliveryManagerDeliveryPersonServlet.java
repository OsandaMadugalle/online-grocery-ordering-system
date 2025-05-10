package com.gos.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import com.gos.model.DeliveryPerson;
import com.gos.service.DeliveryPersonService;

@WebServlet("/DeliveryManagerDeliveryPersonServlet")
public class DeliveryManagerDeliveryPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch all delivery managers
            ArrayList<DeliveryPerson> deliveryPersons = DeliveryPersonService.getAllDeliveryPersons();
            
            // Set the list of delivery managers as an attribute
            request.setAttribute("deliveryPersons", deliveryPersons);
            
            // Forward the request
            RequestDispatcher dispatcher = request.getRequestDispatcher("/deliveryManager/manageDeliveryPerson.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
