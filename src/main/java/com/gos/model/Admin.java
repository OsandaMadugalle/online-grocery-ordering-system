package com.gos.model;

public class Admin extends Staff {
    public Admin(int id, String username, String firstName, String lastName, 
                String phone, String email, String password) {
        super(id, username, firstName, lastName, phone, email, password);
    }

    public Admin() {
        super();
    }

    @Override
    public String getRole() {
        return "Administrator";
    }

    @Override
    public String getAccessLevel() {
        return "Full System Access";
    }
}