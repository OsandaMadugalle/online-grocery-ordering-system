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
import com.gos.service.AdminService;
import com.gos.util.DBConnection;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");

        try {
            List<Admin> adminDetails = AdminService.validate(uname, upass);

            if (!adminDetails.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("adminDetails", adminDetails);
                session.setAttribute("username", uname);
                
                response.sendRedirect(request.getContextPath() +"/admin/adminAccount.jsp"); 
            } else {
                request.setAttribute("errorMessage", "Invalid username or password.");
                response.sendRedirect(request.getContextPath() +"/admin/adminLogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

