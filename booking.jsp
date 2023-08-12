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
String booking_no=request.getParameter("booking_no");
String customer_id=request.getParameter("customer_id");
String date=request.getParameter("date");
String mobile_no =request.getParameter("mobile_no");
String newspaper=request.getParameter("newspaper");
String tvchannel=request.getParameter("tvchannel");
String rate=request.getParameter("rate");
String total_amt=request.getParameter("total_amt");

Class.forName("com.mysql.cj.jdbc.Driver");
 java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help", "root", "Project123@");
 PreparedStatement ps =null;
ps=con.prepareStatement("insert into book values(?,?,?,?,?,?,?,?)");
ps.setString(1,booking_no);
ps.setString(2,customer_id);
ps.setString(3,date);
ps.setString(4,mobile_no);
ps.setString(5,newspaper);
ps.setString(6,tvchannel);
ps.setString(7,rate);
ps.setString(8,total_amt);

int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("pay.html");
}
%>
</body>
</html>