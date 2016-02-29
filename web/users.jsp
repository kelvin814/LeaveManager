<%-- 
    Document   : users
    Created on : Feb 29, 2016, 3:34:30 PM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
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
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                </ul>
            </div>
            <div class="top-bar-right">
                
            </div>
                
        </div>
        <div class="large-8 large-centered columns">
            <div class="register-box">
                <div class="row">
                    <div class="large-12 columns">
                        <form action="" method="POST" name="loginForm">
                            <fieldset>
                                <label for="name">Assigned Username</label>
                                <input type="text" name="username" autocomplete="off" placeholder="Username">
                            </fieldset>
                            <fieldset>
                                <label>Assigned Password</label>
                                <input type="password" name="password" autocomplete="off" placeholder="Password">
                            </fieldset>
                            <fieldset>
                                <label>Employee Name</label>
                                <input type="text" name="fullnames" placeholder="Full Names">
                            </fieldset>
                            <fieldset>
                                <label>Department</label>
                                <select name="department">
                                    <option></option>
                                </select>
                            </fieldset>
                            <button type="submit" class="button secondary medium" value="Login" id="loginbtn">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        
    </body>
</html>
