package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import com.gos.model.Admin;
import com.gos.service.AdminService;
import com.gos.service.AdminService.DataAccessException;

@WebServlet("/AdminUpdateAdminServlet")
public class AdminUpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
		
        // Display edit form - GET request
        String id = request.getParameter("id");
        ArrayList<Admin> ad = AdminService.getAdminById(id);
        
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

        boolean isSuccess = false;
		try {
			isSuccess = AdminService.updateAdmin(id, username, fName, lName, phone, email, password);
			
		} catch (NumberFormatException e) {
			System.out.println("Invalid Admin ID");
			
		} catch (SQLException e) {
			System.out.println("Database Error");
			
		} catch (DataAccessException e) {
			System.out.println("Database Connection Error");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

        if (isSuccess) {
            ArrayList<Admin> ad = AdminService.getAdminById(id);

            request.getSession().setAttribute("admin", ad);
        }        
        response.sendRedirect(request.getContextPath() + "/manageAdmin");
    }
}