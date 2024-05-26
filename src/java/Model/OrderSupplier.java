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
public class OrderSupplier {

    private int id;
    private Supplier supplierID;
    private Date receiveDate;

    public OrderSupplier() {
    }

    public OrderSupplier(int id, Supplier supplierID, Date receiveDate) {
        this.id = id;
        this.supplierID = supplierID;
        this.receiveDate = receiveDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Supplier getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(Supplier supplierID) {
        this.supplierID = supplierID;
    }

    public Date getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(Date receiveDate) {
        this.receiveDate = receiveDate;
    }

}
