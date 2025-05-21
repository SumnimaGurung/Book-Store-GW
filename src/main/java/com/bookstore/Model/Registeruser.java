package com.bookstore.Model;

import java.time.LocalDateTime;

public class Registeruser {
    private int userId;
    private String name;
    private String email;
    private String password;
    private String address;
    private LocalDateTime created;

    // Constructor without ID (for registration)
    public Registeruser(String name, String email, String password, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
    }

    // Full constructor (if needed for retrieval)
    public Registeruser(int userId, String name, String email, String password, String address, LocalDateTime created) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.created = created;
    }

    // Getters
    public int getUserId() { return userId; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getAddress() { return address; }
    public LocalDateTime getCreated() { return created; }

    // Setters
    public void setUserId(int userId) { this.userId = userId; }
    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setPassword(String password) { this.password = password; }
    public void setAddress(String address) { this.address = address; }
    public void setCreated(LocalDateTime created) { this.created = created; }
}
