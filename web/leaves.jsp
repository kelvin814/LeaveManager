<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
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
        <script src="js/vendor/jquery.min.js"></script>
        <!--reveal components-->
        <link rel="stylesheet" type="text/css" href="css/reveal.css">
        <script type="text/javascript" src="js/jquery.reveal.js"></script>
    </head>
    <body>
        <div class="large-8 large-centered columns" id="leavetable">
            <table id="leave-table" border=1 cellpadding=2 cellspacing=0 width=800>
                <tr bgcolor="#949494">
                    <th>Name</th>
                    <th>Leave Type</th>
                    <th>Leave ID</th>
                </tr>
                <tr>
                    <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            String url="jdbc:mysql://127.0.0.1/leavemanager";
                            String username="root";
                            String password="303seminarian";
                            String query="select * FROM `requests`";
                            Connection conn=DriverManager.getConnection(url,username,password);
                            Statement stmt=conn.createStatement();
                            ResultSet rs=stmt.executeQuery(query);
                            while(rs.next())
                            {
                    %>
                    <td><%=rs.getString("name")%></td>
                    <!--<td><%=rs.getString("type")%></td>-->
                    <td><%=rs.getString("leaveid")%></td>
                           <%}
                    %>
                </tr>
            </table>
                <%
                    rs.close();
                    stmt.close();
                    conn.close();}
catch(Exception e) {
e.printStackTrace();
}
%>
        </div>
    </body>
</html>
