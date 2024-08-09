<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Manager.list..</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
     <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>

</head>
<style>
 table, th, td {
  border:1px solid black;
  border-collapse: collapse;
}
</style>

<body>

<% 
try{
	
int SNo = 1;	
String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
String user = "root";
String pass = "55555";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection(url, user, pass);
PreparedStatement ps = c.prepareStatement("select * from empsheet where empRole=1");
ResultSet rs = ps.executeQuery();
   
  %>
  
<style type = 'text/css'>
body{
color:red;
</style>

   <div class="col-md-12">
   <div class="panel panel-default">
                           <div class="panel-heading">
                               Striped Rows Table
                           </div>
                           <div class="panel-body">
                               <div class="table-responsive">
                                   <table class="table table-striped">
                                       <thead>
                                           <tr>                                        
                                               <th>S.No</th>
                                               <th>Name</th>
                                               <th>Password</th>
                                               <th>Role</th>
                                               <th>ManagerId</th>
                                               <th>action</th>                                                                                           
                                                                                         </tr>
                                       </thead>
                                         
                                       <% while(rs.next()){%>        
                                                             
                                       <tbody>
                                           <tr>
                                               <td><%=SNo%></td>
                                               <td><%=rs.getString(2)%></td>
                                               <td><%=rs.getString(3)%></td>
                                               <td><%=rs.getInt(4)%></td>
                                               <td><%=rs.getInt(5)%></td>
                                               <td><a href="edit.jsp?id=<%=rs.getInt(1)%>">Edit </a> | <a href="delete.jsp?id=<%=rs.getInt(1)%>"> Delete</a></td>
                                           </tr><%
                                           
                                           SNo++;
                                           }
                                           }catch(Exception e){
                                        	   System.out.print(e);
                                           } %>
                                           
                                       
                                       </tbody>
                                   </table>
                               </div>
                           </div>
                       </div>
                     </div>

</body>
</html>