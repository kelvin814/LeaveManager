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
        <nav class="nav container">
          <div class="nav-center">
              <a class="toggle-nav" href="#">&#9776;</a>
              <div class="nav-mobile">
                <ul class="left">
                    <li><a href="#"></a></li>
                </ul>
                  <ul class="right">
                      <li>
                          <%
                              String x = session.getAttribute("username").toString();
                              out.println("You are logged in as " +x);
                          %>
                      </li>
                      <li>
                          <%
                              String y = session.getAttribute("username").toString();
                              
                          if (session.getAttribute("username").equals(y)){
                              out.println("<html><li><a href="foo.html">\"lol\";</a></li></html>");
                          }
                          %>
                      </li>
                  </ul>
              </div>
          </div>
        </nav>
        <br>
        <div class="container" id="bodycontent">
            <div class="row">
                <div class="large-8 large-centered columns">
                    <div class="row" id="dashboard">
                        <div class="">
                            <div class="large-12 columns" id="users">
                                <p><a href="apply.jsp">Apply for a Leave</a></p>
                                <p id="captiontext">Lodge a leave request to HR manager</p>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row" id="dashboard">
                        <div class="">
                            <div class="large-12 columns" id="users">
                                <p><a href="status.jsp">Check Leave Status</a></p>
                                <p id="captiontext"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
