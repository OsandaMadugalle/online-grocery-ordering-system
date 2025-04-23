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
	        stmt.setString(6, password); // Updated field from 'address' to 'password'

	        int rs = stmt.executeUpdate();

	        isSuccess = rs > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}
	
	// Validate Customer Login
	public static List<Customer> validate(String username, String password) {
	    List<Customer> customerList = new ArrayList<>();
	    String sql = "SELECT * FROM customer WHERE username = ? AND password = ?";

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

	// Map the ResultSet row to a Customer object
	private static Customer mapResultSetToCustomer(ResultSet rs) throws SQLException {
	    return new Customer(
	            rs.getInt("Customer_ID"),
	            rs.getString("Username"),
	            rs.getString("First_name"),
	            rs.getString("Last_name"),
	            rs.getString("Phone"),
	            rs.getString("Email"),
	            rs.getString("Password") // Updated field from 'address' to 'password'
	    );
	}
	
	//update cus
	public static boolean updateCustomer(String id, String username, String fname, String lname, String phone, String email, String password) {
	    boolean isSuccess = false;
	    String sql = "UPDATE customer SET Username=?, First_Name=?, Last_Name=?, Phone=?, Email=?, Password=? WHERE Customer_ID=?";

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
	
	//get by id
	public static List<Customer> getCustomerById(String id) {
    	
	    List<Customer> customers = new ArrayList<>();
	    String sql = "SELECT * FROM customer WHERE Customer_ID = ?";

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
}