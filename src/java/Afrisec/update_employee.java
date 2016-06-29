/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Afrisec;

import Database.dbConn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Geofrey
 */
public class update_employee extends HttpServlet {
    String id,name,phone,email,staff_no,id_no,job_position;
String message="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            dbConn conn = new dbConn();
            
            id=request.getParameter("id");
            name=request.getParameter("name");
            phone=request.getParameter("phone");
            email=request.getParameter("email");
            staff_no=request.getParameter("staff_no");
            id_no=request.getParameter("id_no");
            job_position=request.getParameter("job_position");
            
            System.out.println("phone : "+phone);
            String checker="SELECT name FROM employee_details WHERE (phone=? OR email=? OR staff_no=? OR id_no=?) AND id!=?";
            conn.pst=conn.conn.prepareStatement(checker);
            conn.pst.setString(1, phone);
            conn.pst.setString(2, email);
            conn.pst.setString(3, staff_no);
            conn.pst.setString(4, id_no);
            conn.pst.setString(5, id);
            conn.rs=conn.pst.executeQuery();
            if(conn.rs.next()==true){
                message="Similar details exist for a user called <font color=\"red\">"+conn.rs.getString(1)+"</font>";
            }
            else{
//                update user details
                String updator="UPDATE employee_details SET name=?,phone=?,email=?,staff_no=?,id_no=?,position_id=? WHERE id=?";
                conn.pst=conn.conn.prepareStatement(updator);
                conn.pst.setString(1, name);
                conn.pst.setString(2, phone);
                conn.pst.setString(3, email);
                conn.pst.setString(4, staff_no);
                conn.pst.setString(5, id_no);
                conn.pst.setString(6, job_position);
                conn.pst.setString(7, id);
                
                conn.pst.executeUpdate();
             message=name+" details updated successfully.";   
            }
            System.out.println("message : "+message);
            out.println(message);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(update_employee.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(update_employee.class.getName()).log(Level.SEVERE, null, ex);
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
