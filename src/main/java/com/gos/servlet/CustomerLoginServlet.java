package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.gos.model.Customer;
import com.gos.service.CustomerService;

@WebServlet("/CustomerLoginServlet")
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
                                
                response.sendRedirect(request.getContextPath() + "/webContent/index.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid username or password.");
                response.sendRedirect(request.getContextPath() + "/customer/cusLogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}