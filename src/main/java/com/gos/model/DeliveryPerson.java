package com.gos.model;

public class DeliveryPerson extends Staff {
    public DeliveryPerson(int id, String username, String firstName, String lastName, 
                         String phone, String email, String password) {
        super(id, username, firstName, lastName, phone, email, password);
    }

    public DeliveryPerson() {
        super();
    }
}