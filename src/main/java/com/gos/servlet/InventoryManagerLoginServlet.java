package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import com.gos.model.InventoryManager;
import com.gos.service.InventoryManagerService;

@WebServlet("/InventoryManagerLoginServlet")
public class InventoryManagerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");

        try {
            List<InventoryManager> inventoryManagerDetails = InventoryManagerService.validate(uname, upass);

            if (!inventoryManagerDetails.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("inventoryManagerDetails", inventoryManagerDetails);
                session.setAttribute("username", uname);
                
                response.sendRedirect(request.getContextPath() +"/inventoryManager/inventoryManagerDashboard.jsp"); 
            } else {
                request.setAttribute("errorMessage", "Invalid username or password.");
                response.sendRedirect(request.getContextPath() +"/inventoryManager/inventoryManagerLogin.jsp"); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }  
}

