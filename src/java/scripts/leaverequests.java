/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scripts;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import scripts.Login;

/**
 *
 * @author kimaiga
 */
public class leaverequests extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
                    //get form data
        String fullname = request.getParameter("employeename");
        String id = request.getParameter("requestid");
        String department = request.getParameter("department");
        String leavetype = request.getParameter("leavetype");
        String startdate = request.getParameter("startdate");
        String endate = request.getParameter("enddate");
        String reason = request.getParameter("reason");       
        //send form  data to db
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/leavemanager","root","303seminarian");
            String sql = "INSERT into requests VALUES('"+fullname+"', '"+id+"', '"+department+"','"+leavetype+"','"+startdate+"', '"+endate+"', '"+reason+"')" ;
            Statement st = conn.createStatement();
            //change type of Resultset to boolean-true of falses
            boolean rs;
            rs = st.execute(sql);
            request.setAttribute("employeename", fullname);
            request.setAttribute("requestid", id);
            request.setAttribute("department", department);
            request.setAttribute("leavetype", leavetype);
            request.setAttribute("startdate", startdate);
            request.setAttribute("enddate", endate);
            request.setAttribute("reason", reason);
            
            //forward data to next jsp page
            RequestDispatcher rd=request.getRequestDispatcher("applyfeedback.jsp");
            rd.forward(request, response);
            
            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(leaverequests.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(leaverequests.class.getName()).log(Level.SEVERE, null, ex);
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
