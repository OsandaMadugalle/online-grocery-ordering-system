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
}