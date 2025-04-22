package com.gos.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gos.model.Admin;
import com.gos.model.InventoryManager;
import com.gos.util.DBConnection;

public class InventoryManagerService {
	
	//Validate Inventory Manager Login
	public static List<InventoryManager> validate(String username, String password){
		List<InventoryManager> inventoryManagerList = new ArrayList<>();
		String sql = "SELECT * FROM InventoryManager WHERE Username = ? AND Password = ?";
		
		try(Connection con = DBConnection.getConnection(); 
             PreparedStatement stmt = con.prepareStatement(sql)){
			
			stmt.setString(1, username);
			stmt.setString(2, password);
			
			try(ResultSet rs = stmt.executeQuery()){
				while(rs.next()) {
					InventoryManager inventoryManager =mapResultSetToInventoryManager(rs);
					inventoryManagerList.add(inventoryManager);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return inventoryManagerList;
	}
	
	//Map the ResultSet row to an Inventory Manager object
    private static InventoryManager mapResultSetToInventoryManager(ResultSet rs) throws SQLException {
        return new InventoryManager(
                rs.getInt("M_ID"),
                rs.getString("Username"),
                rs.getString("First_name"),
                rs.getString("Last_name"),
                rs.getString("Phone"),
                rs.getString("Email"),
                rs.getString("Password")
        );
    }
    
   
	
	// Display Inventory Managers Table
	public ArrayList<InventoryManager> getAllInventoryManager(){		
		ArrayList<InventoryManager> listInventoryManager = new ArrayList<>();        
        String sql = "SELECT * FROM InventoryManager";
        
	    try(Statement stmt = DBConnection.getConnection().createStatement();
		    ResultSet rs = stmt.executeQuery(sql)) {     
	        
	        while(rs.next()) {
	            InventoryManager IM = new InventoryManager();
	            IM.setInventory_manager_id(rs.getInt("M_ID"));
	            IM.setUsername(rs.getString("Username"));
	            IM.setFirst_name(rs.getString("First_Name"));
	            IM.setLast_name(rs.getString("Last_Name"));
	            IM.setPhone(rs.getString("Phone"));
	            IM.setEmail(rs.getString("Email"));
	            IM.setPassword(rs.getString("Password"));
	            
	            listInventoryManager.add(IM);
	        }
	        return listInventoryManager;
	    }
	    catch(Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	// Add Inventory Manager
	public static boolean addInventoryManager(String username, String first_name, String last_name, String phone, String email, String password) {
	    boolean isSuccess = false;
	    String sql = "INSERT INTO InventoryManager (username, first_name, last_name, phone, email, password) VALUES (?, ?, ?, ?, ?, ?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, username);
	        stmt.setString(2, first_name);
	        stmt.setString(3, last_name);
	        stmt.setString(4, phone);
	        stmt.setString(5, email);
	        stmt.setString(6, password);

	        int rs = stmt.executeUpdate();

	        isSuccess = rs > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}    
    
 // Update Inventory Manager Details
    public static boolean updateInventoryManager(String id, String username, String fname, String lname, String phone, String email, String password) {
        boolean isSuccess = false;
        String sql = "UPDATE InventoryManager SET Username=?, First_Name=?, Last_Name=?, Phone=?, Email=?, Password=? WHERE M_ID=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, fname);
            stmt.setString(3, lname);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setString(6, password);
            stmt.setInt(7, Integer.parseInt(id));

            int rs = stmt.executeUpdate();

            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
    // Fetch Inventory Manager Details By ID
    public static List<InventoryManager> getInventoryManagerById(String id) {    	    	
    	List<InventoryManager> IM = new ArrayList<>();
        String sql = "SELECT * FROM InventoryManager WHERE M_ID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

        	stmt.setInt(1, Integer.parseInt(id));
        	
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                int mId = rs.getInt(1);
                String username = rs.getString(2);
                String fName = rs.getString(3);
                String lName = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String password = rs.getString(7);

                InventoryManager inventoryManager = new InventoryManager(mId, username, fName, lName, phone, email, password);
                IM.add(inventoryManager);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return IM;
    }
    
    // Delete Inventory Manager
    public void deleteInventoryManager(InventoryManager im) {
        String sql = "DELETE FROM InventoryManager WHERE M_ID = ?";
         
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)){
        	
            stmt.setInt(1, im.getInventory_manager_id());
            stmt.executeUpdate();
        } 
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}