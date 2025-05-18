package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.gos.model.Product;
import com.gos.service.ProductService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet("/InventoryManagerUpdateProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 15     // 15MB
)
public class InventoryManagerUpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String PRODUCT_IMAGES_DIR = "/images/productImages";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = ProductService.getProductById(productId);

            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/inventoryManager/updateProduct.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/manageProducts");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/manageProducts");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("id"));
            Product existingProduct = ProductService.getProductById(productId);
            
            if (existingProduct == null) {
                response.sendRedirect(request.getContextPath() + "/manageProducts");
                return;
            }

            Product product = new Product();
            product.setId(productId);
            product.setProductName(request.getParameter("productName"));
            product.setCategory(request.getParameter("category"));
            product.setStock(Integer.parseInt(request.getParameter("stock")));
            product.setPrice(Double.parseDouble(request.getParameter("price")));

            // Use existing image path as default
            String imagePath = existingProduct.getImagePath();

         // Handle file upload
            Part filePart = request.getPart("imageFile");
            if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null 
                    && !filePart.getSubmittedFileName().isEmpty()) {
                
                // Get webapp root path
                String appPath = request.getServletContext().getRealPath("");
                
                // Path to images/productImages
                String uploadDir = Paths.get(appPath, "images", "productImages").toString();
                
                // Create directory if it doesn't exist
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // Generate unique filename
                String fileName = System.currentTimeMillis() + "_" + 
                        filePart.getSubmittedFileName().replace(" ", "_");
                
                // Delete old image if it exists
                if (imagePath != null && !imagePath.isEmpty()) {
                    Path oldImagePath = Paths.get(appPath, imagePath);
                    if (Files.exists(oldImagePath)) {
                        Files.delete(oldImagePath);
                    }
                }

                // Save new image
                filePart.write(Paths.get(uploadDir, fileName).toString());
                
                // Update image path (relative to webapp)
                imagePath = "images/productImages/" + fileName;  // Modified path
            }

            product.setImagePath(imagePath);

            boolean success = ProductService.updateProduct(product);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/manageProducts");
            } else {
                request.setAttribute("error", "Failed to update product.");
                request.setAttribute("product", product);
                request.getRequestDispatcher("/inventoryManager/updateProduct.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/manageProducts");
        }
    }
}