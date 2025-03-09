package Osanda;

public class Admin {

    private int admin_id;
    private String username;
    private String first_name;
    private String last_name;
    private String phone;
    private String email;
    private String password;

    public Admin(int admin_id, String username, String first_name, String last_name, String phone, String email, String password) {
        this.admin_id = admin_id;
        this.username = username;
        this.first_name = first_name;
        this.last_name = last_name;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public String getUsername() {
        return username;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
}
