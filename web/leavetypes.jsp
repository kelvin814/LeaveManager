<%-- 
    Document   : leavetypes
    Created on : Mar 1, 2016, 1:53:47 PM
    Author     : kimaiga
--%>

<%@page import="scripts.Login"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Leave Types</title>
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
                var u = document.forms["leavesForm"]["leavetype"].value;
                
                if (u == null || u == "") {
                    alert("Leave Type Field must be filled out");
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
                        <form action="leavetypes" method="POST" name="leavesForm" onsubmit="return validateForm()">
                            <fieldset>
                                <label for="leave type">Add a Leave Type</label>
                                <input type="text" name="leavetype" autocomplete="off" placeholder="Leave Type">
                            </fieldset>
                            <button type="submit" class="button secondary medium" value="Save" id="savebtn">Save</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        
        
    </body>
</html>
