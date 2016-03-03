<%-- 
    Document   : apply
    Created on : Feb 28, 2016, 4:49:35 PM
    Author     : kimaiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
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
        
  <!-- Form validation -->
  <script type="text/javascript">
      function MM_findObj(n, d) {
          var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
              d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
          if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
          for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
          if(!x && d.getElementById) x=d.getElementById(n); return x;
      }
      function MM_validateForm() {
          var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
          for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
              if (val) { nm=val.name; if ((val=val.value)!="") {
                      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
                          if (p<1 || p==(val.length-1)) errors+='- '+nm+' .\n';
      } else if (test!='R') { num = parseFloat(val);
          if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
          if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
              min=test.substring(8,p); max=test.substring(p+1);
              if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
          }
      }
  } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
  }
</script>
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
        <br>
        <div>
            <h5 id="welcomemessage" class="container">
                <%
                    String x = session.getAttribute("username").toString();
                    out.println(x);
                                %>
            </h5>
        </div>
        <div class="large-8 large-centered columns" id="applicationform">
            <h3 id="apply">Fill in the form to apply for Leave</h3> 
            <form action="leaverequests" method="POST" name="ApplicationForm" onsubmit="" id="applicationform">
                <fieldset>
                    <label class="labels">Name of Employee</label>
                    <input type="text" placeholder="Employee Name" name="employeename" autocomplete="off">
                </fieldset>
                <fieldset>
                    <label class="labels">Department</label>
                        <select name="department">
                            <option value="default" selected disabled>Select Department</option>
                            <% 
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/leavemanager","root","303seminarian");
                                String query = "select department FROM employees";
                                Statement st = conn.createStatement();
                                ResultSet rs = st.executeQuery(query);
                                while(rs.next()){
                            %>
                            <option value="<%=rs.getString("department")%>"><%=rs.getString("department")%></option>
                            <%}
                            %>
                        </select>
                </fieldset>
                <fieldset>
                    <label class="labels">Leave Type</label>
                    <select name="leavetype">
                        <option value="default" selected disabled>Select Leave Type</option>
                            <%
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                Connection conn2 = DriverManager.getConnection( "jdbc:mysql://localhost:3306/leavemanager","root","303seminarian");
                                String query2 = "select name FROM leavetypes";
                                Statement st2 = conn2.createStatement();
                                ResultSet rs2 = st2.executeQuery(query2);
                                while(rs2.next()){
                            %>
                        <option value="<%=rs2.getString("name")%>"><%=rs2.getString("name")%></option>
                            <%}
                            %>                        
                    </select>
                </fieldset>
                <fieldset>
                    <label class="labels">Desired Start Date</label>
                    <input type="date" name="startdate">
                </fieldset>
                <fieldset>
                    <label class="labels">Returned Date</label>
                    <input type="date" name="enddate">
                </fieldset>
                <fieldset>
                    <label class="labels">Request ID</label>
                    <input type="text" name="requestid" value='<%="LM"+(int)(Math.random()*10000)%>' readonly>
                </fieldset>
                <button type="submit" id="apply" class="button default" onclick="MM_validateForm('employeename','','R','department','','R', 'leavetype','','R', 'reason','','R', 'voter_id','','R', 'startdate','','R', 'enddate','','R', 'leavetype','','R', 'requestid','','R');return document.MM_returnValue">Submit</button>
            </form>
        </div>
                
        <script src="js/vendor/jquery.min.js"></script>
        <script src="js/vendor/what-input.min.js"></script>
        <script src="js/foundation.min.js"></script>
        <script src="js/app.js"></script>        
    </body>
</html>
