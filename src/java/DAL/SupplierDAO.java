/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Supplier;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class SupplierDAO extends DBContext{
    public List<Supplier> getSupplier() {
        List<Supplier> list = new ArrayList<>();
        String sql = "select S.id, S.name, S.phone, S.address, S.email from Supplier S";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {  
                list.add(new Supplier(rs.getInt(1),
                                     rs.getString(2),
                                    rs.getString(3),
                                  rs.getString(4),
                                    rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }  
    
    public boolean addSupplier(String name, String phone, String address, String email){
        String sql = "INSERT INTO Supplier VALUES(?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, phone); 
            stm.setString(3, address); 
            stm.setString(4, email); 
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}
