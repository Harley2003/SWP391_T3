/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Category;
import Model.Inventory;
import Model.Product; 
import Model.Supplier;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List; 
import utils.RandomCode;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext{ 
    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select P.id, P.name, price, sale_price, C.id,  C.name "
                   + "from Product P join Category C on P.category_id = C.id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) { 
                Category category = new Category(rs.getInt(5), rs.getString(6));
                list.add(new Product(rs.getString(1), 
                                    rs.getString(2), 
                                         rs.getFloat(3), 
                                     rs.getFloat(4), 
                                              category));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }   
    public List<Category> getCategory(){
        List<Category> list = new ArrayList<>();
        String sql = "select id, name from Category";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {  
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    } 
    
    public boolean addCategory(String categoryName){
        String sql = "INSERT INTO Category VALUES(?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, categoryName); 
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    } 
    public boolean addProduct(String name, float price, float salePrice, int categoryID){
        RandomCode code = new RandomCode(); 
        String sql = "INSERT INTO Product VALUES(?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, code.generateCode()); 
            stm.setString(2, name);
            stm.setFloat(3, price);
            stm.setFloat(4, salePrice);
            stm.setInt(5, categoryID);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public boolean isExistProduct(String productName){
        String sql = "select P.id from Product P where P.name LIKE ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, productName); 
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {  
                return true;
            } 
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
    public List<Inventory> getProductInventory() {
        List<Inventory> list = new ArrayList<>();
        String sql = "select P.id, P.name, price, sale_price, C.id,  C.name "
                   + "from Product P join Category C on P.category_id = C.id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) { 
                Product p = new Product(rs.getString(1), rs.getString(2));
                Supplier s = new Supplier(rs.getString(3)); 
                
                list.add(new Inventory(p, 
                                       rs.getInt(4), 
                                       rs.getDate(5), 
                                       rs.getDate(6),
                                       s,
                                       rs.getInt(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
