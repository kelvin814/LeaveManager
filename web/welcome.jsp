<%-- 
    Document   : welcome
    Created on : Feb 28, 2016, 4:03:05 PM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Welcome</title>
        <link rel="stylesheet" href="css/foundation.css"/>
        <link rel="stylesheet" href="css/app.css"/>
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">      
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--foundation icons-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--navbar-->
        <div class="container-fluid">
                    <h3 class="masthead-brand"><a href="">
                            <!--session initiate-->
                            <h5 id="welcomemessage">
                                <%
                                    String x = session.getAttribute("username").toString();
                                    out.println("You are logged in as " +x);
                                %>
                            </h5>
                        </a></h3>
                            <nav>
                                <ul class="nav masthead-nav">
                                    <li class="active"><a href="logout.jsp">Logout</a></li>
                                    <li><a href="">Buy</a></li>
                                    <li><a href="">Sell</a></li>
                                </ul>
                            </nav>
        </div>
    </body>
</html>
