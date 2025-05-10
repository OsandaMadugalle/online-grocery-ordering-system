package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.gos.model.Customer;
import com.gos.service.CustomerService;

@WebServlet("/CustomerDeleteServlet")
public class CustomerDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer cus = new Customer();
        cus.setId(Integer.parseInt(request.getParameter("id")));

        /*
        CustomerService delService = new CustomerService();
        delService.deleteCustomer(cus);
        */
        
        CustomerService.deleteCustomer(cus);
        
        request.getSession().invalidate();

        response.sendRedirect(request.getContextPath() + "/webContent/index.jsp");
    }
}