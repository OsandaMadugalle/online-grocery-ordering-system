package Osanda;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/")
public class GOSController extends HttpServlet {

	GAODao dao = new GAODao();

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String act = req.getServletPath();

        switch (act) {
            case "/loginCustomer":
                checkLogin(req, res, false); // Customer login
                break;
            case "/loginAdmin":
                checkLogin(req, res, true);  // Admin login
                break;
            case "/dashboard":
                showDashboard(req, res);
                break;
            default:
                showDashboard(req, res);
                break;
        }
    }

    private void checkLogin(HttpServletRequest req, HttpServletResponse res, boolean isAdmin) throws IOException {
        String username = req.getParameter("uname");
        String password = req.getParameter("upass");

        boolean loginSuccess = false;
        
        if (isAdmin) {
            loginSuccess = dao.checkAdminLogin(username, password);  // Check Admin login
        } else {
            loginSuccess = dao.checkCustomerLogin(username, password);  // Check Customer login
        }

        if (loginSuccess) {
            HttpSession session = req.getSession();
            session.setAttribute(isAdmin ? "admin" : "customer", username);  // Set session attribute accordingly

            if (isAdmin) {
                res.sendRedirect("adminDashboard.jsp");  // Redirect admin to admin dashboard
            } else {
                res.sendRedirect("dashboard.jsp");  // Redirect customer to the main dashboard
            }
        } else {
            res.sendRedirect(isAdmin ? "adminLogin.jsp" : "login.jsp");  // Redirect to login page if failed
        }
    }

    private void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate();  // Invalidate the session on logout
        res.sendRedirect("index.jsp");  // Redirect to homepage or login page
    }

    private void showDashboard(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Your code for showing customer dashboard
        RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
        rd.forward(req, res);
    }

    // Add other functions like insertProduct(), updateProduct(), showOrders() etc.
}

