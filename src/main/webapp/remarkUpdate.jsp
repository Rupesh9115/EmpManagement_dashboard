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
try{
int x=0;
// String id = String.valueOf(session.getAttribute("Id"));
String id = request.getParameter("id");

String remark = request.getParameter("remark");
System.out.println(id);
System.out.println(remark);

String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
String user = "root";
String pass = "55555";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection(url, user, pass);
PreparedStatement ps = c.prepareStatement("update task set remark=? where id=?");
ps.setString(1,remark);
ps.setString(2,id);
x = ps.executeUpdate();
if(x==1){
//	String Remark = request.getParameter("remark");
//    if(Remark!=null){
//    session.setAttribute("rmk",remark);
//    session.setAttribute("msg","task remarked");
    response.sendRedirect("emphome.jsp");
//    }
}
}catch(Exception e){
System.out.println(e);
}

%>
</body>
</html>