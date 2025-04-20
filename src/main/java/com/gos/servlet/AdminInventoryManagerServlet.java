package com.gos.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.gos.model.InventoryManager;
import com.gos.service.InventoryManagerService;

@WebServlet("/manageInventoryManagerServlet")
public class AdminInventoryManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
        	System.out.println("Servlet is being called!");
            InventoryManagerService service = new InventoryManagerService();
            ArrayList<InventoryManager> inventoryManagers = service.getAllInventoryManager();
            
            System.out.println("Number of managers fetched: " + inventoryManagers.size()); // Debug line
            
            request.setAttribute("inventoryManagers", inventoryManagers);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/ManageInventoryManagers.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving inventory managers");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response); // Or implement separate POST handling
    }
}