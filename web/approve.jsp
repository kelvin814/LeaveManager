<%-- 
    Document   : approve
    Created on : Mar 9, 2016, 12:39:13 PM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="scripts.Login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.*"%>
<%
        String fullname = request.getParameter("name");
        String id = request.getParameter("requestid");
        String department = request.getParameter("department");
        String leavetype = request.getParameter("type");
        String startdate = request.getParameter("start");
        String endate = request.getParameter("end");
        String reason = request.getParameter("reason");
        String status = request.getParameter("status");
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/leavemanager","root","303seminarian");
        String sql = "INSERT into approved VALUES('"+fullname+"', '"+id+"', '"+department+"', '"+leavetype+"','"+startdate+"', '"+endate+"', '"+reason+"', '"+status+"')";
        Statement st = conn.createStatement();
       // change type of Resultset to boolean-true of falses
          boolean rs;
            rs = st.execute(sql);
            response.sendRedirect("feedback.jsp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Approve</title>
        <link rel="stylesheet" href="css/foundation.css"/>
        <link rel="stylesheet" href="css/app.css"/>
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">      
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--foundation icons-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
        <script src="js/vendor/jquery.min.js"></script>
        <!--reveal components-->
        <link rel="stylesheet" type="text/css" href="css/reveal.css">
        <script type="text/javascript" src="js/jquery.reveal.js"></script>
    </head>
    <body>
        <div class="top-bar">
            <div class="top-bar-right">
                <ul class="dropdown menu" data-dropdown-menu>
                    <li class="menu-text">Leave Manager</li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
            <div class="top-bar-right">
            </div>
        </div>
    <body>
        
    </body>
</html>
