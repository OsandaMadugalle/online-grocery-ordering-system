package com.gos.service;

import com.gos.model.Admin;
import com.gos.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    // Validate Admin Credentials
    public static List<Admin> validate(String username, String password) {
        List<Admin> adminList = new ArrayList<>();
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection(); // Use DBConnection to get the connection
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set parameters for the query
            stmt.setString(1, username);
            stmt.setString(2, password);

            System.out.println("Executing query: " + stmt.toString()); // Debug log

            // Execute the query
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Admin admin = mapResultSetToAdmin(rs);
                    adminList.add(admin);
                }
            }
        } catch (Exception e) {
            logException(e);
        }

        System.out.println("Admin list size: " + adminList.size()); // Debug log
        return adminList;       
       
    }  
    
    // Utility method to map a ResultSet row to an Admin object
    private static Admin mapResultSetToAdmin(ResultSet rs) throws SQLException {
        return new Admin(
                rs.getInt("Admin_ID"), // Ensure this matches the column name in the database
                rs.getString("Username"),
                rs.getString("First_name"),
                rs.getString("Last_name"),
                rs.getString("Phone"),
                rs.getString("Email"),
                rs.getString("Password")
        );
    }

    // Utility method to log exceptions
    private static void logException(Exception e) {
        System.err.println("Error: " + e.getMessage());
        e.printStackTrace();
    } 
    
  //add admin
    public static boolean addAdmin( String username, String first_name, String last_name , String phone, String email , String password) {
    	
    	boolean isSuccess = false;
    	
    	String sql="INSERT INTO admin VALUES(0,'"+username+"','"+first_name+"','"+last_name+"','"+phone+"','"+email+"','"+password+"')";

        try (Connection conn = DBConnection.getConnection(); // Use DBConnection to get the connection
             PreparedStatement stmt = conn.prepareStatement(sql)) {
        	
        	int rs=stmt.executeUpdate(sql);
        	
        	if(rs>0) {
        		isSuccess=true;
        	}else {
        		isSuccess=false;
        	}
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
    	
    	return isSuccess;
    	
    }
    
}