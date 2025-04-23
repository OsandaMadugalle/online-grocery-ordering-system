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

@WebServlet("/CustomerUpdateServlet")
public class CustomerUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("customer_id");
        String username = request.getParameter("username");
        String fName = request.getParameter("first_name");  
        String lName = request.getParameter("last_name");   
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean isTrue = CustomerService.updateCustomer(id, username, fName, lName, phone, email, password);

        if (isTrue) {	       
            List<Customer> updatedCustomerDetails = CustomerService.getCustomerById(id);
            
            HttpSession session = request.getSession();
            session.setAttribute("customerDetails", updatedCustomerDetails);

            response.sendRedirect(request.getContextPath() + "/customer/customerAccount.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/updateCustomerProfile.jsp");
        }
    }
    
    

}
