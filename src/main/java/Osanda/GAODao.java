package Osanda;

import java.sql.*;

public class GAODao {

    public boolean checkAdminLogin(String username, String password) {
        // Hardcoded admin credentials
        String adminUsername = "admin";  
        String adminPassword = "admin123"; 

        return username.equals(adminUsername) && password.equals(adminPassword);  // Validate credentials
    }

    public boolean checkCustomerLogin(String username, String password) {
        // Code to check customer login credentials in the database
        return true;  // For now, assume customer login is always successful
    }

    // Other database interaction methods (e.g., addProduct, updateProduct, etc.)
}
