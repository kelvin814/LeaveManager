<%-- 
    Document   : apply
    Created on : Feb 28, 2016, 4:49:35 PM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Apply</title>
        <link rel="stylesheet" href="css/foundation.css"/>
        <link rel="stylesheet" href="css/app.css"/>
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">      
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--foundation icons-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="large-8 large-centered columns" id="applicationform">
            <h3 id="apply">Fill in the form to apply for Leave</h3> 
            <form action="" method="POST" name="ApplicationForm" onsubmit="" id="applicationform">
                <fieldset>
                    <label>Name of Employee</label>
                    <input type="text" placeholder="Employee Name" name="employeename" autocomplete="off">
                </fieldset>
                <fieldset>
                    <label>Department</label>
                        <select name="department">
                    
                        </select>
                </fieldset>
                <fieldset>
                    <label>Reason For Leave</label>
                    <select name="reason">
                    
                    </select>
                </fieldset>
                <fieldset>
                    <label>Desired Start Date</label>
                    <input type="date" name="date">
                </fieldset>
                <fieldset>
                    <label>Returned Date</label>
                    <input type="date" name="date">
                </fieldset>
                <fieldset>
                    <label>Request ID</label>
                    <input type="text" name="requestid" value='<%="LM"+(int)(Math.random()*10000)%>' readonly>
                </fieldset>
                <button type="submit" id="apply" class="button default">Submit</button>
            </form>    
    </body>
</html>
