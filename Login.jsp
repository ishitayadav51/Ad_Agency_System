<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login.jsp</title>
</head>
<body>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
String checkbox=request.getParameter("checkbox");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/help","root","Project123@");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from log where username='"+username+"' and password='"+password+"' ");

if(rs.next()){
		 response.sendRedirect("frame.html");
}
else{
		 response.sendRedirect("login.html");
}

%>
</body>
</html>