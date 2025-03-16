package com.gos.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.gos.service.AdminService;

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id =request.getParameter("admin_id");
		String username =request.getParameter("username");
		String fName =request.getParameter("firstName");
		String lName =request.getParameter("lastName");
		String phone =request.getParameter("phone");
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		
		boolean isTrue = AdminService.updateAdmin(id, username, fName, lName, phone, email, password);
		 
		 if(isTrue==true) {
			 RequestDispatcher dis=request.getRequestDispatcher("admin/adminAccount.jsp");
			 dis.forward(request, response);
		 }else {
			 RequestDispatcher dis=request.getRequestDispatcher("admin/updateAdminProfile.jsp");
			 dis.forward(request, response);
		 }
	}

}
