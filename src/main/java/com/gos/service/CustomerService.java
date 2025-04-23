package com.gos.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.gos.util.DBConnection;

public class CustomerService {
	public static boolean addCustomer(String username, String first_name, String last_name, String phone, String email, String address) {

	    boolean isSuccess = false;

	    String sql = "INSERT INTO Customer VALUES(0, ?, ?, ?, ?, ?, ?)";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, username);
	        stmt.setString(2, first_name);
	        stmt.setString(3, last_name);
	        stmt.setString(4, phone);
	        stmt.setString(5, email);
	        stmt.setString(6, address);

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
}
