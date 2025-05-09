package com.gos.service;

import com.gos.model.Admin;
import com.gos.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;

public class AdminService {
	
	// Admin Details Mapping to DB 
	private static Admin mapResultSetToAdmin(ResultSet rs) throws SQLException {
        return new Admin(
                rs.getInt("Admin_ID"),
                rs.getString("Username"),
                rs.getString("First_name"),
                rs.getString("Last_name"),
                rs.getString("Phone"),
                rs.getString("Email"),
                rs.getString("Password")
        );
    }

	// Validate Admin Login
    public static ArrayList<Admin> validate(String username, String password) throws SQLException, DataAccessException {
    	
        ArrayList<Admin> adminList = new ArrayList<>();
        String sql = "SELECT * FROM Admin WHERE Username = ? AND Password = ?";

        try (Connection con = DBConnection.getConnection(); 
        		PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password); 

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Admin admin = mapResultSetToAdmin(rs);
                    adminList.add(admin);
                }
            }
            
        }catch (SQLException e) {
            throw new DataAccessException("Error validating admin credentials", e);
            
        }catch (Exception e) {
        	e.printStackTrace();
        }
        
        return adminList;  
    }     
    
    // Add Admin
    public static boolean addAdmin(String username, String first_name, String last_name, String phone, String email, String password) throws SQLException, DataAccessException {
        
        boolean isSuccess = false;
        String sql = "INSERT INTO Admin VALUES(0,?,?,?,?,?,?)";

        try (Connection conn = DBConnection.getConnection(); 
        		PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            stmt.setString(2, first_name);
            stmt.setString(3, last_name);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setString(6, password);
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating admin failed, no rows affected.");
            }
            
            isSuccess = true;
            
        }catch (SQLException e) {
            throw new DataAccessException("Error adding new admin", e);
            
        }catch (Exception e) {
        	e.printStackTrace();
        }
        return isSuccess;
    }
    
    // Update Admin
    public static boolean updateAdmin(String id, String username, String fname, String lname, String phone, String email, String password) throws SQLException, DataAccessException, NumberFormatException {
        
        boolean isSuccess = false;
        String sql = "UPDATE Admin SET Username=?, First_Name=?, Last_Name=?, Phone=?, Email=?, Password=? WHERE Admin_ID=?";

        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, fname);
            stmt.setString(3, lname);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setString(6, password);
            stmt.setInt(7, Integer.parseInt(id)); 

            int affectedRows = stmt.executeUpdate();
            isSuccess = affectedRows > 0;
            
        }catch (SQLException e) {
            throw new DataAccessException("Error updating admin with ID: " + id, e);
            
        }catch (NumberFormatException e) {
            throw new NumberFormatException("Invalid admin ID format: " + id);
            
        }catch (Exception e) {
        	e.printStackTrace();
        }
        
        return isSuccess;
    }

    //Get Admin
    public static ArrayList<Admin> getAdminById(String id) {
    	    	
    	ArrayList<Admin> ad = new ArrayList<>();
        String sql = "SELECT * FROM Admin WHERE Admin_ID = ?";

        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql)) {

        	stmt.setInt(1, Integer.parseInt(id));
        	
            ResultSet rs = stmt.executeQuery(); 
            
            while (rs.next()) {
                int aId = rs.getInt(1);
                String username = rs.getString(2);
                String fName = rs.getString(3);
                String lName = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String password = rs.getString(7);

                Admin admin = new Admin(aId, username, fName, lName, phone, email, password);
                ad.add(admin);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ad;
    } 

	// Display Admins
	public static ArrayList<Admin> getAllAdmin(){
		
		ArrayList<Admin> listAdmin = new ArrayList<>();        
        String sql = "SELECT * FROM Admin";
        
	    try (Connection conn = DBConnection.getConnection();
	    		PreparedStatement stmt = conn.prepareStatement(sql)){
	        	        
	        ResultSet rs = stmt.executeQuery(sql);
	        
	        while(rs.next()) {
	            Admin ad = new Admin();
	            ad.setId(rs.getInt("Admin_ID"));
	            ad.setUsername(rs.getString("Username"));
	            ad.setFirstName(rs.getString("First_Name"));
	            ad.setLastName(rs.getString("Last_Name"));
	            ad.setPhone(rs.getString("Phone"));
	            ad.setEmail(rs.getString("Email"));
	            ad.setPassword(rs.getString("Password"));
	            
	            listAdmin.add(ad);
	        }
	        return listAdmin;
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	// Delete Admin
    public static void deleteadmin(Admin ad) {
        String sql = "DELETE FROM Admin WHERE Admin_ID = ?";
         
        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql)){
        	
            stmt.setInt(1, ad.getId());
            stmt.executeUpdate();
        } 
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    // Custom Exception Handling
    public static class DataAccessException extends Exception {
        public DataAccessException(String message, Throwable cause) {
            super(message, cause);
        }
    }
}