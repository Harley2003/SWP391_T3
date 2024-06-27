/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sinan
 */
public class SetWorkSession extends HttpServlet {

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
            out.println("<title>Servlet SetWorkSession</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SetWorkSession at " + request.getContextPath() + "</h1>");
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

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public ScheduleDAO dao = new ScheduleDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String setSession = request.getParameter("setsessionon");
        String setSessionArray = request.getParameter("setsession");
        List<String> list = new ArrayList<>();
        if (setSessionArray != null) {
            if (!setSessionArray.contains(",")) {
                 int number = Integer.parseInt(setSessionArray.trim());
                 String name = dao.getWorkSessionByID(number).getWorkSessionName();
                 String startTime =dao.subTime(dao.getWorkSessionByID(number).getStart_time());
                 String endTime =dao.subTime(dao.getWorkSessionByID(number).getEnd_time());
                list.add(name+" "+startTime+"-"+endTime);
            } else {
                int size = setSessionArray.split(",").length;
                for (int i = 0; i < size; i++) {
                    int number = Integer.parseInt(setSessionArray.split(",")[i].trim());
                    String name = dao.getWorkSessionByID(number)
                            .getWorkSessionName();
                    String startTime =dao.subTime(dao.getWorkSessionByID(number).getStart_time());
                    String endTime = dao.subTime(dao.getWorkSessionByID(number).getEnd_time());
                    list.add(name+" "+startTime+"-"+endTime);
                
                }
            }
        }
        int size = list.size();
        for (int i = 0; i < size; i++) {
            System.out.println(list.get(i));
            response.getWriter().write(
                    "<div>" + list.get(i)
                            +"</div>"
                    );
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
