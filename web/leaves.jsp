<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>View Leaves</title>
        <link rel="stylesheet" href="css/foundation.css"/>
        <link rel="stylesheet" href="css/app.css"/>
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">      
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--foundation icons-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
        <script src="js/vendor/jquery.min.js"></script>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
        <link href="css/jtable.css" rel="stylesheet" type="text/css">
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
        <div>
            <h5 id="welcomemessage" class="container">
                <%
                    String x = session.getAttribute("username").toString();
                    out.println(x);
                %>
            </h5>
        </div>
            <h5 id="requeststable">Leave Requests Lodged to you.</h5>
            <br>
        <div class="row">
            <div class="large-6 large-centered columns" id="leavesoption">
                <%
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/leavemanager","root","303seminarian");
                    Statement statement = connection.createStatement();
                    ResultSet resultset = statement.executeQuery("select * from requests");
                    while(resultset.next()){
                        
    %>
                <table class="stack">
                    <thead>
                        <tr>
                            <th width="100">Decision</th>
                            <th width="200">Name</th>
                            <th width="300">Department</th>
                            <th width="1000">Leave type</th>
                            <th width="1000">Start Date</th>
                            <th width="500">End Date</th>
                            <th width="900">Reason</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="pull-right icons">
                                    <a href="approve.jsp" title="Accept"><i class="fi-check"></i></a>
                                    &nbsp;
                                    <a href="reject.jsp" title="Reject"><i class="fi-trash"></i></a>
                                </div>
                            </td>
                            <td><%= resultset.getString(1) %></td>
                            <td><%= resultset.getString(2) %></td>
                            <td><%= resultset.getString(3) %></td>
                            <td><%= resultset.getString(4) %></td>
                            <td><%= resultset.getString(5) %></td>
                            <td><%= resultset.getString(6) %></td>
                        </tr>
                    </tbody>
                </table>
                <%}
                %>
            </div>
        </div>    
        <script src="js/foundation.js"></script>
    </body>
</html>
