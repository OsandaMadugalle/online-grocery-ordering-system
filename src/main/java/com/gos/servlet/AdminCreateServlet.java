package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.gos.service.AdminService;

@WebServlet("/AdminCreateServlet")
public class AdminCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = request.getParameter("username");
		 String first_name  = request.getParameter("firstName");
		 String last_name  = request.getParameter("lastName");
		 String phone  = request.getParameter("phone");
		 String email  = request.getParameter("email");
		 String password  = request.getParameter("password");
		 
		 boolean isTrue;
		 
		 isTrue= AdminService.addAdmin(username, first_name, last_name, phone, email, password);
		 
		 if(isTrue==true) {
			 response.sendRedirect("manageAdmin");
		 }else {
			 response.sendRedirect(request.getContextPath() + "/admin/createAdmin.jsp");
		 }
		 
	}

}
