package com.gos.model;

public class Product {
    private int id;
    private String imagePath;
    private String productName;
    private String category;
    private int stock;
    private double price;
    
    public Product() {
    }

    public Product(int id, String imagePath, String productName, String category, int stock, double price) {
        this.id = id;
        this.imagePath = imagePath;
        this.productName = productName;
        this.category = category;
        this.stock = stock;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}