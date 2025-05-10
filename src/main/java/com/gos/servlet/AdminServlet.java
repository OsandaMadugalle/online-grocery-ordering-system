package com.gos.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

import com.gos.model.Admin;
import com.gos.service.AdminService;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
        	//AdminService service = new AdminService();
            ArrayList<Admin> admin = AdminService.getAllAdmin();
            
            request.setAttribute("admin", admin);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/manageAdmins.jsp");
            dispatcher.forward(request, response);
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}