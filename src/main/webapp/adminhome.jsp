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
    <title>Welcome Admin Home</title>
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
// Object role = session.getAttribute("role");
// Integer role2 = Integer.parseInt(role.toString());
// out.print(role2);
// session.setAttribute("role",role2);
 %>
 <style type = 'text/css'>
body{
color:red;
background-color:black;
</style>
 
<div style="text-align:center;margin-top: 150px; margin-left:400px;">
<div class="col-md-6" style="">
<div class="alert alert-info">

<h3><a href = "registrationEmp.jsp">add Manager</a></h3>

<h3> <a href = "listManager.jsp">Manager list</a> </h3>
 
 <a href = "logout.jsp">Logout</a><br>
 
 </div>
 </div>
 </div>

 
 <%
 String msg = (String)session.getAttribute("msg");
 if(msg!=null){
	 out.print(msg);
	 session.removeAttribute("msg");
 }
 
 %> 

</body>
</html>