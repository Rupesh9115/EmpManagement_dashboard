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
    <title>update profile..</title>
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
<body>

<%
String id = request.getParameter("id"); 
session.setAttribute("Id",id);

try{
String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
String user = "root";
String pass = "55555";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection(url, user, pass);
PreparedStatement ps = c.prepareStatement("select * from empsheet where id=?");
ps.setString(1,id);
ResultSet rs = ps.executeQuery();
if(rs.next()){
%>
<style type = 'text/css'>
body{
color:red;
background-color:black;
</style>

<div style="text-align:left; margin-top: 100px;margin-left:400px ">
<div class="col-md-6">
<div class="alert alert-info">
<h4>--- Registration ---</h4><br>
              <form action="edited2.jsp">
                        <label>EmpName : </label> 
                        <input type="text" name="name" value="<%= rs.getString(2)%>" class="form-control" /> 
                        <label>Password :  </label> 
                        <input type="password" name="pass" value="<%= rs.getString(3)%>" class="form-control" /><br>                      
                        <input type="submit" value="update" class="btn btn-info">
                   </form>
                </div>     
                </div>
                </div>
                
<%
}
}catch(Exception e){
	System.out.print(e);
}
%>                

</body>
</html>