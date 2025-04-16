package com.gos.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gos.model.Admin;
import com.gos.model.InventoryManager;
import com.gos.util.DBConnection;

public class InventoryManagersService {
	
	// Display Inventory Managers Table
	public ArrayList<InventoryManager> getAllInventoryManager(){
	    try {
	        ArrayList<InventoryManager> listInventoryManager = new ArrayList<>();
	        
	        String sql = "SELECT * FROM InventoryManager";
	        System.out.println("Executing query: " + sql); // Debug
	        
	        Statement stmt = DBConnection.getConnection().createStatement();
	        ResultSet rs = stmt.executeQuery(sql);
	        
	        while(rs.next()) {
	            InventoryManager IM = new InventoryManager();
	            IM.setStock_manager_id(rs.getInt("M_ID"));
	            IM.setUsername(rs.getString("Username"));
	            IM.setFirst_name(rs.getString("First_Name"));
	            IM.setLast_name(rs.getString("Last_Name"));
	            IM.setPhone(rs.getString("Phone"));
	            IM.setEmail(rs.getString("Email"));
	            IM.setPassword(rs.getString("Password"));
	            
	            System.out.println("Found manager: " + IM.getUsername()); // Debug
	            listInventoryManager.add(IM);
	        }
	        
	        System.out.println("Total managers found: " + listInventoryManager.size()); // Debug
	        return listInventoryManager;
	    }
	    catch(Exception e) {
	        System.err.println("Error in getAllInventoryManager: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	}
	
	//Add Inventory Manager
    public static boolean addInventoryManager( String username, String first_name, String last_name , String phone, String email , String password) {
    	
    	boolean isSuccess = false;
    	
    	String sql="INSERT INTO InventoryManager VALUES(0,'"+username+"','"+first_name+"','"+last_name+"','"+phone+"','"+email+"','"+password+"')";

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
    
        
  //Add a Method to Fetch Updated Inventory Manager Details
    public static List<InventoryManager> getInventoryManagerById(String id) {
    	    	
    	List<InventoryManager> IM = new ArrayList<>();
        String sql = "SELECT * FROM InventoryManager WHERE M_ID = ?";//Admin_ID = '"+id+"'

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

        	stmt.setInt(1, Integer.parseInt(id));
        	
         //   stmt.setInt(1, id); // Use placeholder to prevent SQL injection
            ResultSet rs = stmt.executeQuery(); // Get the ResultSet

          //  stmt.setInt(1, Integer.parseInt(id));
            
            while (rs.next()) {
                int mId = rs.getInt(1);
                String username = rs.getString(2);
                String fName = rs.getString(3);
                String lName = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String password = rs.getString(7);

                // Create an Admin object and add it to the list
                InventoryManager inventoryManager = new InventoryManager(mId, username, fName, lName, phone, email, password);
                IM.add(inventoryManager);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return IM;
    } 

}
