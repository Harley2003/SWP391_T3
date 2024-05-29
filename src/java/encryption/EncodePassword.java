package encryption;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncodePassword {

    // Phương thức mã hóa mật khẩu bằng thuật toán SHA-256 với muối
    public static String encodeSha256(String password) throws NoSuchAlgorithmException {
        // Tạo muối mới
        String salt = "SCveu0GRgdbbrcfZnpiCQ";
        // Mã hóa mật khẩu với muối
        String hashedPassword = generateHash(password, salt);

        return hashedPassword;
    }

    // Phương thức tạo mã băm SHA-256 cho một chuỗi và muối nhất định
    private static String generateHash(String originalString, String salt) throws NoSuchAlgorithmException {
        // Lấy một thể hiện của MessageDigest sử dụng thuật toán SHA-256
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        // Kết hợp chuỗi gốc với muối và tính toán mã băm
        byte[] encodedhash = digest.digest((originalString + salt).getBytes(StandardCharsets.UTF_8));
        // Chuyển đổi mảng byte của mã băm sang chuỗi hexadecimal và trả về
        return bytesToHex(encodedhash);
    }

    // Phương thức chuyển đổi mảng byte thành chuỗi hexadecimal
    private static String bytesToHex(byte[] hash) {
        // Tạo một StringBuilder để giữ giá trị hexadecimal
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        // Lặp qua từng byte trong mảng băm
        for (byte b : hash) {
            // Chuyển byte thành chuỗi hexadecimal
            String hex = Integer.toHexString(0xff & b);
            // Nếu chuỗi hexadecimal chỉ có một ký tự, thêm '0' vào trước
            if (hex.length() == 1) {
                hexString.append('0');
            }
            // Thêm chuỗi hexadecimal vào StringBuilder
            hexString.append(hex);
        }
        // Trả về chuỗi hexadecimal hoàn chỉnh
        return hexString.toString();
    }
}
