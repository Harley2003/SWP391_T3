package DAL;

import Model.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.*;


public class SystemLogDAO extends DBContext {

    public List<SystemLog> getAllSystemLog() {
        List<SystemLog> list = new ArrayList<>();
        String sql = "Select *"
                + " FROM System_log ORDER BY date DESC";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                User UserLog = getUserbyUserID(rs.getInt("user_id"));
                UserInfo info = getUserInfoByUserId(rs.getInt("user_id"));
                list.add(new SystemLog(rs.getInt("id"),UserLog,
                        rs.getString("date"),
                        rs.getString("action"),info));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserbyUserID(int userID) {
        String sql = "Select * FROM Users Where id = ? ";
        try  {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
            return new User(rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getInt("status"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    public UserInfo getUserInfoByUserId(int userId) {
        String sql = "Select * FROM User_Info  "
                + " Where user_id = ? ";
        try  {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
            return new UserInfo(rs.getString("first_name")+" " +rs.getString("last_name"),
                    rs.getDate("date_of_birth"),
                    rs.getInt("gender"), rs.getString("phone"),
                    rs.getString("address"), rs.getString("email"));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    
    }
    public boolean insertIntoSystemLog(int userid,String action) {
        String sql ="Insert Into System_Log Values (? ,GETDATE() ,?)";
         try  {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            stm.setString(2, action);
            return stm.executeUpdate()>0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    public static void main(String[] args) {
    }
}

