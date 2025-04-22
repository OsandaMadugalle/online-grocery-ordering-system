package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.gos.model.Product;
import com.gos.service.ProductService;

import java.io.IOException;

@WebServlet("/InventoryManagerUpdateProductServlet")
public class InventoryManagerUpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle GET request to fetch product by ID and forward to JSP
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductService productService = new ProductService();
        Product product = productService.getProductById(productId);

        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("/inventoryManager/updateProduct.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/manageProducts");
        }
    }

    // Handle POST request to update the product
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();

        product.setId(Integer.parseInt(request.getParameter("id")));
        product.setProductName(request.getParameter("productName"));
        product.setCategory(request.getParameter("category"));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setImagePath(request.getParameter("imagePath"));

        ProductService productService = new ProductService();
        boolean success = productService.updateProduct(product);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/manageProducts");
        } else {
            request.setAttribute("error", "Failed to update product.");
            request.setAttribute("product", product);
            request.getRequestDispatcher("/inventoryManager/updateProduct.jsp").forward(request, response);
        }
    }
}
