package CRUD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DB_Connection1;

/**
 * Servlet implementation class delete_order
 */
@WebServlet("/delete_order")
public class delete_order extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ss = request.getSession();
		String deleteid=(String) ss.getAttribute("deleteid");
		int category=(int) ss.getAttribute("category");
		
		DB_Connection1 obj_DB_Connection1=new DB_Connection1();
		Connection connection=obj_DB_Connection1.get_connection();
		PreparedStatement ps=null;
		
try {
			
			Statement stmt =connection.createStatement();
			if(category== 1)
			{
				String query1= "delete from orderclothes1 where id='"+deleteid+"';";
			
			ps=connection.prepareStatement(query1);
			}
			
			if(category== 2)
			{
				String query1= "delete from orderothers1 where id='"+deleteid+"';";
			
			ps=connection.prepareStatement(query1);
			}
			
			ps.executeUpdate();
			
	} catch (Exception e) {
		 System.err.println(e);
		}
		response.sendRedirect("Order.jsp");
		
	}

}
