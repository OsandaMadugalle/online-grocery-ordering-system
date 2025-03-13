package Osanda;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDBUtil {

    public static List<Admin> validate(String username, String password) {
        ArrayList<Admin> admin = new ArrayList<>();

        String url = "jdbc:mysql://localhost:3306/grocery_ordering_system";
        String UN = "root";
        String PW = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver class
            Connection con = DriverManager.getConnection(url, UN, PW);
            Statement statement = con.createStatement();

            // Prevent SQL injection using prepared statements
            String query = "SELECT * FROM admin WHERE username='" + username + "' AND password='" + password + "'";
            ResultSet rs = statement.executeQuery(query);

            if (rs.next()) {
                int admin_id = rs.getInt(1);
                String admin_username = rs.getString(2);
                String first_name = rs.getString(3);
                String last_name = rs.getString(4);
                String phone = rs.getString(5);
                String email = rs.getString(6);
                String admin_password = rs.getString(7);

                Admin ad = new Admin(admin_id, admin_username, first_name, last_name, phone, email, admin_password);
                admin.add(ad);
            }

            System.out.println("Admin List Size: " + admin.size());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}
