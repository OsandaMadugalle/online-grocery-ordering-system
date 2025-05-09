package com.gos.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.gos.model.DeliveryManager;
import com.gos.util.DBConnection;

public class DeliveryManagerService {

    // Delivery Manager Login
    public static ArrayList<DeliveryManager> validate(String username, String password) {
        ArrayList<DeliveryManager> deliveryManagerList = new ArrayList<>();
        String sql = "SELECT * FROM DeliveryManager WHERE Username = ? AND Password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    DeliveryManager dm = new DeliveryManager();
                    dm.setId(rs.getInt("D_ID"));
                    dm.setUsername(rs.getString("Username"));
                    dm.setFirstName(rs.getString("First_Name"));
                    dm.setLastName(rs.getString("Last_Name"));
                    dm.setPhone(rs.getString("Phone"));
                    dm.setEmail(rs.getString("Email"));
                    dm.setPassword(rs.getString("Password"));
                    deliveryManagerList.add(dm);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return deliveryManagerList;
    }

    // Display Delivery Manager
    public static ArrayList<DeliveryManager> getAllDeliveryManagers() {
        ArrayList<DeliveryManager> listDeliveryManager = new ArrayList<>();
        String sql = "SELECT * FROM DeliveryManager";

        try (Statement stmt = DBConnection.getConnection().createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                DeliveryManager dm = new DeliveryManager();
                dm.setId(rs.getInt("D_ID"));
                dm.setUsername(rs.getString("Username"));
                dm.setFirstName(rs.getString("First_Name"));
                dm.setLastName(rs.getString("Last_Name"));
                dm.setPhone(rs.getString("Phone"));
                dm.setEmail(rs.getString("Email"));
                dm.setPassword(rs.getString("Password"));
                listDeliveryManager.add(dm);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listDeliveryManager;
    }

    // Add Delivery Manager
    public static boolean addDeliveryManager(String username, String fname, String lname, String phone, String email, String password) {
        boolean isSuccess = false;
        String sql = "INSERT INTO DeliveryManager (Username, First_Name, Last_Name, Phone, Email, Password) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, fname);
            stmt.setString(3, lname);
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

    // Update Delivery Manager
    public static boolean updateDeliveryManager(String id, String username, String fname, String lname, String phone, String email, String password) {
        boolean isSuccess = false;
        String sql = "UPDATE DeliveryManager SET Username=?, First_Name=?, Last_Name=?, Phone=?, Email=?, Password=? WHERE D_ID=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

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

    // Get Delivery Manager
    public static ArrayList<DeliveryManager> getDeliveryManagerById(String id) {
        ArrayList<DeliveryManager> managerList = new ArrayList<>();
        String sql = "SELECT * FROM DeliveryManager WHERE D_ID=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, Integer.parseInt(id));

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    DeliveryManager dm = new DeliveryManager();
                    dm.setId(rs.getInt("D_ID"));
                    dm.setUsername(rs.getString("Username"));
                    dm.setFirstName(rs.getString("First_Name"));
                    dm.setLastName(rs.getString("Last_Name"));
                    dm.setPhone(rs.getString("Phone"));
                    dm.setEmail(rs.getString("Email"));
                    dm.setPassword(rs.getString("Password"));
                    managerList.add(dm);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return managerList;
    }

    // Delete Delivery Manager
    public static boolean deleteDeliveryManager(int id) {
        boolean isSuccess = false;
        String sql = "DELETE FROM DeliveryManager WHERE D_ID = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, id);

            int result = stmt.executeUpdate();
            isSuccess = result > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
}
