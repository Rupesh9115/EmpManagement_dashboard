<%@page import="com.empsheet.Taskbean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%@page import="com.empsheet.Empbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title >Task.Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin:20px auto;
            
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #666666;
            width: 30%;
        }
        td {
            background-color: #f2f2f2;
            width: 70%;
        }
    </style>
    

</head>
<body>
<%

try{
Empbean users = (Empbean)session.getAttribute("emp");
int id = users.getId();
String url = "jdbc:mysql://localhost:3306/test?autoReconnect=true&useSSL=false";
String user = "root";
String pass = "55555";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection c = DriverManager.getConnection(url, user, pass);
PreparedStatement ps = c.prepareStatement("select * from task where empId=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();

%>

    
       <%
       boolean b = false;
       while(rs.next()){
    	   b = true;
    	       %>
    	       <table>
        <thead>
            <tr>
                <th colspan="2" style="color:#640303">Task Details</th>
            </tr>
        </thead> 
    	       
          <tbody>
            <tr>
                <th>Id</th>
                <td><%=rs.getInt(1)%></td>
            </tr>
            <tr>
                <th>Project Name</th>
                <td><%=rs.getString(2)%></td>
            </tr>
            <tr>
                <th>Task</th>
                <td><%=rs.getString(3)%></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><%=rs.getString(4)%></td>
            </tr>
            <tr>
                <th>Date</th>
                <td><%=rs.getString(5)%></td>
            </tr>
            <tr>
                <th>Remark</th>
                <td><%=rs.getString(6)%></td>
            </tr>
            <tr>
                <th>Rating</th>
                <td><%=rs.getInt(7)%></td>
            </tr>
            
            </tbody>
    </table>
            
         <%}
       if(!b){
    	   %>
           <h2> No Task Found!! </h2> <% }
       
}catch(Exception e){
        System.out.print(e);
        } %>
        
   
</body>
</html>