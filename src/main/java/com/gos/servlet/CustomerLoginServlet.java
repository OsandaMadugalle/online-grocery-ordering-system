package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import com.gos.model.Customer;
import com.gos.service.CustomerService;

@WebServlet("/customerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");

        try {
            List<Customer> customerDetails = CustomerService.validate(uname, upass);

            if (!customerDetails.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("customerDetails", customerDetails);
                session.setAttribute("username", uname);
                
                // Change this to forward instead of redirect
                //request.getRequestDispatcher("/customer/customerAccount.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/customer/customerAccount.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid username or password.");
                request.getRequestDispatcher("/customer/cusLogin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}