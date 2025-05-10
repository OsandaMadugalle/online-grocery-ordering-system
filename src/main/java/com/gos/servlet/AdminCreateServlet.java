package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

import com.gos.service.AdminService;
import com.gos.service.AdminService.DataAccessException;

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
		 
		 boolean isTrue = false;
		 
		 try {
			isTrue= AdminService.addAdmin(username, first_name, last_name, phone, email, password);
			
		} catch (SQLException e) {
			System.out.println("Database Error");
			
		} catch (DataAccessException e) {
			System.out.println("Database Connectiion Error");

		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 if(isTrue==true) {
			 response.sendRedirect("manageAdmin");
		 }else {
			 response.sendRedirect(request.getContextPath() + "/admin/createAdmin.jsp");
		 }
		 
	}

}
