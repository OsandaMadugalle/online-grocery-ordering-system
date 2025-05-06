package com.gos.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import com.gos.model.DeliveryManager;
import com.gos.service.DeliveryManagerService;

@WebServlet("/DeliveryManagerDeliveryPersonServlet")
public class DeliveryManagerDeliveryPersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch all delivery managers
            List<DeliveryManager> deliveryManagers = deliveryManagerService.getAllDeliveryManagers();
            
            // Set the list of delivery managers as an attribute
            request.setAttribute("deliveryManagers", deliveryManagers);
            
            // Forward the request to manageDeliveryManagers.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/deliveryManager/manageDeliveryPerson.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
