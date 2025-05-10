package com.gos.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.gos.model.Product;
import com.gos.service.ProductService;

@WebServlet("/InventoryManagerProductServlet")
public class InventoryManagerProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Product> products = productService.getAllProducts();
            
            request.setAttribute("products", products);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/inventoryManager/manageProducts.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading products");
        }
    }
}