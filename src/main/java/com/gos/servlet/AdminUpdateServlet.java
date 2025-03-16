package com.gos.servlet;

import jakarta.servlet.RequestDispatcher;
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

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("admin_id");
	    String username = request.getParameter("username");
	    String fName = request.getParameter("firstName");
	    String lName = request.getParameter("lastName");
	    String phone = request.getParameter("phone");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    // Update the admin details in the database
	    boolean isTrue = AdminService.updateAdmin(id, username, fName, lName, phone, email, password);

	    if (isTrue) {
	        // Fetch the updated admin details from the database
	        List<Admin> updatedAdminDetails = AdminService.getAdminById(id);

	        // Update the session with the new admin details
	        HttpSession session = request.getSession();
	        session.setAttribute("adminDetails", updatedAdminDetails);

	        // Redirect to the admin account page
	        response.sendRedirect(request.getContextPath() + "/admin/adminAccount.jsp");
	    } else {
	        // Redirect back to the update page if the update fails
	        response.sendRedirect(request.getContextPath() + "/admin/updateAdminProfile.jsp");
	    }
	}

}
