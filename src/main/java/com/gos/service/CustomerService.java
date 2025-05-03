package com.gos.service;

import com.gos.model.Customer;
import com.gos.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
	
	// Create Customer
	public static boolean addCustomer(String username, String first_name, String last_name, String phone, String email, String password) {

	    boolean isSuccess = false;

	    String sql = "INSERT INTO Customer VALUES(0, ?, ?, ?, ?, ?, ?)";

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
	
	// Validate Customer Login
	public static List<Customer> validate(String username, String password) {
	    ArrayList<Customer> customerList = new ArrayList<>();
	    String sql = "SELECT * FROM Customer WHERE username = ? AND password = ?";

	    try (Connection conn = DBConnection.getConnection(); 
	    		PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, username);
	        stmt.setString(2, password); 

	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                Customer customer = mapResultSetToCustomer(rs);
	                customerList.add(customer);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return customerList;
	}

	// Map the ResultSet row to a Customer
	private static Customer mapResultSetToCustomer(ResultSet rs) throws SQLException {
	    return new Customer(
	    		rs.getInt("customer_id"),
	    		rs.getString("username"),
	    		rs.getString("first_name"),
	    		rs.getString("last_name"),
	    		rs.getString("phone"),
	    		rs.getString("email"),
	    		rs.getString("password")
	    );
	}
	
	//Update Customer
	public static boolean updateCustomer(String id, String username, String fname, String lname, String phone, String email, String password) {
	    boolean isSuccess = false;
	    String sql = "UPDATE Customer SET username = ?, first_name = ?, last_name = ?, phone = ?, email = ?, password = ? WHERE customer_id = ?";
	    
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

	        isSuccess = rs > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}
	
	//Get Customer By ID
	public static List<Customer> getCustomerById(String id) {
    	
	    ArrayList<Customer> customers = new ArrayList<>();
	    String sql = "SELECT * FROM Customer WHERE customer_ID = ?";

	    try (Connection conn = DBConnection.getConnection();
	    		PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, Integer.parseInt(id));
	        
	        ResultSet rs = stmt.executeQuery(); 
	        
	        while (rs.next()) {
	            int cId = rs.getInt(1);
	            String username = rs.getString(2);
	            String fName = rs.getString(3);
	            String lName = rs.getString(4);
	            String phone = rs.getString(5);
	            String email = rs.getString(6);
	            String password = rs.getString(7);

	            Customer customer = new Customer(cId, username, fName, lName, phone, email, password);
	            customers.add(customer);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return customers;
	}
	
	// Delete Customer
    public void deleteCustomer(Customer cus) {
        String sql = "DELETE FROM Customer WHERE customer_id = ?";
         
        try (Connection conn = DBConnection.getConnection();
        		PreparedStatement stmt = conn.prepareStatement(sql)){
        	
            stmt.setInt(1, cus.getCustomer_id());
            stmt.executeUpdate();
        } 
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}