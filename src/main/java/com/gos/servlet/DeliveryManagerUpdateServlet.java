package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.gos.model.DeliveryManager;
import com.gos.service.DeliveryManagerService;

@WebServlet("/DeliveryManagerUpdateServlet")
public class DeliveryManagerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String id = request.getParameter("d_id");
	    String username = request.getParameter("username");
	    String fName = request.getParameter("firstName");
	    String lName = request.getParameter("lastName");
	    String phone = request.getParameter("phone");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    boolean isTrue = DeliveryManagerService.updateDeliveryManager(id, username, fName, lName, phone, email, password);

	    if (isTrue) {
	        List<DeliveryManager> updatedDeliveryManagerDetails = DeliveryManagerService.getDeliveryManagerById(id);

	        HttpSession session = request.getSession();
	        session.setAttribute("deliveryManagerDetails", updatedDeliveryManagerDetails);

	        response.sendRedirect(request.getContextPath() + "/deliveryManager/deliveryManagerDashboard.jsp");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/deliveryManager/updateDeliveryManagerProfile.jsp");
	    }
	}
}
