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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Geofrey
 */
public class add_employee extends HttpServlet {

String name,phone,email,staff_no,id_no,job_id;
HttpSession session;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
       session=request.getSession();
       dbConn conn = new dbConn(); 
       
        name=request.getParameter("name");
        phone=request.getParameter("phone");
        email=request.getParameter("email");
        staff_no=request.getParameter("staff_no");
        id_no=request.getParameter("id_no");
        job_id=request.getParameter("job_position");
     
        
        String checker="SELECT id FROM employee_details WHERE staff_no=? OR id_no=? OR phone=? OR email=?";
        conn.pst=conn.conn.prepareStatement(checker);
        conn.pst.setString(1, staff_no);
        conn.pst.setString(2, id_no);
        conn.pst.setString(3, phone);
        conn.pst.setString(4, email);
        
        conn.rs=conn.pst.executeQuery();
        
        if(conn.rs.next()==true){
            session.setAttribute("add_employee", "<font color=\"red\">Error.</font> Similar details exist as one entered.");
        }
     
        else{
//           add as a new member 
            
        String inserter="INSERT INTO employee_details (name,phone,email,staff_no,id_no,position_id) VALUES(?,?,?,?,?,?)"; 
        conn.pst=conn.conn.prepareStatement(inserter);
        conn.pst.setString(1, name);
        conn.pst.setString(2, phone);
        conn.pst.setString(3, email);
        conn.pst.setString(4, staff_no);
        conn.pst.setString(5, id_no);
        conn.pst.setString(6, job_id);
            
        conn.pst.executeUpdate();
        
        session.setAttribute("add_employee", name+" added successfully.");
        }
        
        
        response.sendRedirect("add_employee.jsp");
    }

    
    
    
    
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(add_employee.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(add_employee.class.getName()).log(Level.SEVERE, null, ex);
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
