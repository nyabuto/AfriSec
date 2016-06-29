/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Loaders;

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
public class load_employee_details extends HttpServlet {

    String data;
    String id,name,phone,email,staff_no,id_no,job_position;
    String job_details="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
       dbConn conn = new dbConn();
       
       id=request.getParameter("id");
       
       job_details="<select id=\"job\" name=\"job\">";
          String getData="SELECT employee_details.id,employee_details.name,employee_details.phone,employee_details.email,"
                  + "employee_details.staff_no,employee_details.id_no,employee_details.position_id FROM employee_details "
                  + "WHERE id='"+id+"'";
          conn.rs=conn.st.executeQuery(getData);
          if(conn.rs.next()){
              id=conn.rs.getString(1);
           name=conn.rs.getString(2);
           phone=conn.rs.getString(3);
           email=conn.rs.getString(4);
           staff_no=conn.rs.getString(5);
           id_no=conn.rs.getString(6);
           job_position=conn.rs.getString(7);
           
           String getJob="SELECT id,name FROM job_positions";
           conn.rs1=conn.st1.executeQuery(getJob);
           while(conn.rs1.next()){
            if(job_position.equals(conn.rs1.getString(1))){
                job_details+="<option value=\""+conn.rs1.getString(1)+"\" selected>"+conn.rs1.getString(2)+"</option>";
            }
            else{
          job_details+="<option value=\""+conn.rs1.getString(1)+"\">"+conn.rs1.getString(2)+"</option>";      
            }
           }
           job_details+="</select>";
           
           data=name+"#@#"+phone+"#@#"+email+"#@#"+staff_no+"#@#"+id_no+"#@#"+job_details;
          }
            out.println(data);
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
            Logger.getLogger(load_employee_details.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(load_employee_details.class.getName()).log(Level.SEVERE, null, ex);
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
