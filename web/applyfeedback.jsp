<%-- 
    Document   : applyfeedback
    Created on : Mar 15, 2016, 9:32:59 AM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Feedback</title>
        <link rel="stylesheet" href="css/foundation.css"/>
        <link rel="stylesheet" href="css/app.css"/>
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">      
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--foundation icons-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="top-bar">
            <div class="top-bar-right">
                <ul class="dropdown menu" data-dropdown-menu>
                    <li class="menu-text">Leave Manager</li>
                    <li><a href="logout.jsp">Logout</a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                </ul>
            </div>
            <div class="top-bar-right">
            </div>
                
        </div>
        <div class="container">
            <div id="wrapper">
                
                    <%
                        //session attribute
                        String x = session.getAttribute("username").toString();
                        
                        String fullname = request.getAttribute("employeename").toString();
                        String id = request.getAttribute("requestid").toString();
                        String department = request.getAttribute("department").toString();
                        String leavetype = request.getAttribute("leavetype").toString();
                        String startdate = request.getAttribute("startdate").toString();
                        String endate = request.getAttribute("enddate").toString();
                        String reason = request.getAttribute("reason").toString();
                        
                        out.println("Dear " +x);
                        out.println("Your data has been recieved as follows: "  +fullname +id +department +leavetype +startdate +endate +reason);
                       
                    %>
                
            </div>
        </div>
    </body>
</html>
