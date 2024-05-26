/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author nguye
 */
public class Inventory {

    private int id;
    private Product productID;
    private int quantity;
    private Date receiveDate;
    private Date dataExpired;
    private Supplier supplierID;

    public Inventory() {
    }

    public Inventory(int id, Product productID, int quantity, Date receiveDate, Date dataExpired, Supplier supplierID) {
        this.id = id;
        this.productID = productID;
        this.quantity = quantity;
        this.receiveDate = receiveDate;
        this.dataExpired = dataExpired;
        this.supplierID = supplierID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProductID() {
        return productID;
    }

    public void setProductID(Product productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(Date receiveDate) {
        this.receiveDate = receiveDate;
    }

    public Date getDataExpired() {
        return dataExpired;
    }

    public void setDataExpired(Date dataExpired) {
        this.dataExpired = dataExpired;
    }

    public Supplier getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(Supplier supplierID) {
        this.supplierID = supplierID;
    }

}
