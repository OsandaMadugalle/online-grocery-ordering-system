package Osanda;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles POST requests for user login.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");

        try {
            // Validate user credentials with the database
            List<Admin> adminDetails = AdminDBUtil.validate(uname, upass);

            if (!adminDetails.isEmpty()) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true); // Mark the user as logged in
                session.setAttribute("adminDetails", adminDetails); // Store admin details in the session
                session.setAttribute("username", uname); // Store username for further use (optional)

                // Redirect to AdminAccount.jsp
                response.sendRedirect("index.jsp");
            } else {
                // Login failed: Set error message and redirect back to login page
                request.setAttribute("errorMessage", "Invalid username or password.");
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            }
        } catch (Exception e) {
            // Handle exceptions gracefully and log the error
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred during login. Please try again later.");
        }
    }
}
