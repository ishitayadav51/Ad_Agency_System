<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>tvnews.jsp</title>
</head>
<body>
<% 
String TvChannelcode=request.getParameter("TvChannelcode");
String name=request.getParameter("name");
String address=request.getParameter("address");
String mobileno =request.getParameter("mobileno");
String channeltype=request.getParameter("channeltype");
String language=request.getParameter("languagetype");
String rate =request.getParameter("rate");

Class.forName("com.mysql.cj.jdbc.Driver");
 java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help", "root", "Project123@");
 PreparedStatement ps =null;
ps=con.prepareStatement("insert into tv values(?,?,?,?,?,?,?)");
ps.setString(1,TvChannelcode);
ps.setString(2,name);
ps.setString(3,address);
ps.setString(4,mobileno);
ps.setString(5,channeltype);
ps.setString(6,language);
ps.setString(7,rate);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("customer.html");
}
%>
</body>
</html>