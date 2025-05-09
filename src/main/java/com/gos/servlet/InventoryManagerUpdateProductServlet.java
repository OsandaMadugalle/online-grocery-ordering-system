package com.gos.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.gos.model.Product;
import com.gos.service.ProductService;

import java.io.File;
import java.io.IOException;

@WebServlet("/InventoryManagerUpdateProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 15     // 15MB
)
public class InventoryManagerUpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        //ProductService productService = new ProductService();
        Product product = ProductService.getProductById(productId);

        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("/inventoryManager/updateProduct.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/manageProducts");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();

        int productId = Integer.parseInt(request.getParameter("id"));
        product.setId(productId);
        product.setProductName(request.getParameter("productName"));
        product.setCategory(request.getParameter("category"));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setPrice(Double.parseDouble(request.getParameter("price")));

        // Existing image path (used if no new image uploaded)
        String imagePath = request.getParameter("existingImagePath");

        // Check if new image was uploaded
        Part filePart = request.getPart("imageFile");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();

            // Path to the productImages folder
            String uploadDir = getServletContext().getRealPath("/") + "productImages";
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }

            // Save the uploaded file
            filePart.write(uploadDir + File.separator + fileName);

            // Update the image path for saving in DB
            imagePath = "productImages/" + fileName;  // Store just the relative path
        }

        product.setImagePath(imagePath);

        ProductService productService = new ProductService();
        boolean success = productService.updateProduct(product);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/manageProducts");
        } else {
            request.setAttribute("error", "Failed to update product.");
            request.setAttribute("product", product);
            response.sendRedirect(request.getContextPath() + "/inventoryManager/updateProduct.jsp\"");
        }
    }
}
