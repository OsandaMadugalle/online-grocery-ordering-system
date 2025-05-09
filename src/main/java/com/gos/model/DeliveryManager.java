package com.gos.model;

public class DeliveryManager extends Staff {
    public DeliveryManager(int id, String username, String firstName, String lastName, 
                          String phone, String email, String password) {
        super(id, username, firstName, lastName, phone, email, password);
    }

    public DeliveryManager() {
        super();
    }
    
    @Override
    public String getRole() {
        return "Delivery Manager";
    }

    @Override
    public String getAccessLevel() {
        return "Can manage delivery side only";
    }
}