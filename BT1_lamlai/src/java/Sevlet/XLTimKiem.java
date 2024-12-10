/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Sevlet;

import data.CanBo;
import data.ConnectDB;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "XLTimKiem", urlPatterns = {"/XLTimKiem"})
public class XLTimKiem extends HttpServlet {

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
            out.println("<title>Servlet XLTimKiem</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XLTimKiem at " + request.getContextPath() + "</h1>");
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
        String MaCB = request.getParameter("macb");
        request.setAttribute("MaCB", MaCB);
        try {
            ArrayList<CanBo> listCB = new ArrayList<>();
            ConnectDB con = new ConnectDB();
            ResultSet rs = con.getData("select * from canbo where MaCB = " + "'" + MaCB + "'");
            while (rs.next()) {
                String MaCB1 = rs.getString("MaCB");
                String hoTen = rs.getString("hoTen");
                String GioiTinh = rs.getString("GioiTinh");
                double luong = rs.getDouble("luong");
                CanBo cb = new CanBo(MaCB1, hoTen, GioiTinh, luong);
                listCB.add(cb);
            }
            request.setAttribute("list_cb", listCB);
        } catch (Exception e) {
            System.err.println("Err: " + e.toString());
        }
        request.getRequestDispatcher("display.jsp").forward(request, response);
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
        processRequest(request, response);
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
