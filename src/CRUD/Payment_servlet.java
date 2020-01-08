package CRUD;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import common.DB_Connection1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


@WebServlet("/Payment_servlet")
public class Payment_servlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if((session.getAttribute("washandfold")!=null)||(session.getAttribute("washandiron")!=null)||(session.getAttribute("iron")!=null)||(session.getAttribute("dryclean")!=null)){
		 String shirts=(String) session.getAttribute("shirts");
		 String tshirts=(String) session.getAttribute("tshirts");
		 String jeans=(String) session.getAttribute("jeans");
		 String trousers=(String) session.getAttribute("trousers");
		 String sarees=(String) session.getAttribute("sarees");
		 String totalamount=(String) session.getAttribute("totalamount");
		 String pickupdate=(String) session.getAttribute("pickupdate");
		 String pickupt=(String) session.getAttribute("pickupt");
		 String city=(String) session.getAttribute("city");
		 String pincode=(String) session.getAttribute("pincode");
		 String address=(String) session.getAttribute("address");
		 String landmark=(String) session.getAttribute("landmark");
         String username=(String) session.getAttribute("username");
		
		String service ="";
		if(session.getAttribute("washandfold")!=null)
		{
			service ="washandfold";
		}
		else if(session.getAttribute("washandiron")!=null)
		{
			service ="washandiron";
		}
		else if(session.getAttribute("iron")!=null)
		{
			service ="iron";
		}
		else if(session.getAttribute("dryclean")!=null)
		{
			service ="dryclean";
		}
		
		
		int id=0;
		
		DB_Connection1 obj_DB_Connection1=new DB_Connection1();
		Connection connection=obj_DB_Connection1.get_connection();
		PreparedStatement ps=null;
		String mobileno="";
		
		 
		try {
			
			Statement stmt =connection.createStatement();
			
			String query1= "select mobno from register1 where name='"+username+"';";
			
			ResultSet rs =stmt.executeQuery(query1);
			if(rs.next()) {
				mobileno=rs.getString(1);
			}
			String query="insert into orderclothes1 values('"+id+"','"+mobileno+"','"+service+"','"+shirts+"','"+tshirts+"','"+jeans+"','"+trousers+"','"+sarees+"','"+totalamount+"','"+pickupdate+"','"+pickupt+"','"+city+"','"+pincode+"','"+address+"','"+landmark+"');";
			 ps=connection.prepareStatement(query);
			 ps.executeUpdate();
	} catch (Exception e) {
		 System.err.println(e);
		}
		response.sendRedirect("home1.jsp");
		}
		else if(session.getAttribute("helmet")!=null) {
			String helmet=(String) session.getAttribute("chelmet");
			
			 String pickupdate=(String) session.getAttribute("pickupdate");
			 String pickupt=(String) session.getAttribute("pickupt");
			 String city=(String) session.getAttribute("city");
			 String pincode=(String) session.getAttribute("pincode");
			 String address=(String) session.getAttribute("address");
			 String landmark=(String) session.getAttribute("landmark");
	         String username=(String) session.getAttribute("username");
	         String totalamount=(String) session.getAttribute("totalamount");
	         String shoes=null;
			String service ="";
			if(session.getAttribute("helmet")!=null)
			{
				service ="cleaning";
			}
			
			int id=0;
			
			DB_Connection1 obj_DB_Connection1=new DB_Connection1();
			Connection connection=obj_DB_Connection1.get_connection();
			PreparedStatement ps=null;
			String mobileno="";
			
			 
			try {
				
				Statement stmt =connection.createStatement();
				
				String query1= "select mobno from register1 where name='"+username+"';";
				
				ResultSet rs =stmt.executeQuery(query1);
				if(rs.next()) {
					mobileno=rs.getString(1);
				}
				String query="insert into orderothers1 values('"+id+"','"+mobileno+"','"+service+"','"+helmet+"','"+shoes+"','"+pickupdate+"','"+pickupt+"','"+totalamount+"','"+city+"','"+pincode+"','"+address+"','"+landmark+"');";
				 ps=connection.prepareStatement(query);
				 ps.executeUpdate();
		} catch (Exception e) {
			 System.err.println(e);
			}
			response.sendRedirect("home1.jsp");
			
		}
		else if(session.getAttribute("shoes")!=null) {
			
			String shoes=(String) session.getAttribute("cshoes");
			 String pickupdate=(String) session.getAttribute("pickupdate");
			 String pickupt=(String) session.getAttribute("pickupt");
			 String city=(String) session.getAttribute("city");
			 String pincode=(String) session.getAttribute("pincode");
			 String address=(String) session.getAttribute("address");
			 String landmark=(String) session.getAttribute("landmark");
	         String username=(String) session.getAttribute("username");
	         String totalamount=(String) session.getAttribute("totalamount");
			String helmet=null;
			String service ="";
			if(session.getAttribute("shoes")!=null)
			{
				service ="cleaning";
			}
			
			int id=0;
			
			DB_Connection1 obj_DB_Connection1=new DB_Connection1();
			Connection connection=obj_DB_Connection1.get_connection();
			PreparedStatement ps=null;
			String mobileno="";
			
			 
			try {
				
				Statement stmt =connection.createStatement();
				
				String query1= "select mobno from register1 where name='"+username+"';";
				
				ResultSet rs =stmt.executeQuery(query1);
				if(rs.next()) {
					mobileno=rs.getString(1);
				}
				String query="insert into orderothers1 values('"+id+"','"+mobileno+"','"+service+"','"+helmet+"','"+shoes+"','"+pickupdate+"','"+pickupt+"','"+totalamount+"','"+city+"','"+pincode+"','"+address+"','"+landmark+"');";
				 ps=connection.prepareStatement(query);
				 ps.executeUpdate();
		} catch (Exception e) {
			 System.err.println(e);
			}
			response.sendRedirect("home1.jsp");
			
		}
	}

}
