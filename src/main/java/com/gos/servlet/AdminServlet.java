package com.gos.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.gos.model.Admin;
import com.gos.service.AdminService;

@WebServlet("/adminList")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all admins
        List<Admin> adminDetails = AdminService.getAdminDetails();

        // Check if no admins are found
        if (adminDetails == null || adminDetails.isEmpty()) {
            System.out.println("No admin details found.");
            adminDetails = new ArrayList<>(); // Avoid null in JSP by passing an empty list
        }

        // Debugging: Log details before passing to JSP
        System.out.println("Number of admins passed to JSP: " + adminDetails.size());
        for (Admin admin : adminDetails) {
            System.out.println("Admin passed to JSP: " + admin);
        }

        // Pass the list of admins to the JSP
        request.setAttribute("adminDetails", adminDetails);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminList.jsp");
        dispatcher.forward(request, response);
    }
}