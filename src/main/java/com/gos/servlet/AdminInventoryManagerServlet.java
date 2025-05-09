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

@WebServlet("/AdminInventoryManagerServlet")
public class AdminInventoryManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            //InventoryManagerService service = new InventoryManagerService();
            ArrayList<InventoryManager> inventoryManagers = InventoryManagerService.getAllInventoryManager();
                        
            request.setAttribute("inventoryManagers", inventoryManagers);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/manageInventoryManagers.jsp");
            dispatcher.forward(request, response);
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}