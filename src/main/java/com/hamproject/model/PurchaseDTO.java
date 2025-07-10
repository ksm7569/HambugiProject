package com.hamproject.model;

public class PurchaseDTO {
    private String userId;
    private String itemName;
    private int price;
    private int quantity;
    private int totalPrice;
    private String purchaseTime; // YYYY-MM-DD HH:MM 형식

    public PurchaseDTO() {}

    public PurchaseDTO(String userId, String itemName, int price, int quantity, int totalPrice, String purchaseTime) {
        this.userId = userId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.purchaseTime = purchaseTime;
    }

    // Getter & Setter 생략 가능. 필요 시 추가.
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

    public String getPurchaseTime() { return purchaseTime; }
    public void setPurchaseTime(String purchaseTime) { this.purchaseTime = purchaseTime; }
}