<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.*" %>
<%@page import= "java.io.IOException" %>
<%@page import= "java.io.PrintWriter" %>
<%@page import= "java.sql.*" %>
<%@page import= "common.DB_Connection1" %>

<%@page import= "javax.servlet.ServletException" %>
<%@page import= "javax.servlet.annotation.WebServlet" %>
<%@page import= "javax.servlet.http.HttpServlet" %>
<%@page import= "javax.servlet.http.HttpServletRequest" %>
<%@page import= " javax.servlet.http.HttpServletResponse" %>
<%@page import= "javax.servlet.http.HttpSession" %>
<%@page import= "javax.swing.JOptionPane" %>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "db";
String userid = "root";
String password = "Root@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String mobileno="";

%>
<!DOCTYPE html>
<html>
<body>

<h1>Customer Orders</h1>
<table border="1">
<h3>Order_Clothes</h3>
<tr>
<td>Id</td>
<td>MobileNo</td>
<td>Service</td>
<td>Shirts</td>
<td>Tshirts</td>
<td>Jeans</td>
<td>Trousers</td>
<td>Sarees</td>
<td>Pickupdate</td>
<td>Pickuptime</td>
<td>City</td>
<td>Pincode</td>
<td>Address</td>
<td>Landmark</td>
<td>Total_Amount</td>
</tr>
<%
String username=(String) session.getAttribute("username");

try{
	
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();




String sql ="select * from orderclothes1;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("mobno") %></td>
<td><%=resultSet.getString("service") %></td>
<td><%=resultSet.getString("shirts") %></td>
<td><%=resultSet.getString("tshirts") %></td>
<td><%=resultSet.getString("jeans") %></td>
<td><%=resultSet.getString("trousers") %></td>
<td><%=resultSet.getString("sarees") %></td>
<td><%=resultSet.getString("pickupdate") %></td>
<td><%=resultSet.getString("pickupt") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("pincode") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("landmark") %></td>
<td><%=resultSet.getString("totalamount") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</table>
</body>
</html>