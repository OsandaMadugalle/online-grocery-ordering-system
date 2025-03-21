package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation for handling user logout.
 */
@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles GET requests for logging out the user.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the existing session
        HttpSession session = request.getSession(false); // Use false to avoid creating a new session if one doesn't exist
        if (session != null) {
            // Invalidate the session to log out the user
        	session.setAttribute("logoutMessage", "You have successfully logged out."); // Set logout message
            session.invalidate();
        }
        // Redirect to the login page or home page after logout
        response.sendRedirect("./admin/adminLogin.jsp");
    }
}
