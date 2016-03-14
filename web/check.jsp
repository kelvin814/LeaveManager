<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%
String requestid = request.getParameter("leaveid");

                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/leavemanager","root","303seminarian");
                                String query = "select status FROM approved WHERE requestid = '"+request.getParameter("leaveid")+"'";
                                Statement st = conn.createStatement();
                                ResultSet rs = st.executeQuery(query);
                                while(rs.next()){                                
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Status</title>
        <link rel="stylesheet" href="css/foundation.css"/>
        <link rel="stylesheet" href="css/app.css"/>
        <link rel="stylesheet" type="text/css" href="css/foundation-icons.css">      
        <!--fonts-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <!--foundation icons-->
        <link href='https://cdnjs.cloudflare.com/ajax/libs/foundicons/3.0.0/foundation-icons.css' rel="stylesheet" type="text/css">
                    <!--form validation-->
        <script type="text/javascript">
            function validateForm(){
                var x = document.forms["StatusForm"]["leaveid"].value;
               
                if (x == null || x == "") {
                    alert("Leave ID must be filled out");
                    return false;
                }
                return true;
            }
        </script>
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
        <div class="row">
            <div class="large-6 large-centered columns" id="applicationform">
                <form name="StatusForm" onsubmit="return validateForm()>
                    <fieldset>
                        <label class="labels">Status Response</label>
                        <input type="text" name="leaveid" placeholder="Your Request ID" value="<%=rs.getString("status")%>" readonly>
                        <%}
                        %>
                        </fieldset>
                    </form>
                </div>
            </div>
    </body>
</html>
