<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>booking.jsp</title>
</head>
<body>
<% 
String voucher_no=request.getParameter("voucher_no");
String customer_id=request.getParameter("customer_id");
String date=request.getParameter("date");
String payment_mode =request.getParameter("payment_mode");
String total_amt=request.getParameter("total_amt");
String status=request.getParameter("status");

Class.forName("com.mysql.cj.jdbc.Driver");
 java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help", "root", "Project123@");
 PreparedStatement ps =null;
ps=con.prepareStatement("insert into paay values(?,?,?,?,?,?)");
ps.setString(1,voucher_no);
ps.setString(2,customer_id);
ps.setString(3,date);
ps.setString(4,payment_mode);
ps.setString(5,total_amt);
ps.setString(6,status);
int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("thank you.html");
}
%>
</body>
</html>