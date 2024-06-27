package DAL;

import Model.Role;
import Model.ScheduleLog;
import Model.User;
import Model.UserInfo;
import java.util.List;
import Model.WorkSession;
import java.util.ArrayList;
import java.sql.*;

public class ScheduleDAO extends DBContext {

    public List<WorkSession> getAllWorkSession() {
        List<WorkSession> list = new ArrayList<>();
        String sql = "SELECT * FROM WorkSession ";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new WorkSession(rs.getInt("WorkSessionId"), rs.getString("WorkSessionName"),
                         subTime(rs.getString("start_time")),subTime( rs.getString("end_time"))));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    } 
    public boolean InsertIntoWorkSession(String name,String start_time,String end_time) {
        String sql = "INSERT INTO WorkSession VALUES(?,CAST(? as time),Cast(? as time))";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
           stm.setString(1, name);
           stm.setString(2, start_time);
           stm.setString(3, end_time);
           return   stm.executeUpdate() >0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public static void main(String[] args) {
        ScheduleDAO dao = new ScheduleDAO();
       
    }

    public String subTime(String time) {
        String timeString = time;
        int indexOfDot = timeString.indexOf('.');
        String trimmedTime = timeString.substring(0, indexOfDot);
        return trimmedTime;
    }
    
    public boolean InsertIntoScheduleLog(int staffid,String worksessionid) {
        String sql  = "Insert Into Schedule_Log VALUES(?,?)";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
           stm.setInt(1, staffid);
           stm.setString(2, worksessionid);
           return   stm.executeUpdate() >0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
//     public List<User> getAllUserWithScheduleLog() {
//         List<User> list = new ArrayList<>();
//         String sql ="SELECT Users.*, Role.name, (UI.first_name + ' ' + UI.last_name) AS fullname, \n" +
//"                 UI.date_of_birth, UI.gender, UI.phone, UI.address, UI.email, WorkSessionID,s.id,staff_id,WorkSessionID\n" +
//"                 from Users join Role on role_id = Role.id join User_Info UI on Users.id = user_id\n" +
//"               left join Schedule_Log s On s.staff_id= Users.id where Users.Status != 0";
//         try {
//            PreparedStatement stm = connection.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                ScheduleLog log = new ScheduleLog(rs.getInt("staff_id"),
//                        rs.getInt("WorkSessionID"));
//                UserInfo uInfo = new UserInfo(rs.getString(7),
//                        rs.getDate(8),
//                        rs.getInt(9),
//                        rs.getString(10),
//                        rs.getString(11),
//                        rs.getString(12));
//                Role role = new Role(rs.getInt(5), rs.getString(6));
//                list.add(new User(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        role,
//                        uInfo,log));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return list;
//
//    
//     }
//      public ScheduleLog getScheduleLogByID(int id) {   
//          String sql = "SELECT staff_id,WorkSessionID from Schedule_log where id = ?";
//          try(PreparedStatement stm = connection.prepareStatement(sql)){
//              stm.setInt(1, id);
//              ResultSet rs = stm.executeQuery();
//              if(rs.next()) {
//                  return new ScheduleLog(rs.getInt("staff_id"),rs.getInt("WorkSessionID"));
//              }
//          }catch(Exception e) {
//              System.out.println(e);
//          }
//          return null;
//      }
    public WorkSession getWorkSessionByID(int id) {
        String sql = "Select * From WorkSession WHERE WorkSessionID =?";
        try(PreparedStatement stm = connection.prepareStatement(sql)){
              stm.setInt(1, id);
              ResultSet rs = stm.executeQuery();
              if(rs.next()) {
                  return new WorkSession(id,
                          rs.getString("WorkSessionName"),
                          rs.getString("start_time"), rs.getString("end_time"));
              }
          }catch(Exception e) {
              System.out.println(e);
          }
        return null;
    }
      
}

