package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.gos.service.CustomerService;

@WebServlet("/CustomerCreateServlet")
public class CustomerCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String first_name = request.getParameter("firstName");
        String last_name = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isTrue;

        isTrue = CustomerService.addCustomer(username, first_name, last_name, phone, email, password);

        if (isTrue) {
            response.sendRedirect(request.getContextPath() + "/customer/cusLogin.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/cusSignup.jsp");
        }
    }
}