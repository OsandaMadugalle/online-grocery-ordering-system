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

import com.gos.model.Product;
import com.gos.service.ProductService;

@WebServlet("/addProducts")
@MultipartConfig
public class InventoryManagerCreateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Folder where uploaded images will be stored (inside WebContent)
    private static final String UPLOAD_DIR = "/productImages";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        int stock = Integer.parseInt(request.getParameter("stock"));
        double price = Double.parseDouble(request.getParameter("price"));

        // Handle image file upload
        Part filePart = request.getPart("imageFile");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String imagePath = null;
        if (fileName != null && !fileName.isEmpty()) {
            imagePath = UPLOAD_DIR + "/" + fileName;
            filePart.write(uploadPath + File.separator + fileName);
        }

        // Create Product object
        Product product = new Product();
        product.setProductName(productName);
        product.setCategory(category);
        product.setStock(stock);
        product.setPrice(price);
        product.setImagePath(imagePath); // Stored as "productImages/filename.jpg"

        // Add product to DB
        boolean success = ProductService.addProduct(product);

        // Redirect or forward based on success
        if (success) {
            response.sendRedirect("manageProducts");
        } else {
            request.setAttribute("errorMessage", "Failed to add product.");
            request.getRequestDispatcher("/admin/addProduct.jsp").forward(request, response);
        }
    }
}
