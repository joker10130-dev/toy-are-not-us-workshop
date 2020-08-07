package com.groupfour.productapi;

public class ProductResponse {
    private int id;
    private String name;
    private String gender;
    private String age;
    private int price;
    private boolean availability;
    private String brand;

    public ProductResponse(int id, String name, String gender, String age, int price, boolean availability, String brand) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.age = age;
        this.price = price;
        this.availability = availability;
        this.brand = brand;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
}
