/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Role;
import Model.Status;
import Model.User; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext {

    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [User].*, Status.name, Role.name from [User] " 
                   + "join Status on status_id = Status.id " 
                   + "join Role on role_id = Role.id";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Status status = new Status(rs.getInt(4), rs.getString(6));
                Role role = new Role(rs.getInt(5), rs.getString(7));
                list.add(new User(rs.getInt(1),
                                      rs.getString(2),
                                      rs.getString(3),
                                      status,
                                      role));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    } 
    
    public User checkEmail(String email){
        String sql = "select U.id, U.username, U.password, U.status_id, U.role_id from [User] U "
                      + "join User_Info UI on U.id = UI.user_id where UI.email = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email); 
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Status status = new Status(rs.getInt(4));
                Role role = new Role(rs.getInt(5));
                return new User(rs.getInt(1), 
                                     rs.getString(2), 
                                     rs.getString(3), 
                                     status, 
                                     role);
            }
        } catch (SQLException e) {
        } 
        return null;
    } 
     
    public User login(String user, String pass){
        String sql = "SELECT [User].*, Status.name, Role.name from [User] " 
                   + "join Status on status_id = Status.id " 
                   + "join Role on role_id = Role.id where username= ? AND password = ?"; 
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Status status = new Status(rs.getInt(4));
                Role role = new Role(rs.getInt(5), rs.getString(7));
                return new User(rs.getInt(1),
                                      rs.getString(2),
                                      rs.getString(3),
                                      status,
                                      role);
            }
        } catch (SQLException e) {
        } 
        return null;
    }  
    
    public void changePassword(int userID, String newpass){
        String query = "update [User] set password = ? where id = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, newpass);
            stm.setInt(2, userID);
            stm.executeUpdate();  
        } catch (SQLException e) {
        }  
    }
}
