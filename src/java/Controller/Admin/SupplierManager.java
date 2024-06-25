package Controller.Admin;

import DAL.SupplierDAO;
//import Model.OrderSupplier;
import Model.Supplier;
import Model.OrderSupplierDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
import java.util.List;

public class SupplierManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SupplierManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SupplierManager at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SupplierDAO dao = new SupplierDAO();
        String type = request.getParameter("type");

        if (type == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing type parameter");
            return;
        }

        try {
            switch (type) {
                case "detail" -> {
                    String idOrderSupplier_param = request.getParameter("viewsupplier");
                    if (idOrderSupplier_param == null || idOrderSupplier_param.isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing viewsupplier parameter");
                        return;
                    }
                    int idOrderSupplier = Integer.parseInt(idOrderSupplier_param);
                    String supplierName = dao.getNameSupplierById(idOrderSupplier);
                    List<OrderSupplierDetail> listOrderSupplierDetail = dao.getOrderSupplierDetailsBySupplierId(idOrderSupplier);
                    request.setAttribute("supplierName", supplierName);
                    request.setAttribute("listOrderSupplierDetail", listOrderSupplierDetail);
                    request.getRequestDispatcher("View/Admin/DetailSupplier.jsp").forward(request, response);
                }
                case "delete" -> {
                    String idSupplier = request.getParameter("deleteSupplier");
                    if (idSupplier == null || idSupplier.isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing deleteSupplier parameter");
                        return;
                    }
                    int idDeleteSupplier = Integer.parseInt(idSupplier);
                    dao.deleteSupplier(idDeleteSupplier);
                    response.sendRedirect(request.getContextPath() + "/supplier");
                }
                case "deletedp" -> {
                    String idOrderDetailSupplier_param = request.getParameter("deleteOSD");
                    String orderSupplierId_param = request.getParameter("viewsupplier");
                    if (idOrderDetailSupplier_param == null || idOrderDetailSupplier_param.isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing deleteOSD parameter");
                        return;
                    }
                    int idOrderDetailSupplier = Integer.parseInt(idOrderDetailSupplier_param);
                    int orderSupplierId = Integer.parseInt(orderSupplierId_param);
                    dao.deleteOrderDetailSupplier(idOrderDetailSupplier);
                    response.sendRedirect(request.getContextPath() + "/suppliermanager?type=detail&viewsupplier=" + orderSupplierId);
                }
                default ->
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid type parameter");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format in request");
        } catch (ServletException | IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        String type = request.getParameter("type");
        SupplierDAO dao = new SupplierDAO();
        switch (type) {
            case "edit" -> {
//                HttpSession sessionEdit = request.getSession();
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
                    List<Supplier> suppliers = dao.getInfoSupplier();
                    request.setAttribute("listSuppliers", suppliers);
                } catch (Exception e) {
                    System.out.println(e);
                }

                request.setAttribute("message", message);
                request.getRequestDispatcher("View/Admin/Supplier.jsp").forward(request, response);
            }

            default ->
                throw new AssertionError();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
