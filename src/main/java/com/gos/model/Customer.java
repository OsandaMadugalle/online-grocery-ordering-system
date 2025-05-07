package com.gos.model;

public class Customer extends Person {
    public Customer(int id, String username, String firstName, String lastName, 
                   String phone, String email, String password) {
        super(id, username, firstName, lastName, phone, email, password);
    }

    public Customer() {
        super();
    }
}