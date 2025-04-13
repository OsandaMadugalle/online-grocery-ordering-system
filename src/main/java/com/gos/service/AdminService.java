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
    
    //Update Admin Details
    public static boolean updateAdmin(String id, String username, String fname, String lname, String phone, String email, String password) {
        boolean isSuccess = false;
        String sql = "UPDATE admin SET Username=?, First_Name=?, Last_Name=?, Phone=?, Email=?, Password=? WHERE Admin_ID=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, fname);
            stmt.setString(3, lname);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setString(6, password);
            stmt.setInt(7, Integer.parseInt(id)); // Assuming Admin_ID is an integer

            int rs = stmt.executeUpdate();

            if (rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    //Add a Method to Fetch Updated Admin Details
    public static List<Admin> getAdminById(String id) {
    	    	
    	List<Admin> ad = new ArrayList<>();
        String sql = "SELECT * FROM admin WHERE Admin_ID = ?";//Admin_ID = '"+id+"'

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

        	stmt.setInt(1, Integer.parseInt(id));
        	
         //   stmt.setInt(1, id); // Use placeholder to prevent SQL injection
            ResultSet rs = stmt.executeQuery(); // Get the ResultSet

          //  stmt.setInt(1, Integer.parseInt(id));
            
            while (rs.next()) {
                int aId = rs.getInt(1);
                String username = rs.getString(2);
                String fName = rs.getString(3);
                String lName = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String password = rs.getString(7);

                // Create an Admin object and add it to the list
                Admin admin = new Admin(aId, username, fName, lName, phone, email, password);
                ad.add(admin);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ad;
    }  
    
    //get
    public static List<Admin> getAdminDetails() {
        List<Admin> adminList = new ArrayList<>();
        String sql = "SELECT * FROM admin";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                // Fetch data from the current row
                int id = rs.getInt("Admin_ID");
                String username = rs.getString("Username");
                String fName = rs.getString("First_Name");
                String lName = rs.getString("Last_Name");
                String phone = rs.getString("Phone");
                String email = rs.getString("Email");
                String password = rs.getString("Password");

                // Create Admin object and add to the list
                Admin admin = new Admin(id, username, fName, lName, phone, email, password);
                adminList.add(admin);

                // Debugging: Log admin details
                System.out.println("Fetched admin: " + admin);
            }

        } catch (Exception e) {
            e.printStackTrace(); // Print any errors that occur
        }

        // Debugging: Log the total number of admins fetched
        System.out.println("Total admins fetched: " + adminList.size());
        return adminList;
    }
}