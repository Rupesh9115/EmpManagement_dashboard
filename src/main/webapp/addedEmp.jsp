<%@page import="java.sql.ResultSet"%>
<%@page import="com.empsheet.Empbean"%>
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
    	
    	String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
    	String user = "root";
    	String pass = "55555";
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection c = DriverManager.getConnection(url, user, pass);
    	
    	int x = 0;
//    	int m = 0;
Empbean users = (Empbean)session.getAttribute("emp");
int role = users.getEmpRole();
if(role==1){
	
PreparedStatement ps = c.prepareStatement("select count(managerId) from empsheet where managerId="+users.getId());
ResultSet rs = ps.executeQuery();
if(rs.next()){
 int p = rs.getInt(1);

	if(p<=2){
		
       String name = request.getParameter("name");
       String password = request.getParameter("pass");
       int n = users.getEmpRole() + 1;

    	ps = c.prepareStatement("insert into empsheet values(?,?,?,?,?)");
    	ps.setInt(1,0);
    	ps.setString(2,name);
    	ps.setString(3,password);
    	ps.setInt(4,n);
    	ps.setInt(5,users.getId());
    	x = ps.executeUpdate();
    	if(x==1){
    			
    			session.setAttribute("msg","successfully added");
    	    	response.sendRedirect("managerhome.jsp");

    	}
	}else{
    	session.setAttribute("msg", "manager can only add 3 employees ");
    	response.sendRedirect("registrationEmp.jsp");
    }
    }

    }else{
    	
    	String name = request.getParameter("name");
        String password = request.getParameter("pass");
        int n = users.getEmpRole() + 1;

        PreparedStatement ps = c.prepareStatement("insert into empsheet values(?,?,?,?,?)");
     	ps.setInt(1,0);
     	ps.setString(2,name);
     	ps.setString(3,password);
     	ps.setInt(4,n);
     	ps.setInt(5,users.getEmpRole());
     	x = ps.executeUpdate();
     	if(x==1){
     
     		
         if( users.getEmpRole()==0){	
     	session.setAttribute("msg","successfully added");
     	response.sendRedirect("adminhome.jsp");	
     	
     		}else{
     			
     			session.setAttribute("msg","successfully added");
     	    	response.sendRedirect("managerhome.jsp");
     		}
     	}
    	
    }
   }catch(Exception e){
	System.out.println(e);
    }
    %>

</body>
</html>