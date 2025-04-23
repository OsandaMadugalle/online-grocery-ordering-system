package com.gos.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.gos.model.DeliveryManager;
import com.gos.util.DBConnection;

public class DeliveryManagerService {

	//Display Delivery Managers Table
	public ArrayList<DeliveryManager> getAllDelivaryManager(){
		ArrayList<DeliveryManager> listDeliveryManager = new ArrayList<>();
		String sql="Select *FROM DeliveryManager";
		
		try(Statement stmt = DBConnection.getConnection().createStatement();
				ResultSet rs= stmt.executeQuery(sql)){
			
			while(rs.next()) {
				DeliveryManager dm = new DeliveryManager();
				dm.setdelivery_manager_id(rs.getInt(1));
				dm.setUsername(rs.getString(2));
				dm.setFirst_name(rs.getString(3));
				dm.setLast_name(rs.getString(4));
				dm.setPhone(rs.getString(5));
				dm.setEmail(rs.getString(6));
				dm.setPassword(rs.getString(7));
				
				listDeliveryManager.add(dm);
			}
			return listDeliveryManager;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//Add Delivary Manager
	public static boolean addDeliveryManager(String username, String fname, String lname, String phone, String email, String password) {
		boolean isSuccess = false;
		String sql = "INSERT INTO DeliveryManager (Username, First_Name, Last_Name, Phone, Email, Password) VALUES (?, ?, ?, ?, ?, ?)";
		
		try(Connection con = DBConnection.getConnection();
				PreparedStatement stmt = con.prepareStatement(sql)){
			
			stmt.setString(1, username);
	        stmt.setString(2, fname);
			stmt.setString(3, lname);
		    stmt.setString(4, phone);
		    stmt.setString(5, email);
		    stmt.setString(6, password);
		    
		    int rs = stmt.executeUpdate();
		    
		    isSuccess = rs > 0;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}
