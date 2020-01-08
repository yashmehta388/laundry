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

<h1>My orders</h1>

<table border="1">
<h3>Oder_Clothes</h3>
<tr>
<td>OrderNo.</td>
<td>Service</td>
<td>Shirts</td>
<td>Tshirts</td>
<td>Jeans</td>
<td>Trousers</td>
<td>Sarees</td>
<td>Pickupdate</td>
<td>Pickuptime</td>
<td>Total_Amount</td>
</tr>
<%
String username=(String) session.getAttribute("username");

try{
	
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

Statement stmt =connection.createStatement();
String query1= "select mobno from register1 where name='"+username+"';";
ResultSet rs =stmt.executeQuery(query1);
if(rs.next()) {
	mobileno=rs.getString(1);
}


String sql ="select * from orderclothes1 where mobno='"+mobileno+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String id=  resultSet.getString("id");
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("service") %></td>
<td><%=resultSet.getString("shirts") %></td>
<td><%=resultSet.getString("tshirts") %></td>
<td><%=resultSet.getString("jeans") %></td>
<td><%=resultSet.getString("trousers") %></td>
<td><%=resultSet.getString("sarees") %></td>
<td><%=resultSet.getString("pickupdate") %></td>
<td><%=resultSet.getString("pickupt") %></td>
<td><%=resultSet.getString("totalamount") %></td>

<td><form action="edit.jsp">


<input type="submit" value="Edit">
</form></td>
<td><form action="delete_order" method="post">

<%
HttpSession ss=request.getSession();
session.setAttribute("deleteid",id);
session.setAttribute("category",1);

%>
<input type="submit" value="Cancel Order">
</form></td>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<h3>Order_Others</h3>
<table border="1">

<tr>
<td>OrderNo.</td>
<td>Service</td>
<td>Helmet</td>
<td>Shoes</td>
<td>Pickupdate</td>
<td>Pickuptime</td>
<td>Total_Amount</td>
</tr>
<%
String username1=(String) session.getAttribute("username");

try{
	
	
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

Statement stmt =connection.createStatement();
String query1= "select mobno from register1 where name='"+username1+"';";
ResultSet rs =stmt.executeQuery(query1);
if(rs.next()) {
	mobileno=rs.getString(1);
}


String sql ="select * from orderothers1 where mobno='"+mobileno+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
	String id=  resultSet.getString("id");
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("service") %></td>
<td><%=resultSet.getString("helmet") %></td>
<td><%=resultSet.getString("shoes") %></td>
<td><%=resultSet.getString("pickupdate") %></td>
<td><%=resultSet.getString("pickupt") %></td>
<td><%=resultSet.getString("totalamount") %></td>

<td><form action="edit.jsp">


<input type="submit" value="Edit">
</form></td>
<td><form action="delete_order" method="post">

<%
HttpSession ss=request.getSession();
session.setAttribute("deleteid",id);
session.setAttribute("category",2);

%>
<input type="submit" value="Cancel Order">
</form></td>


<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

    
</body>
</html>