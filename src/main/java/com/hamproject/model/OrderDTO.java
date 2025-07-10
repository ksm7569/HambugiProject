package com.hamproject.model;

import java.sql.Timestamp;

public class OrderDTO {
    private int id;
    private String userId;
    private String itemName;
    private int price;
    private int quantity;
    private int totalPrice;
    private Timestamp purchaseTime;

    public int getOrderId() { return id; }
    // Getter/Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public int getTotalPrice() { return totalPrice; }
    public void setTotalPrice(int totalPrice) { this.totalPrice = totalPrice; }

    public Timestamp getPurchaseTime() { return purchaseTime; }
    public void setPurchaseTime(Timestamp purchaseTime) { this.purchaseTime = purchaseTime; }
}
