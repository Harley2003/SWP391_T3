/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Product {
    private String productID;
    private String productName;
    private float price;
    private float sale_price;
    private Category category;

    public Product() {
    }

    public Product(String productID, String productName) {
        this.productID = productID;
        this.productName = productName;
    }

    
    public Product(String productID, String productName, float price, float sale_price, Category category) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.sale_price = sale_price;
        this.category = category;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getSale_price() {
        return sale_price;
    }

    public void setSale_price(float sale_price) {
        this.sale_price = sale_price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
}
