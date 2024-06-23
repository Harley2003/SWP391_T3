package DAL;

import Model.Supplier;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SupplierDAO extends DBContext {

    public List<Supplier> getAllInfoSupplier() {
        List<Supplier> listSupplier = new ArrayList<>();
        String sql = "SELECT * FROM Supplier";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplier.setId(rs.getInt("id"));
                supplier.setName(rs.getString("name"));
                supplier.setPhone(rs.getString("phone"));
                supplier.setAddress(rs.getString("address"));
                supplier.setEmail(rs.getString("email"));
                listSupplier.add(supplier);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listSupplier;
    }

    public void addInfoSupplier(Supplier supplier) {
        String sql = "INSERT INTO Supplier ([name], [phone], [address], [email]) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, supplier.getName());
            ps.setString(2, supplier.getPhone());
            ps.setString(3, supplier.getAddress());
            ps.setString(4, supplier.getEmail());
            int executeSuccess = ps.executeUpdate();
            if (executeSuccess > 0) {
                System.out.println("Supplier added successfully");
            } else {
                System.out.println("Failed to add supplier");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Supplier exitAddInfoSupplier(String name, String phone, String address) {
        Supplier exitSupplier = null;
        StringBuilder sql = new StringBuilder("SELECT * FROM Supplier WHERE 1 = 1");

        try {
            List<Object> parameters = new ArrayList<>();

            if (name != null && !name.isEmpty()) {
                sql.append(" AND name = ?");
                parameters.add(name);
            }

            if (phone != null && !phone.isEmpty()) {
                sql.append(" OR phone = ?");
                parameters.add(phone);
            }

            if (address != null && !address.isEmpty()) {
                sql.append(" OR address = ?");
                parameters.add(address);
            }

//            if (email != null && !email.isEmpty()) {
//                sql.append(" OR email = ?");
//                parameters.add(email);
//            }
            try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
                for (int i = 0; i < parameters.size(); i++) {
                    ps.setObject(i + 1, parameters.get(i));
                }

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        exitSupplier = new Supplier();
                        exitSupplier.setName(rs.getString("name"));
                        exitSupplier.setPhone(rs.getString("phone"));
                        exitSupplier.setAddress(rs.getString("address"));
//                        exitSupplier.setEmail(rs.getString("email"));
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return exitSupplier;
    }

    public int getIdbyNameSupplier(String name) {
        int idSupplier = - 1;
        String sql = "SELECT [id] FROM Supplier WHERE [name] = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setString(1, name);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    idSupplier = rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return idSupplier;
    }

    public void editSupplier(Supplier supplier) {
        String sql = "UPDATE Supplier SET [name] = ?, [phone] = ?, [address] = ?, [email] = ? WHERE [id] = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, supplier.getName());
            ps.setString(2, supplier.getPhone());
            ps.setString(3, supplier.getAddress());
            ps.setString(4, supplier.getEmail());
            ps.setInt(5, supplier.getId());
            int executeSuccess = ps.executeUpdate();
            if (executeSuccess > 0) {
                System.out.println("Supplier edited successfully");
            } else {
                System.out.println("Failed to edit supplier");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSupplier(int idSupplier) {
        String sql = "DELETE FROM Supplier WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, idSupplier);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        SupplierDAO supplierDAO = new SupplierDAO();
        /*
        List<Supplier> suppliers = supplierDAO.getAllInfoSupplier();

        for (Supplier supplier : suppliers) {
            System.out.println("Supplier ID: " + supplier.getId());
            System.out.println("Name: " + supplier.getName());
            System.out.println("Phone: " + supplier.getPhone());
            System.out.println("Address: " + supplier.getAddress());
            System.out.println("Email: " + supplier.getEmail());
            System.out.println("-----------------------------");
        }

        Supplier newSupplier = new Supplier("Test Supplier", 1234567890, "123 Test St", "test@example.com");
        supplierDAO.addInfoSupplier(newSupplier);
         */

        String name1 = "Apex Computers";
        String phone1 = "2163547758";
        Supplier supplier1 = supplierDAO.exitAddInfoSupplier(name1, phone1, null);
        if (supplier1 != null) {
            System.out.println("Supplier found with name '" + name1 + "' and phone '" + phone1 + "':");
            System.out.println("Name: " + supplier1.getName());
            System.out.println("Phone: " + supplier1.getPhone());
            System.out.println("Address: " + supplier1.getAddress());
            System.out.println("Email: " + supplier1.getEmail());
            System.out.println("-----------------------------");
        } else {
            System.out.println("No supplier found with name '" + name1 + "' and phone '" + phone1 + "'");
        }
        /*
        String name2 = "Apex Computers";
        Supplier supplier2 = supplierDAO.exitAddInfoSupplier(name2, null, null, null);

        if (supplier2 != null) {
            System.out.println("Supplier found with name '" + name2 + "':");
            System.out.println("Name: " + supplier2.getName());
            System.out.println("Phone: " + supplier2.getPhone());
            System.out.println("Address: " + supplier2.getAddress());
            System.out.println("Email: " + supplier2.getEmail());
            System.out.println("-----------------------------");
        } else {
            System.out.println("No supplier found with name '" + name2 + "'");
        }
         */
        int idSupplier = supplierDAO.getIdbyNameSupplier(name1);
        System.out.println(idSupplier);
    }
}
