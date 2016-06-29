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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Geofrey
 */
public class employee_table extends HttpServlet {
String data;
String id,name,phone,email,staff_no,id_no,job_position;
HttpSession session;
int position;
String blockMessage="";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            dbConn conn = new dbConn();
          session=request.getSession();
          
          data="<table id=\"dynamic-table\" class=\"table table-striped table-bordered table-hover\">"
                  + "<thead><tr>"
                  + "<th>No.</th>"
                 + "<th>Employee name</th>"
                  + "<th>Phone</th>"
                  + "<th>National ID</th>"
                  + "<th>Staff No.</th>"
                  + "<th>Email</th>"
                  + "<th>Job Description</th>"
                  + "<th>Edit</th>"
                  + "<th>Block</th>"
                  + "<th>Delete</th>"
                  
                  + "</tr>"
                  + "</thead><tbody>";
          
          
          position=0;
          String getData="SELECT employee_details.id,employee_details.name,employee_details.phone,employee_details.email,"
                  + "employee_details.staff_no,employee_details.id_no,job_positions.name,employee_details.status FROM employee_details JOIN job_positions "
                  + "ON employee_details.position_id=job_positions.id ORDER BY employee_details.name";
          conn.rs=conn.st.executeQuery(getData);
          while(conn.rs.next()){
           id=conn.rs.getString(1);
           name=conn.rs.getString(2);
           phone=conn.rs.getString(3);
           email=conn.rs.getString(4);
           staff_no=conn.rs.getString(5);
           id_no=conn.rs.getString(6);
           job_position=conn.rs.getString(7);
            
           if(conn.rs.getInt(8)==1){
             blockMessage="Block";  
           }
           else{
              blockMessage="Unblock";   
           }
           position++;
           data+="<tr>"
                   + "<td>"+position+"</td>"
                  + "<td>"+name+"</td>"
                   + "<td>"+phone+"</td>"
                   + "<td>"+id_no+"</td>"
                   + "<td>"+staff_no+"</td>"
                   + "<td>"+email+"</td>"
                   + "<td>"+job_position+"</td>"
                   
+ "<td>"
+ "<button onclick=\"return editor("+id+")\" class=\"btn btn-app btn-primary \" style=\"height:30px; padding-top:0px;\">" +
""+
"Edit" +
"</button></td>"
                   
+ "<td><button onclick=\"return blocker("+id+")\" class=\"btn btn-app btn-warning\" style=\"height:30px; padding-top:0px;\">" +
//"<i class=\"ace-icon fa fa-trash-o bigger-200\"></i>" +
                   
""+blockMessage+"" +
                   
"</button></td>"
                   
+ "<td><button onclick=\"return deleter("+id+")\" class=\"btn btn-app btn-danger\" style=\"height:30px; padding-top:0px;\">" +
//"<i class=\"ace-icon fa fa-trash-o bigger-200\"></i>" +
"Delete" +
"</button></td>"
+ "</tr>";
           
           
          }
         data+="</tbody>"
                 + "</table>";  
                  
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
        Logger.getLogger(employee_table.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(employee_table.class.getName()).log(Level.SEVERE, null, ex);
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
