<%-- 
    Document   : doLogin
    Created on : Aug 2, 2016, 11:40:45 AM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" errorPage="" language="java"%>
<%@ include file="function.jsp"%>
<%
		    Connection conn=null;
//    conn=dbConn.getConnection();
    Class.forName("com.mysql.jdbc.Driver").newInstance();
      conn = DriverManager.getConnection("jdbc:mysql://localhost/leavemanager","root","303seminarian");
			
			ResultSet rsOptions = null;
			PreparedStatement psOptions=null;
			
			String sUserID=nullconv(request.getParameter("username"));
			String sPassword=nullconv(request.getParameter("password"));
			String message="User login done successfully";
			String loginYes="";
			
      	    String query = "SELECT * FROM employees WHERE username='"+sUserID+"'and password ='"+sPassword+"'";
                Statement st = conn.createStatement(); 
                ResultSet rs = st.executeQuery(query);
                if (rs.next()) {
                    session.setAttribute("username", rs.getString("username"));
                    response.sendRedirect("welcome.jsp");
                } else
			{
			  message="No user or password matched" ;
			  response.sendRedirect("index.jsp?error="+message);
			}
			
			try{
				 if(psOptions!=null){
					 psOptions.close();
				 }
				 if(rsOptions!=null){
					 rsOptions.close();
				 }
				 
				 if(conn!=null){
				  conn.close();
				 }
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>
