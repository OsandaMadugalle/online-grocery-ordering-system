package com.gos.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Establish and return a database connection
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Construct the database URL using the ConnectionData class
            String url = "jdbc:mysql://localhost:3306/" + ConnectionData.DATABASE;
            String username = ConnectionData.USERNAME;
            String password = ConnectionData.PASSWORD;

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create the connection
            connection = DriverManager.getConnection(url, username, password);

        } catch (ClassNotFoundException e) {
            System.err.println("Error: MySQL JDBC Driver not found! " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error: Unable to establish database connection! " + e.getMessage());
        }

        return connection; // Return the connection (null if failed)
    }

    // Safely close a database connection
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                System.err.println("Error: Failed to close database connection! " + e.getMessage());
            }
        }
    }
}
