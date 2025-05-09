package com.gos.model;

public class InventoryManager extends Staff {
    public InventoryManager(int id, String username, String firstName, String lastName, 
                           String phone, String email, String password) {
        super(id, username, firstName, lastName, phone, email, password);
    }

    public InventoryManager() {
        super();
    }
    
    @Override
    public String getRole() {
        return "Inventory Manager";
    }

    @Override
    public String getAccessLevel() {
        return "Can manage Inventories only";
    }
}