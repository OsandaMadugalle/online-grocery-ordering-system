package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
