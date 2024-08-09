<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String id = String.valueOf(session.getAttribute("taskID"));

int x = 0;
String projectName = request.getParameter("project");
String task = request.getParameter("task");
String description = request.getParameter("description");
String date = request.getParameter("date");
String rating = request.getParameter("rating");

try{
	String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
	String user = "root";
	String pass = "55555";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection(url, user, pass);

   PreparedStatement ps = c.prepareStatement("update task set projectName=?,task=?,description=?,date=?,rating=? where id=?");
	ps.setString(1,projectName);
	ps.setString(2,task);
	ps.setString(3,description);
	ps.setString(4,date);
	ps.setString(5,rating);
	ps.setString(6,id);
	x = ps.executeUpdate();
	if(x==1){
	response.sendRedirect("listEmployee.jsp");	
	}
}catch(Exception e){
	System.out.print(e);
}

%>

</body>
</html>