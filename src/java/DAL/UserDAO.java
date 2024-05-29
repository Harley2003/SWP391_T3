package DAL;

import Model.*;
import encryption.EncodePassword;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends DBContext {

    public User checkLogin(String userName, String passwordHash) {
        User user = null;
        String query = "SELECT * FROM [User] WHERE [username] = ? AND PasswordHash = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement stm = connection.prepareStatement(query);
            stm.setString(1, userName);
            stm.setString(2, passwordHash);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setPassword(rs.getString("PasswordHash"));
                Role role = new Role();
                role.setId(rs.getInt("role_id"));
                Status status = new Status();
                status.setId(rs.getInt("status_id"));
                user.setRoleID(role);
                user.setStatusID(status);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        // Thực hiện đăng nhập với tên người dùng và mật khẩu
        String userName = "Admin";
        String plainPassword = "admin"; // Mật khẩu dạng text thô, chưa được mã hóa
        try {
            // Mã hóa mật khẩu dạng text thành một chuỗi hash
            String passwordHash = EncodePassword.encodeSha256(plainPassword);
            System.out.println(passwordHash);
            // Gọi phương thức login để xác minh mật khẩu và lấy thông tin người dùng
            User user = dao.checkLogin(userName, passwordHash);

            // Kiểm tra xem đăng nhập thành công hay không
            if (user != null) {
                System.out.println("Đăng nhập thành công!");
                System.out.println("Thông tin người dùng:");
                System.out.println("ID: " + user.getId());
                System.out.println("Tên người dùng: " + user.getUserName());
                System.out.println("Mật khẩu: " + user.getPassword());
                System.out.println("ID vai trò: " + user.getRoleID().getId());
                System.out.println("ID trạng thái: " + user.getStatusID().getId());
            } else {
                System.out.println("Đăng nhập thất bại!");
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

}
