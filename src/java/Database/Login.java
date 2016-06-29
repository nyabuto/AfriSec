/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Database;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
public class Login extends HttpServlet {
String username,password;
    HttpSession session;
    MessageDigest m;
    String nextPage="";
    String employee_module,client_module,management,reports,name,id,staff_no;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
      session = request.getSession();
       dbConn conn = new dbConn();
      nextPage="index.jsp";
              
     username=request.getParameter("username");
     String pass =request.getParameter("password");
     
      //encrypt password
            
                m = MessageDigest.getInstance("MD5");
                m.update(pass.getBytes(), 0, pass.length());
                password = new BigInteger(1, m.digest()).toString(16);
                
     employee_module=client_module=management=reports=name=id=staff_no="";
     String checkUser="SELECT job_positions.employee_module AS em,job_positions.client_module,job_positions.management,"
             + "job_positions.reports,employee_details.name,employee_details.id,employee_details.staff_no "
             + "FROM employee_details LEFT JOIN job_positions ON  employee_details.position_id=job_positions.id "
             + "LEFT JOIN users ON employee_details.id=users.id WHERE username=? AND password=?";

       conn.pst=conn.conn.prepareStatement(checkUser);
       conn.pst.setString(1, username);
       conn.pst.setString(2, password);
       
       conn.rs=conn.pst.executeQuery();
       if(conn.rs.next()==true){
         employee_module=conn.rs.getString(1);
         client_module=conn.rs.getString(2);
         management=conn.rs.getString(3);
         reports=conn.rs.getString(4);
         name=conn.rs.getString(5);
         id=conn.rs.getString(6);
         staff_no=conn.rs.getString(7);
           
         session.setAttribute("employee_module", employee_module);
         session.setAttribute("client_module", client_module);
         session.setAttribute("management", management);
         session.setAttribute("reports", reports);
         session.setAttribute("name", name);
         session.setAttribute("id", id);
         session.setAttribute("staff_no", staff_no);

         nextPage="mainPage.jsp";
       }
       
       response.sendRedirect(nextPage);
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
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    } catch (SQLException ex) {
        Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        try {
            processRequest(request, response);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    } catch (SQLException ex) {
        Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
