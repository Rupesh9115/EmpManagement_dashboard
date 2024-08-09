<%@page import="com.empsheet.Empbean"%>
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
<title>Insert title here</title>
</head>
<body>

<%
try{
String empNm = request.getParameter("name");
String password = request.getParameter("pass");

String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
String user = "root";
String pass = "55555";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection(url, user, pass);
PreparedStatement ps = c.prepareStatement("select * from empsheet where name=? and password=?");
ps.setString(1,empNm);
ps.setString(2,password);

ResultSet rs = ps.executeQuery();

if(rs.next()){
	
    Empbean bean = new Empbean();
	bean.setId(rs.getInt(1));
	bean.setEmpName(rs.getString(2));
	bean.setEmpPass(rs.getString(3));
	bean.setEmpRole(rs.getInt(4));
	bean.setManagerId(rs.getInt(5));
	
	session.setAttribute("emp",bean);
	
	if(rs.getString(4).equals("0")){	
	response.sendRedirect("adminhome.jsp");
	
	}else if(rs.getString(4).equals("1")){
	response.sendRedirect("managerhome.jsp");
		
}else if(rs.getString(4).equals("2")){
	response.sendRedirect("emphome.jsp");

}
}else{%>

<h2>User does't found</h2>

<%
}
}catch(Exception e){
	System.out.print(e);
}
%>

</body>
</html>