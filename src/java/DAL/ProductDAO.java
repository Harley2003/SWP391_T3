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
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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
    public boolean addProductInventory(String name, int quantity, String receiveDate, String expriedDate,float price, float salePrice, int categoryID, int supplierID, int status){
        RandomCode code = new RandomCode(); 
        String sql = "INSERT INTO Inventory VALUES(?,?,?,?,?,?)";
        try {
            String id = code.generateCode();
            if(addProduct(id, name, price, salePrice, categoryID)){
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, id);
                stm.setInt(2, quantity); 
                stm.setString(3, receiveDate);
                stm.setString(4, expriedDate); 
                stm.setInt(5, supplierID);
                stm.setInt(6, status);
                stm.executeUpdate();
                return true;
            } 
            return false;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    } 
    public boolean addProduct(String id, String name, float price, float salePrice, int categoryID){ 
        String sql = "INSERT INTO Product VALUES(?,?,?,?,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id); 
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
    
    public List<Product> searchProductByName(String pName) {
        List<Product> list = new ArrayList<>();
        String sql = "select P.id, P.name, P.sale_price from Product P where P.name LIKE ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + pName + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) { 
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getFloat(3)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public Product getProduct(String pID) {
        String sql = "select P.id, P.name, P.sale_price from Product P where P.id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) { 
                return new Product(rs.getString(1), rs.getString(2), rs.getFloat(3));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
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
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Product> getNameProduct() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "SELECT id, [name] FROM Product";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getString("id"));
                product.setProductName(rs.getString("name"));
                listProduct.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listProduct;
    }
}
