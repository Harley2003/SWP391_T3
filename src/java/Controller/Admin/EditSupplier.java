package Controller.Admin;

import DAL.SupplierDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Supplier;

public class EditSupplier extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateSupplier</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSupplier at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SupplierDAO dao = new SupplierDAO();
        String idEdit = request.getParameter("idEdit");
        String nameEdit = request.getParameter("nameEdit");
        String phoneEdit = request.getParameter("phoneEdit");
        String addressEdit = request.getParameter("addressEdit");
        String emailEdit = request.getParameter("emailEdit");
        String message = "";

        try {
            Supplier updatedSupplier = new Supplier(Integer.parseInt(idEdit), nameEdit, phoneEdit, addressEdit, emailEdit);
            dao.editSupplier(updatedSupplier);
            message = "Sửa nhà cung cấp thành công";
        } catch (NumberFormatException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }

        try {
            List<Supplier> suppliers = dao.getAllInfoSupplier();
            request.setAttribute("listSuppliers", suppliers);
        } catch (Exception e) {
            System.out.println(e);
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("View/Admin/Supplier.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
