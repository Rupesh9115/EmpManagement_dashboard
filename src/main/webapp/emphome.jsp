<%@page import="com.empsheet.Empbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type = 'text/css'>
body{
color:red;
background-color:#ffffff;
</style>

</head>
<body>
<%
String message = (String)session.getAttribute("msg");
if(message!=null){ 

	%> <h4 style="text-align: center;"><%=message%></h4> <%
			
	session.removeAttribute("msg");
}
	
	
	%>
	
<h2 style="text-align: center; margin-top: 200px;"><a href="myCurrentTask.jsp">My Task</a></h2>
<h2 style="text-align: center;"><a href="empAllTasks.jsp">All Task</a></h2>
<h4 style="text-align: center; margin-top: 10px;"><a href="logout.jsp">Logout</a></h4>
</body>
</html>