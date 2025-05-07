package com.gos.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.gos.model.Product;
import com.gos.util.DBConnection;

public class ProductService {
	
	// Display Products
    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> productList = new ArrayList<>();        
        String sql = "SELECT * FROM Product";
        
        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql);
        		ResultSet rs = stmt.executeQuery()) {
            
            while(rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setImagePath(rs.getString("image_path")); 
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
    
    //Add Product
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
    
    // Delete Product
    public void deleteProduct(Product product) {
        String sql = "DELETE FROM Product WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, product.getId());
            stmt.executeUpdate();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Update Product
    public boolean updateProduct(Product product) {
        String sql = "UPDATE Product SET product_name = ?, category = ?, stock = ?, price = ?, image_path = ? WHERE id = ?";
        boolean isSuccess = false;

        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getCategory());
            stmt.setInt(3, product.getStock());
            stmt.setDouble(4, product.getPrice());
            stmt.setString(5, product.getImagePath());
            stmt.setInt(6, product.getId());

            isSuccess = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT * FROM Product WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id")); 
                product.setProductName(rs.getString("product_name"));
                product.setCategory(rs.getString("category"));
                product.setStock(rs.getInt("stock"));
                product.setPrice(rs.getDouble("price"));
                product.setImagePath(rs.getString("image_path"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
}
