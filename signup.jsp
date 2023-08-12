<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>customer.jsp</title>
</head>
<body>
<% 
String username=request.getParameter("username");
String mobileno =request.getParameter("mobileno");
String email=request.getParameter("email");
String password=request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver");
 java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help", "root", "Project123@");
 PreparedStatement ps =null;
ps=con.prepareStatement("insert into sig values(?,?,?,?)");
ps.setString(1,username);
ps.setString(2,mobileno);
ps.setString(3,email);
ps.setString(4,password);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("frame.html");
}
%>
</body>
</html>