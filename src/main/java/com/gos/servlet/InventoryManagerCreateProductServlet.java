package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

import com.gos.model.Product;
import com.gos.service.ProductService;

@WebServlet("/addProducts")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1MB
    maxFileSize = 1024 * 1024 * 10,     // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class InventoryManagerCreateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Relative path from webapp root
    private static final String UPLOAD_DIR = "/images/productImages";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Get form data
            String productName = request.getParameter("productName");
            String category = request.getParameter("category");
            int stock = Integer.parseInt(request.getParameter("stock"));
            double price = Double.parseDouble(request.getParameter("price"));

            // Handle image file upload
            Part filePart = request.getPart("imageFile");
            String fileName = null;
            String imagePath = null;

            if (filePart != null && filePart.getSize() > 0) {
                // Generate unique filename
                String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                fileName = UUID.randomUUID().toString() + fileExtension;

                // Get absolute upload path
                String appPath = request.getServletContext().getRealPath("");
                String uploadPath = Paths.get(appPath, UPLOAD_DIR).toString();

                // Create directory if not exists
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Save file
                filePart.write(uploadPath + File.separator + fileName);
                
                // Set relative path for database (without webapp root)
                imagePath = UPLOAD_DIR + "/" + fileName;
            }

            // Create Product object
            Product product = new Product();
            product.setProductName(productName);
            product.setCategory(category);
            product.setStock(stock);
            product.setPrice(price);
            product.setImagePath(imagePath);

            // Add product to DB
            boolean success = ProductService.addProduct(product);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/manageProducts");
            } else {
                request.setAttribute("errorMessage", "Failed to add product.");
                request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
        }
    }
}