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
import java.sql.*;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kimaiga
 */
public class Login extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            //database connectivity
//            Connection conn= null;
//            String url = "jdbc:mysql://127.0.0.1:3306/leavemanager";
//            String dbName = "leavemanager";
//            String driver ="com.mysql.jdbc.Driver";
//            String username = "root";
//            String password = "303seminarian";
//            Statement st = null;
//            ResultSet rs;
//            try{
//	       Class.forName(driver);
//               conn = DriverManager.getConnection(url+dbName,username,password);
//               st = conn.createStatement();
//            }
//            catch(Exception exp)
//                    {
////                     JOptionPane.showMessageDialog(null, "Cannot connect to the database,check network settings.","ERROR",JOptionPane.ERROR_MESSAGE);
//                      
//	            }
            
    //get request parameters from input fields
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    

    //form validation

    if ("".equals(user) || "".equals(pass)){
        //redirect to error page
        response.sendRedirect("error.jsp");
    } else{
            try {
                //attempt to authenticate user
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/leavemanager","root","303seminarian");
                String query = "SELECT * FROM users WHERE username='"+user+"'and password ='"+pass+"'";
                Statement st = conn.createStatement(); 
                ResultSet rs = st.executeQuery(query);
                if (rs.next()) {
//intiate session and redirect user to success page
HttpSession session = request.getSession(true);
session.setAttribute("username", user);
response.sendRedirect("success.html");
                } 
                else {
                    response.sendRedirect("error.html");
                    request.getRequestDispatcher("index.html").include(request, response);  
                }
                
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstantiationException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
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
