<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


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

String id = (String)session.getAttribute("Id");
String Name = request.getParameter("name");
String Password = request.getParameter("pass");

try{
	int x=0;
String url = "jdbc:mysql://localhost:3306/test";
String user = "root";
String pass = "55555";
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection c = DriverManager.getConnection(url,user,pass);
  PreparedStatement ps = c.prepareStatement("update empsheet set name=? , password=? where id=?");
  ps.setString(1,Name);
  ps.setString(2,Password);
  ps.setString(3,id);
  x = ps.executeUpdate();
   if(x==1){
	   response.sendRedirect("adminhome.jsp");
   }
}catch(Exception e){
	System.out.print(e);
}


%>


</body>
</html>