<%-- 
    Document   : logincheck
    Created on : Feb 27, 2016, 6:08:59 PM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*,java.sql.ResultSet, java.sql.Statement;"%>
<%   
//java Code
Connection conn= null;
    String url = "jdbc:mysql://localhost/";
    String dbName = "leavemanager";
    String driver ="com.mysql.jdbc.Driver";
    String user = "root";
    String password = "";
    Statement st = null;
    ResultSet rs;
    try{
        Class.forName(driver);
        conn = DriverManager.getConnection(url+dbName,user,password);
        st = conn.createStatement();
    }catch(Exception exp){
        out.println("<h3>Cannot connect to the database,check network settings.</h3>");
    }
  //java code
String uname = request.getParameter("username");
String pass = request.getParameter("password");
//sql check
String sql = "SELECT * FROM users WHERE useraname = '"+uname+"' AND password = '"+pass+"'";
st.execute(sql);
rs=st.executeQuery(sql);
if((uname.equals("") && password.equals(""))) { 
     response.sendRedirect("error.jsp");
} else  
    session.setAttribute("username",uname); 
    response.sendRedirect("success.jsp");
%>