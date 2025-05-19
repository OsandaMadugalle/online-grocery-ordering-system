package com.gos.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            
            System.out.println("Fetch Inventory Managers Success");
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}