package com.gos.model;

public class DeliveryManager {

    private int delivary_manager_id;
    private String username;
    private String first_name;
    private String last_name;
    private String phone;
    private String email;
    private String password;

    public  DeliveryManager(int delivary_manager_id, String username, String first_name, String last_name, String phone, String email, String password) {
        this.delivary_manager_id = delivary_manager_id;
        this.username = username;
        this.first_name = first_name;
        this.last_name = last_name;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public DeliveryManager() {
    }

    public int getdelivary_manager_id() {
        return delivary_manager_id; 
    }

    public void setdelivary_manager_id(int delivary_manager_id) { 
        this.delivary_manager_id = delivary_manager_id; 
    }

    public String getUsername() { 
        return username; 
    }

    public void setUsername(String username) { 
        this.username = username; 
    }

    public String getFirst_name() { 
        return first_name; 
    }

    public void setFirst_name(String first_name) { 
        this.first_name = first_name; 
    }

    public String getLast_name() { 
        return last_name; 
    }

    public void setLast_name(String last_name) { 
        this.last_name = last_name; 
    }

    public String getPhone() { 
        return phone; 
    }

    public void setPhone(String phone) { 
        this.phone = phone; 
    }

    public String getEmail() { 
        return email; 
    }

    public void setEmail(String email) {         
        this.email = email;         
    }

    public String getPassword() { 
        return password; 
    }

    public void setPassword(String password) { 
        this.password = password; 
    }
}