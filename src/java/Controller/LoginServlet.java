/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.UserDAO;
import Model.User;
import encryption.EncodePassword;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguye
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        response.sendRedirect("/View/Login.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        String user = request.getParameter("input-user");
        String pass = request.getParameter("input-pass");

        try {
            // Mã hóa mật khẩu bằng thuật toán SHA-256 với muối
            String passHash = EncodePassword.encodeSha256(pass);

            // Kiểm tra đăng nhập
            User acc = dao.checkLogin(user, passHash); // Sử dụng mật khẩu đã được mã hóa

            // Xử lý cookies
            String rememberMe = request.getParameter("rememberMe");
            Cookie username = new Cookie("username", user);
            Cookie password = new Cookie("password", pass);
            Cookie remember = new Cookie("rememberMe", rememberMe != null ? "true" : "false");

            // Thiết lập thời gian sống cho cookies
            if (Boolean.parseBoolean(rememberMe)) {
                username.setMaxAge(2592000); // 30 ngày
                password.setMaxAge(2592000); // 30 ngày
                remember.setMaxAge(2592000); // 30 ngày
            } else {
                username.setMaxAge(0); // Xóa cookie
                password.setMaxAge(0); // Xóa cookie
                remember.setMaxAge(0); // Xóa cookie
            }

            response.addCookie(username);
            response.addCookie(password);
            response.addCookie(remember);

            if (acc != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", acc);
                // Redirect đến trang Dashboard hoặc Sale tùy thuộc vào role của người dùng
                response.sendRedirect(acc.getRoleID().getId() == 0 ? 
                        request.getContextPath() + "/View/Admin/AdminDashBoarl.jsp" 
                        : request.getContextPath() +"/View/Staff/Staff.jsp");
            } else {
                request.setAttribute("message", "Account information or password is incorrect!");
                request.getRequestDispatcher(request.getContextPath() + "/View/Login.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException ex) {
            // Xử lý ngoại lệ nếu có lỗi trong quá trình mã hóa mật khẩu
            ex.printStackTrace();
            request.setAttribute("message", "An error occurred while encoding the password.");
            request.getRequestDispatcher(request.getContextPath() + "/View/Login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
