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
}
