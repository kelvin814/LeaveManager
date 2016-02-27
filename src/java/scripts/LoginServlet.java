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
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kimaiga
 */
public class LoginServlet extends HttpServlet {

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
            Connection conn= null;
            String url = "jdbc:mysql://localhost/";
            String dbName = "leavemanager";
            String driver ="com.mysql.jdbc.Driver";
            String username = "root";
            String password = "";
            Statement st = null;
            ResultSet rs;
            try{
                Class.forName(driver);
                conn = DriverManager.getConnection(url+dbName,username,password);
                st = conn.createStatement();
            }catch(Exception exp){
                out.println("<h3>Cannot connect to the database,check network settings.</h3>");
            }
            
    //get request parameters from input fields
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    

    //form validation
    if ("".equals(user) || "".equals(pass)){
        //redirect to error page
        response.sendRedirect("error.jsp");
    } else{
        //attempt to authenticate user
        try{
            String sql="SELECT * FROM users WHERE username='"+user+"'and password ='"+pass+"'";
            rs = st.executeQuery(sql);
            if (rs.next()) {
                response.sendRedirect("index.html");
                    //intiate session
                    HttpSession session = request.getSession(true);
                    session.setAttribute("username", user);
            } 
            else {
                response.sendRedirect("google.com");
                request.getRequestDispatcher("index.html").include(request, response);  
            }
        } catch (SQLException x){
            x.printStackTrace();
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
        processRequest(request, response);
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
