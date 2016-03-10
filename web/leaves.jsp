<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Leaves Approve</title>
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
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
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
        <div class="row">
            <div class="large-6 large-centered columns" id="leavesoption">
                <form id="requestsform" action="approve.jsp" method="POST">
                    <select name="leaves">
                        <option value="default" selected disabled>View Requests</option>
                        <%
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection conn = DriverManager.getConnection( "jdbc:mysql://127.0.01:3306/leavemanager","root","303seminarian"); 
                            String query = "select name, type FROM requests"; 
                            Statement st = conn.createStatement(); 
                            ResultSet rs = st.executeQuery(query);
                            while(rs.next())
                            {%>
                            <option value="<%=rs.getString("name")%>"><%=rs.getString("name")+" "+ rs.getString("type")%></option>
                            <%}
                            %>                           
                    </select>
                    <button class="button success" type="submit" onclick="parent.location='Login.java'">Approve Request <i class="fi-check"></i></button>
                    <hr>
                    <button class="button danger" type="submit"> Decline Request <i class="fi-trash"></i></button>
                </form>
            </div>
        </div>    
        <script src="js/foundation.js"></script>
    </body>
</html>
