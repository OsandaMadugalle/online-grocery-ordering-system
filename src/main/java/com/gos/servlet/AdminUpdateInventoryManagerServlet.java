package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import com.gos.model.InventoryManager;
import com.gos.service.InventoryManagerService;

@WebServlet("/adminUpdateInventoryManagerServlet")
public class AdminUpdateInventoryManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Display edit form - GET request
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        ArrayList<InventoryManager> manager = InventoryManagerService.getInventoryManagerById(id);
        
        if (manager != null && !manager.isEmpty()) {
            request.setAttribute("manager", manager.get(0));
            request.getRequestDispatcher("/admin/updateInventoryManager.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/inventoryManagersList.jsp");
        }
    }

	 // Process form submission - POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
   
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isSuccess = InventoryManagerService.updateInventoryManager(
                id, username, fName, lName, phone, email, password);

        if (isSuccess) {
        
            ArrayList<InventoryManager> updatedList = InventoryManagerService.getInventoryManagerById(id);
            request.getSession().setAttribute("inventoryManagers", updatedList);
        }        
        response.sendRedirect(request.getContextPath() + "/manageInventoryManager");
        
        System.out.println("Update Inventory Manager Success");
    }
}