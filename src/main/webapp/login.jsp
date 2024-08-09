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
    <title>Login page..</title>
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

<h3 style="text-align:center;margin-top:80px;margin-left:110px">Welcome to Employee Time Sheet <br> login page</h3>
<style type = 'text/css'>
body{
color:red;
background-color:black;
</style>

<div style="text-align:left; margin-top: 50px; margin-left:500px; ">
<div class="col-md-6">
<div class="alert alert-info">
              <form action="check.jsp">
                        <label>Enter Email ID : </label>
                        <input type="text" name="name" placeholder="name" class="form-control" required>
                        <label>Enter Password :  </label>
                        <input type="password" name="pass" placeholder="password" class="form-control" required> <br>                     
                        <input type="submit" value="Login" class="btn btn-info">
                   </form>
                </div>     
                </div>
                </div>
                
</body>       
</html>