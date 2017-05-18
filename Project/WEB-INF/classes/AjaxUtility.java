
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import java.util.*;
import java.sql.* ;
import java.math.* ;


public class AjaxUtility 
{
	//getData() function used to get the products from database and store in hashmap 
	public static HashMap<String,Product> getData()
	{ 
		HashMap<String,Product> hm=new HashMap<String,Product>();
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB" ,"root","root");

			Statement stmt=conn.createStatement();

			String selectProdList="select * from flight_info"; 
			ResultSet rs = stmt.executeQuery(selectProdList); 
			while(rs.next())
			{
				Product p = new Product(rs.getString("Fsource"), rs.getString("Fsource")); 
				hm.put(rs.getString("Fsource"), p);
			} 
		}
		catch(Exception e){}
		return hm;
	}

	public StringBuffer readdata(String searchId) 
	{
		StringBuffer sb =new StringBuffer();
		HashMap<String,Product> data; 
		data=getData();
		Iterator it = data.entrySet().iterator(); 
		while (it.hasNext())
		{
			Map.Entry pi = (Map.Entry)it.next();
			Product p=(Product)pi.getValue();
			if (p.getName().toLowerCase().startsWith(searchId)) 
			{
				sb.append("<product>");
				sb.append("<productName>" + p.getName() + "</productName >"); 
				sb.append("</product >");
			} 
		}
		return sb; 
	}
}