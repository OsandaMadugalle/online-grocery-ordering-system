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
 * Servlet implementation class AdminCreate
 */
@WebServlet("../AdminCreate")
public class AdminCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = request.getParameter("username");
		 String first_name  = request.getParameter("firstName");
		 String last_name  = request.getParameter("lastName");
		 String phone  = request.getParameter("phone");
		 String email  = request.getParameter("username");
		 String password  = request.getParameter("password");
		 
		 boolean isTrue;
		 
		 isTrue= AdminService.addAdmin(username, first_name, last_name, phone, email, password);
		 
		 if(isTrue==true) {
			 RequestDispatcher dis=request.getRequestDispatcher("admin/adminLogin.jsp");
			 dis.forward(request, response);
		 }else {
			 RequestDispatcher dis=request.getRequestDispatcher("admin/createAdmin.jsp");
			 dis.forward(request, response);
		 }
		 
	}

}
