package com.gos.model;

public abstract class Staff extends Person {
    public Staff(int id, String username, String firstName, String lastName, 
                String phone, String email, String password) {
        super(id, username, firstName, lastName, phone, email, password);
    }

    public Staff() {
        super();
    }

    // New abstract method (must be implemented by all Staff subclasses)
    public abstract String getRole();

    // Optional: A common method that can be overridden
    public String getAccessLevel() {
        return "Base Staff Access";
    }
}