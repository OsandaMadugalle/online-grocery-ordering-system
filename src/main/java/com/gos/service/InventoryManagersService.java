package com.gos.service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.gos.model.InventoryManager;
import com.gos.util.DBConnection;

public class InventoryManagersService {
	
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

}
