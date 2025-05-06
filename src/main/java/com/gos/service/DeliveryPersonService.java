package com.gos.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.gos.model.DeliveryPerson;
import com.gos.util.DBConnection;

public class DeliveryPersonService {

    // Validate Delivery Person Login
    public static List<DeliveryPerson> validate(String username, String password) {
        ArrayList<DeliveryPerson> deliveryPersonList = new ArrayList<>();
        String sql = "SELECT * FROM DeliveryPerson WHERE Username = ? AND Password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    DeliveryPerson deliveryPerson = mapResultSetToDeliveryPerson(rs);
                    deliveryPersonList.add(deliveryPerson);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deliveryPersonList;
    }

    // Map ResultSet to DeliveryPerson object
    private static DeliveryPerson mapResultSetToDeliveryPerson(ResultSet rs) throws SQLException {
        return new DeliveryPerson(
                rs.getInt("DP_ID"),
                rs.getString("Username"),
                rs.getString("First_name"),
                rs.getString("Last_name"),
                rs.getString("Phone"),
                rs.getString("Email"),
                rs.getString("Password")
        );
    }

    // Get All Delivery Persons
    public static ArrayList<DeliveryPerson> getAllDeliveryPersons() {
        ArrayList<DeliveryPerson> listDeliveryPersons = new ArrayList<>();
        String sql = "SELECT * FROM DeliveryPerson";

        try (Statement stmt = DBConnection.getConnection().createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                DeliveryPerson dp = mapResultSetToDeliveryPerson(rs);
                listDeliveryPersons.add(dp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listDeliveryPersons;
    }

    // Add a Delivery Person
    public static boolean addDeliveryPerson(String username, String first_name, String last_name, String phone, String email, String password) {
        boolean isSuccess = false;
        String sql = "INSERT INTO DeliveryPerson (Username, First_name, Last_name, Phone, Email, Password) VALUES (?, ?, ?, ?, ?, ?)";

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

    // Update Delivery Person Details
    public static boolean updateDeliveryPerson(String id, String username, String fname, String lname, String phone, String email, String password) {
        boolean isSuccess = false;
        String sql = "UPDATE DeliveryPerson SET Username=?, First_name=?, Last_name=?, Phone=?, Email=?, Password=? WHERE DP_ID=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, fname);
            stmt.setString(3, lname);
            stmt.setString(4, phone);
            stmt.setString(5, email);
            stmt.setString(6, password);
            stmt.setInt(7, Integer.parseInt(id));

            isSuccess = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Get Delivery Person By ID
    public static ArrayList<DeliveryPerson> getDeliveryPersonById(String id) {
        ArrayList<DeliveryPerson> dpList = new ArrayList<>();
        String sql = "SELECT * FROM DeliveryPerson WHERE DP_ID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                DeliveryPerson dp = mapResultSetToDeliveryPerson(rs);
                dpList.add(dp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dpList;
    }

    // Delete Delivery Person by ID
    public static boolean deleteDeliveryPerson(int id) {
        boolean isSuccess = false;
        String sql = "DELETE FROM DeliveryPerson WHERE DP_ID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id); // Set the delivery person ID for deletion
            isSuccess = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}
