package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.gos.model.Admin;
import com.gos.model.InventoryManager;
import com.gos.service.AdminService;
import com.gos.service.InventoryManagerService;

@WebServlet("/updateInventoryManager")
public class AdminUpdateAdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Display edit form - GET request
        String id = request.getParameter("id");
        List<Admin> ad = AdminService.getAdminById(id);
        
        if (ad != null && !ad.isEmpty()) {
            request.setAttribute("admin", ad.get(0));
            request.getRequestDispatcher("/admin/updateAdmin.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/ManageAdmins.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Process form submission - POST request
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isSuccess = AdminService.updateAdmin(
                id, username, fName, lName, phone, email, password);

        if (isSuccess) {
            // Refresh the list in session if needed
            List<Admin> ad = AdminService.getAdminById(id);

            request.getSession().setAttribute("admin", ad);
        }
        
        response.sendRedirect(request.getContextPath() + "/manageAdmin");
    }
}