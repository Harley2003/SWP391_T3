/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author nguye
 */
public class OrderSupplierDetail {

    private int id;
    private OrderSupplier orderSupplierID;
    private int productID;
    private int quantity;
    private double price;

    public OrderSupplierDetail() {
    }

    public OrderSupplierDetail(int id, OrderSupplier orderSupplierID, int productID, int quantity, double price) {
        this.id = id;
        this.orderSupplierID = orderSupplierID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public OrderSupplier getOrderSupplierID() {
        return orderSupplierID;
    }

    public void setOrderSupplierID(OrderSupplier orderSupplierID) {
        this.orderSupplierID = orderSupplierID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
