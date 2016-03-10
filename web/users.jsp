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
        
                <!--form validation-->
        <script type="text/javascript">
            function validateForm(){
                var u = document.forms["loginForm"]["username"].value;
                var v = document.forms["loginForm"]["password"].value;
                var w = document.forms["loginForm"]["fullnames"].value;
                var x = document.forms["loginForm"]["department"].value;
                
                
                if (u == null || u == "") {
                    alert("Username must be filled out");
                    return false;
                }
                
                if (v==null || v == ""){
                    alert("Password must be filled out");
                    return false;
                }
                
                if (w==null || w ==""){
                    alert("Fullnames must be filled out");
                    return false;
                }
                
                if (x==null || x==""){
                    alert("Department must be filled out");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div class="large-7 large-centered columns">
            <div class="register-box">
                <div class="row">
                    <div class="large-12 columns">
                        <form action="employees" method="POST" name="loginForm" onsubmit="return validateForm()">
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
                                    <option value="default" selected disabled>Select Department</option>
                                    <option value="human resources">Human Resources</option>
                                    <option value="information technology">Information Technology</option>
                                    <option value="operations">Operations</option>
                                    <option value="accounts">Accounts</option>
                                    <option value="logistics">Logistics</option>
                                </select>
                            </fieldset>
                            <button type="submit" class="button secondary medium" value="Login" id="loginbtn">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        
    </body>
</html>
