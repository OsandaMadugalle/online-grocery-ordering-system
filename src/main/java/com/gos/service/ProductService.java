package com.gos.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.gos.model.Product;
import com.gos.util.DBConnection;

public class ProductService {
	// Display Products Table
    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> productList = new ArrayList<>();        
        String sql = "SELECT * FROM Product"; // Assuming your table is named 'product'
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while(rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setImagePath(rs.getString("image_path")); // or whatever your column name is
                product.setProductName(rs.getString("product_name"));
                product.setCategory(rs.getString("category"));
                product.setStock(rs.getInt("stock"));
                product.setPrice(rs.getDouble("price"));
                
                productList.add(product);
            }
            return productList;
        }
        catch(Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    //add Product
    public static boolean addProduct(Product product) {
        boolean isSuccess = false;
        String sql = "INSERT INTO Product (product_name, category, stock, price, image_path) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getCategory());
            stmt.setInt(3, product.getStock());
            stmt.setDouble(4, product.getPrice());
            stmt.setString(5, product.getImagePath());

            int rowsAffected = stmt.executeUpdate();
            isSuccess = rowsAffected > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

}
