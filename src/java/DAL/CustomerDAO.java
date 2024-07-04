/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Customer; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class CustomerDAO extends DBContext{
    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        System.out.println(dao.getCustomer());
    }
    public List<Customer> getCustomer(){
        List<Customer> list = new ArrayList<>();
        String sql = "select C.id, C.name, C.phone, C.point from Customer C";
        try {
            PreparedStatement stm = connection.prepareStatement(sql); 
            ResultSet rs = stm.executeQuery();
            while(rs.next()){  
                list.add(new Customer(rs.getInt(1),
                                     rs.getString(2),
                                rs.getString(3),
                                    rs.getInt(4)));
            }
            return list;
        } catch (SQLException e) {
        } 
        return null;
    }
    public List<Customer> searchCustomerByPhone(String phoneNumber){
        List<Customer> list = new ArrayList<>();
        String sql = "select C.id, C.name, C.phone, C.point from Customer C where C.phone LIKE ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + phoneNumber + "%"); 
            ResultSet rs = stm.executeQuery();
            while(rs.next()){  
                list.add(new Customer(rs.getInt(1),
                                     rs.getString(2),
                                rs.getString(3),
                                    rs.getInt(4)));
            }
            return list;
        } catch (SQLException e) {
        } 
        return null;
    }
}
