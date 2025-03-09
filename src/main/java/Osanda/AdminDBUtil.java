package Osanda;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AdminDBUtil {
	
	public static List<Admin> validate(String username, String password){
		
		ArrayList<Admin> admin = new ArrayList<>();
		
		//create db connection
		String url = "jdbc:mysql://localhost:3306/gos";
		String UN = "root";
		String PW = "";
				
		//validate
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, username, password);
			
			Statement state =con.createStatement();
			
			String Query = "SELECT * FROM admin WHERE username='"+username+"' AND password='"+password+"'";
			
			ResultSet rs = state.executeQuery(Query);
			
			if(rs.next())
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return admin;
	}

}
