package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.gos.model.Admin;
import com.gos.service.AdminService;

@WebServlet("/AdminDeleteServlet")
public class AdminDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin ad = new Admin();
        ad.setId(Integer.parseInt(request.getParameter("id")));

        /*
        AdminService delService = new AdminService();
        delService.deleteadmin(ad);
        */
        
        AdminService.deleteadmin(ad);

        response.sendRedirect("manageAdmin");
    }
}