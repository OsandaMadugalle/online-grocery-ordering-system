package com.gos.servlet;import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import com.gos.model.Admin;
import com.gos.service.AdminService;


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

	    boolean isTrue = AdminService.updateAdmin(id, username, fName, lName, phone, email, password);

	    if (isTrue) {	       
	        ArrayList<Admin> updatedAdminDetails = AdminService.getAdminById(id);
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("adminDetails", updatedAdminDetails);

	        response.sendRedirect(request.getContextPath() + "/admin/adminDashboard.jsp");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/admin/updateAdminProfile.jsp");
	    }
	}

}
