package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import com.gos.model.Admin;
import com.gos.service.AdminService;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");

        try {
            ArrayList<Admin> adminDetails = AdminService.validate(uname, upass);

            if (!adminDetails.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("adminDetails", adminDetails);
                session.setAttribute("username", uname);
                
                System.out.println("Admin Login Success");
                response.sendRedirect(request.getContextPath() +"/admin/adminDashboard.jsp"); 
            } else {
                System.out.println("Admin Login : Invalid username or password.");
                response.sendRedirect(request.getContextPath() +"/admin/adminLogin.jsp");
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
