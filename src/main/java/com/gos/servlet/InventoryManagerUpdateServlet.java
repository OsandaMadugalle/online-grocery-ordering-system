package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.gos.model.InventoryManager;
import com.gos.service.InventoryManagerService;


@WebServlet("/InventoryManagerUpdateServlet")
public class InventoryManagerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("m_id");
	    String username = request.getParameter("username");
	    String fName = request.getParameter("firstName");
	    String lName = request.getParameter("lastName");
	    String phone = request.getParameter("phone");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    boolean isTrue = InventoryManagerService.updateInventoryManager(id, username, fName, lName, phone, email, password);

	    if (isTrue) {	       
	        List<InventoryManager> updatedInventoryManagerDetails = InventoryManagerService.getInventoryManagerById(id);
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("inventoryManagerDetails", updatedInventoryManagerDetails);

	        response.sendRedirect(request.getContextPath() + "/inventoryManager/inventoryManagerDashboard.jsp");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/inventoryManager/updateInventoryManagerProfile.jsp");
	    }
	}

}
