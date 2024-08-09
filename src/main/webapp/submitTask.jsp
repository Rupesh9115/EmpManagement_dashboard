<%@page import="com.empsheet.Empbean"%>
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
String id =  (String)session.getAttribute("Id");
session.setAttribute("Id",id);

Empbean users = (Empbean)session.getAttribute("emp");
int x = 0;
String projectName = request.getParameter("project");
String task = request.getParameter("task");
String description = request.getParameter("description");
String DOB = request.getParameter("date");
int rating = 0;
String remark = "false";


try{
	String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
	String user = "root";
	String pass = "55555";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection c = DriverManager.getConnection(url, user, pass);

   PreparedStatement ps = c.prepareStatement("insert into task values(?,?,?,?,?,?,?,?,?)");
	ps.setInt(1,0);
	ps.setString(2,projectName);
	ps.setString(3,task);
	ps.setString(4,description);
	ps.setString(5,DOB);
	ps.setString(6,remark);
	ps.setInt(7,rating);
	ps.setString(8,id);
	ps.setInt(9,users.getId());
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