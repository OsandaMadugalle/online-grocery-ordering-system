package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;

import com.gos.model.Product;
import com.gos.service.ProductService;

@WebServlet("/AdminDeleteProductServlet")
public class InventoryManagerDeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Delegate GET to POST
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        product.setId(Integer.parseInt(request.getParameter("id")));

        //ProductService productService = new ProductService();
        ProductService.deleteProduct(product);

        response.sendRedirect(request.getContextPath() + "/manageProducts");
    }
}
