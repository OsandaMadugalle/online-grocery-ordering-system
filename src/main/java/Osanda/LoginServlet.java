package Osanda;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");

        try {
            // Validate credentials
            List<Admin> adminDetails = AdminDBUtil.validate(uname, upass);

            if (!adminDetails.isEmpty()) {
                // Login success - forward to AdminAccount page
                request.setAttribute("adminDetails", adminDetails);
                RequestDispatcher dis = request.getRequestDispatcher("AdminAccount.jsp");
                dis.forward(request, response);
            } else {
                // Login failed - send error message back to login page
                request.setAttribute("errorMessage", "Invalid username or password.");
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
