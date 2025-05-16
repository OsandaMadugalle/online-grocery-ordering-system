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
            String imagePath = null;

            if (filePart != null && filePart.getSize() > 0) {
                // Get webapp root path
                String appPath = request.getServletContext().getRealPath("");
                
                // Define upload directory (relative to webapp)
                String uploadDir = Paths.get(appPath, "images", "productImages").toString();
                
                // Create directory if it doesn't exist
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }

                // Generate filename (keep original name or use UUID)
                String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String fileName = originalFileName; // Or use UUID if you prefer: UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
                
                // Save file
                filePart.write(Paths.get(uploadDir, fileName).toString());
                
                // Set relative path for database (matches your desired format)
                imagePath = "images/productImages/" + fileName;
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