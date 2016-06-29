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
public class add_client extends HttpServlet {
String name,email,phone,category_id,staff_id,amount;
        String message;
        int count=0,requiredCost=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            dbConn conn = new dbConn();
            
            name=request.getParameter("name");
            email=request.getParameter("email");
            phone=request.getParameter("phone");
            category_id=request.getParameter("category_id");
            staff_id=request.getParameter("staff_id");
            amount=request.getParameter("amount");
            
            
            String getCost="SELECT amount FROM installation_fee WHERE id='"+category_id+"'";
            conn.rs=conn.st.executeQuery(getCost);
            if(conn.rs.next()){
                requiredCost=conn.rs.getInt(1);
            }
            
            
            if(requiredCost==Integer.parseInt(amount)){
            String checker="SELECT count(id) FROM clients WHERE email=? OR phone=? OR name=?";
            conn.pst=conn.conn.prepareStatement(checker);
            conn.pst.setString(1, email);
            conn.pst.setString(2, phone);
            conn.pst.setString(3, name);
            conn.rs=conn.pst.executeQuery();
            if(conn.rs.next()){
//              user exist
                message="Client details already exist.";
            }
            else{
//                add as a new client
                
                String inserter="INSERT INTO clients (name,email,phone,category_id,staff_id) VALUES (?,?,?,?,?)";
                conn.pst=conn.conn.prepareStatement(inserter);
                conn.pst.setString(1, name);
                conn.pst.setString(2, email);
                conn.pst.setString(3, phone);
                conn.pst.setString(4, category_id);
                conn.pst.setString(5, staff_id);
                
                conn.pst.executeUpdate();
                
                String getID="SELECT id FROM clients WHERE email=?";
                conn.pst1=conn.conn.prepareStatement(getID);
                conn.pst1.setString(1, email);
                conn.rs1=conn.pst1.executeQuery();
                if(conn.rs1.next()){
                  String id=conn.rs1.getString(1);
                  
//                  update installation fee
                  String addInstallation="INSERT INTO installation_fee (client_id,amount) VALUES(?,?)";
                  conn.pst2=conn.conn.prepareStatement(addInstallation);
                  conn.pst2.setString(1, id);
                  conn.pst2.setString(2, amount);
                  conn.pst2.executeUpdate();
                  
                  message="Client added successfully.";
                }
            }
            }
            else{
                message="Client did not pay the amount required for installation.";
            }
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
        Logger.getLogger(add_client.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(add_client.class.getName()).log(Level.SEVERE, null, ex);
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
