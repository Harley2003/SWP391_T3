/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Admin;

import DAL.UserDAO;
import Model.UserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date; 

/**
 *
 * @author ADMIN
 */
public class AddStaff extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UserDAO dao;
    public void init(){
        dao = new UserDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddStaff</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStaff at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.setAttribute("listRole", dao.getUserRole());
        request.getRequestDispatcher("View/Admin/AddStaff.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {  
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String fullName = firstName + " " + lastName; 
        String date = request.getParameter("date");  
        int gender = Integer.parseInt(request.getParameter("gender"));
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        int status = Integer.parseInt(request.getParameter("status"));
        int roleID = Integer.parseInt(request.getParameter("role"));   
        if(dao.addUser(username, password, status, roleID)){
            dao.addUserInfo(fullName, date, gender, phone, address, email); 
            request.setAttribute("message", "Thêm nhân viên mới thành công.");
        }
        else{ 
            request.setAttribute("message", "Có lỗi xảy ra, vui lòng thử lại.");
        }
        doGet(request, response);
    }  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
