package model;

import java.io.*;
import java.util.*;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import bean.CustomerDetails;
import bean.Flight;
import bean.Order;

public class MySqlDataStoreUtilities
{
	Connection conn = null;

	public static HashMap<String,Flight> getallFlights()
	{
		HashMap<String, Flight> FlightDetail = new HashMap<String, Flight>();
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		
		Statement stmt = conn.createStatement();
		String sql;
		sql = "SELECT Fid,Fsource,Fdestination,Fdep,Farrival,Ftype,Fcost_E,Fcost_B,Fcapacity FROM flight_info";
		ResultSet rs = stmt.executeQuery(sql);

		// Extract data from result set
		while(rs.next()){
		//Retrieve by column name
		String Fid = rs.getString("Fid");
		String Fsource = rs.getString("Fsource");
		String Fdestination = rs.getString("Fdestination");
		String Fdep = rs.getString("Fdep");
		String Farrival = rs.getString("Farrival");
		String Ftype = rs.getString("Ftype");
		float Fcost_E = Float.parseFloat(rs.getString("Fcost_E"));
		float Fcost_B = Float.parseFloat(rs.getString("Fcost_B"));
		int Fcapacity = Integer.parseInt(rs.getString("Fcapacity"));
		
		//String Fid, String Fsource, String Fdestination, String Fdep, String Farrival, String Ftype, float Fcost, int Fcapacity)
		
		Flight newFlight=new Flight(Fid,Fsource,Fdestination,Fdep,Farrival,Ftype,Fcost_E,Fcost_B,Fcapacity);
		FlightDetail.put(newFlight.Fid,newFlight);
		}
		rs.close();
        stmt.close();
        conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return FlightDetail;
	}
	
	public static void InsertFlight(Flight newFlight)
	{
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);	
		Statement stmt = conn.createStatement();
		String insertIntoCustomerRegisterQuery = "INSERT INTO flight_info(Fid,Fsource,Fdestination,Fdep,Farrival,Ftype,Fcost_E,Fcost_B,Fcapacity) "+ "VALUES (?,?,?,?,?,?,?,?,?);";
		//String fname,String lname,String email,String name,String Pass,String utype
		
		PreparedStatement pst =conn.prepareStatement(insertIntoCustomerRegisterQuery);
		pst.setString(1,newFlight.Fid);
		pst.setString(2,newFlight.Fsource);
		pst.setString(3,newFlight.Fdestination);
		pst.setString(4,newFlight.Fdep);
		pst.setString(5,newFlight.Farrival);
		pst.setString(6,newFlight.Ftype);
		pst.setString(7,String.valueOf(newFlight.Fcost_E));
		pst.setString(8,String.valueOf(newFlight.Fcost_B));
		pst.setString(9,String.valueOf(newFlight.Fcapacity));
		pst.execute();
	
        stmt.close();
        conn.close();
		}
		catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
	}
	
	public static void deleteFlight(String Flightid)
	{
		
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		String id=(String)Flightid;
		
		Statement stmt = conn.createStatement();
		String sql;
		sql = "DELETE FROM flight_info WHERE Fid=\""+id+"\";";
		//sql = "DELETE FROM products WHERE Pid="+pid+";";
		stmt.executeUpdate(sql);

        stmt.close();
        conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
	}
	
	public static HashMap<String,CustomerDetails> getUsers()
	{
		HashMap<String, CustomerDetails> userdetail = new HashMap<String, CustomerDetails>();
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		
		Statement stmt = conn.createStatement();
		String sql;
		sql = "SELECT Fname,Lname,email,uname,pass,u_type FROM user_details";
		ResultSet rs = stmt.executeQuery(sql);

		// Extract data from result set
		while(rs.next()){
		//Retrieve by column name
		String fname = rs.getString("Fname");
		String lname = rs.getString("Lname");
		String email = rs.getString("email");
		String name = rs.getString("uname");
		String pass = rs.getString("pass");
		String utype = rs.getString("u_type");
		System.out.println(fname);
		
		CustomerDetails user1=new CustomerDetails(fname,lname,email,name,pass,utype);
		userdetail.put(user1.uname,user1);
		}
		rs.close();
        stmt.close();
        conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return userdetail;
	}

	public static void InsertUser(CustomerDetails newuser)
	{
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);	
		Statement stmt = conn.createStatement();
		String insertIntoCustomerRegisterQuery = "INSERT INTO user_details(Fname,Lname,email,uname,pass,u_type) "+ "VALUES (?,?,?,?,?,?);";
		//String fname,String lname,String email,String name,String Pass,String utype
		
		PreparedStatement pst =conn.prepareStatement(insertIntoCustomerRegisterQuery);
		pst.setString(1,newuser.fname);
		pst.setString(2,newuser.lname);
		pst.setString(3,newuser.email);
		pst.setString(4,newuser.uname);
		pst.setString(5,newuser.pass);
		pst.setString(6,newuser.utype);
		pst.execute();
	
        stmt.close();
        conn.close();
		}
		catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
	}
	
	public static ArrayList<Flight> flightSearchOutbound(String from,String to,String depart,String ret,Integer count)
	
	{
		ArrayList<Flight> arr1 = new ArrayList<Flight>();
		try
		{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB","root","root");

		String sql = "select a.Fid,a.Fsource,a.Fdestination,b.Date,a.Fdep,a.Farrival,a.Ftype,a.Fcost_E,a.Fcost_B,(b.Capacity-b.Occupied) as Remaining from flight_info as a inner join flight_count as b on a.Fid = b.Fid where b.Date=? and a.Fsource=? and a.Fdestination=? and (b.Capacity-b.Occupied) >=?;";
		PreparedStatement pst = conn.prepareStatement(sql); 
		pst.setString(1,depart);
		pst.setString(2,from);
		pst.setString(3,to);
		pst.setInt(4,count);
		
		ResultSet rs = pst.executeQuery();

		// Extract data from result set
		while(rs.next()){
			//Retrieve by column name
			Flight f=new Flight();
			f.setFid(rs.getString(1));
			f.setFsource(rs.getString(2));
			f.setFdestination(rs.getString(3));
			f.setFdep(rs.getString(5));
			f.setFarrival(rs.getString(6));
            f.setFtype(rs.getString(7));
			f.setFcost_E(Float.parseFloat(rs.getString(8)));
			f.setFcost_B(Float.parseFloat(rs.getString(9)));
			f.setFcapacity(rs.getInt(10));
			arr1.add(f);

				}
			
	
		}
		
		catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return arr1;
	}

	public static ArrayList<Flight> flightSearchInbound(String from,String to,String depart,String ret,Integer count)
	
	{
		ArrayList<Flight> arr2 = new ArrayList<Flight>();
		try
		{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB","root","root");

		String sql = "select a.Fid,a.Fsource,a.Fdestination,b.Date,a.Fdep,a.Farrival,a.Ftype,a.Fcost_E,a.Fcost_B,(b.Capacity-b.Occupied) as Remaining from flight_info as a inner join flight_count as b on a.Fid = b.Fid where b.Date=? and a.Fsource=? and a.Fdestination=? and (b.Capacity-b.Occupied) >=?;";
		PreparedStatement pst = conn.prepareStatement(sql); 
		
		pst.setString(1,ret);
		pst.setString(2,to);
		pst.setString(3,from);
		pst.setInt(4,count);
		ResultSet rs = pst.executeQuery();

		// Extract data from result set
		while(rs.next()){
			//Retrieve by column name
			Flight f=new Flight();
			f.setFid(rs.getString(1));
			f.setFsource(rs.getString(2));
			f.setFdestination(rs.getString(3));
			f.setFdep(rs.getString(5));
			f.setFarrival(rs.getString(6));
            f.setFtype(rs.getString(7));
			f.setFcost_E(Float.parseFloat(rs.getString(8)));
			f.setFcost_B(Float.parseFloat(rs.getString(9)));
			f.setFcapacity(rs.getInt(10));
			arr2.add(f);

				}
			
	
		}
		
		catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return arr2;
	}
	
	public static ArrayList<Flight> selectFlight(String depart,String ret,String Fid1,String Fid2)
	
	{
		ArrayList<Flight> arr1 = new ArrayList<Flight>();
		try
		{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB","root","root");

		String sql = " select a.Fid,a.Fsource,a.Fdestination,b.Date,a.Fdep,a.Farrival,a.Ftype,a.Fcost_E,a.Fcost_B,(b.Capacity-b.Occupied) as Remaining from flight_info as a inner join flight_count as b on a.Fid = b.Fid where b.Date between ? and ? and a.Fid in (?,?);";
		PreparedStatement pst = conn.prepareStatement(sql); 
		pst.setString(1,depart);
		pst.setString(2,ret);
		pst.setString(3,Fid1);
		pst.setString(4,Fid2);
	
		
		ResultSet rs = pst.executeQuery();

		// Extract data from result set
		while(rs.next()){
			//Retrieve by column name
			Flight f=new Flight();
			f.setFid(rs.getString(1));
			f.setFsource(rs.getString(2));
			f.setFdestination(rs.getString(3));
			f.setFdep(rs.getString(5));
			f.setFarrival(rs.getString(6));
            f.setFtype(rs.getString(7));
			f.setFcost_E(Float.parseFloat(rs.getString(8)));
			f.setFcost_B(Float.parseFloat(rs.getString(9)));
			f.setFcapacity(rs.getInt(10));
			arr1.add(f);

				}
			
	
		}
		
		catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return arr1;
	}
	public static ArrayList<Flight> flightSearch(String from,String to,String depart,String ret,Integer count)
	
	{
		ArrayList<Flight> arr1 = new ArrayList<Flight>();
		try
		{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB","root","root");

		String sql = "select * from (select a.Fid,a.Fsource,a.Fdestination,b.Date,a.Fdep,a.Farrival,a.Ftype,a.Fcost_E,a.Fcost_B,(b.Capacity-b.Occupied) as Remaining from flight_info as a inner join flight_count as b where a.Fid = b.Fid) as t where t.Date=? and t.Fsource=? and t.Fdestination=? and t.Remaining >=? union select * from (select a.Fid,a.Fsource,a.Fdestination,b.Date,a.Fdep,a.Farrival,a.Ftype,a.Fcost_E,a.Fcost_B,(b.Capacity-b.Occupied) as Remaining  from flight_info as a inner join flight_count as b on a.Fid = b.Fid) as t where t.Date=? and t.Fsource=? and t.Fdestination=? and t.Remaining >=?;";
		PreparedStatement pst = conn.prepareStatement(sql); 
		pst.setString(1,depart);
		pst.setString(2,from);
		pst.setString(3,to);
		pst.setInt(4,count);
		pst.setString(5,ret);
		pst.setString(6,to);
		pst.setString(7,from);
		pst.setInt(8,count);
		ResultSet rs = pst.executeQuery();

		// Extract data from result set
		while(rs.next()){
			//Retrieve by column name
			Flight f=new Flight();
			f.setFid(rs.getString(1));
			f.setFsource(rs.getString(2));
			f.setFdestination(rs.getString(3));
			f.setFdep(rs.getString(5));
			f.setFarrival(rs.getString(6));
            f.setFtype(rs.getString(7));
			f.setFcost_E(Float.parseFloat(rs.getString(8)));
			f.setFcost_B(Float.parseFloat(rs.getString(9)));
			f.setFcapacity(rs.getInt(10));
			arr1.add(f);

				}
			
	
		}
		
		catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return arr1;
	}
	
	public static HashMap<String,Order> getallOrders()
	{
		HashMap<String, Order> orderDetail = new HashMap<String, Order>();
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		
		Statement stmt = conn.createStatement();
		String sql;
		sql = "select Fid,Bid,Fsource,Fdestination,Fdep,Farrival,Totcost,Passengers,Ddate,Rdate from order_detail";
		ResultSet rs = stmt.executeQuery(sql);

		// Extract data from result set
		while(rs.next()){
		//Retrieve by column name
		Order order= new Order();
		order.setFid(rs.getString("Fid"));
		order.setBid(rs.getString("Bid"));
		order.setFsource(rs.getString("Fsource"));
		order.setFdestination(rs.getString("Fdestination"));
		order.setFdep(rs.getString("Fdep"));
		order.setFarrival(rs.getString("Farrival"));
		order.setTotcost(rs.getFloat("Totcost"));
		order.setPassengers(rs.getInt("Passengers"));
		order.setDdate(rs.getString("Ddate"));
		order.setRdate(rs.getString("Rdate"));
		
		orderDetail.put(order.getBid(),order);
		}
		rs.close();
        stmt.close();
        conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return orderDetail;
	}
	
	public static void InsertOrder(Order order)
	{
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);	
		Statement stmt = conn.createStatement();
		String insertIntoCustomerRegisterQuery = "INSERT INTO order_detail(Bid,Fid,Uid,Fsource,Fdestination,Fdep,Farrival,Ftype,Totcost,Passengers,Ddate,Rdate) "+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
		//String fname,String lname,String email,String name,String Pass,String utype
		
		PreparedStatement pst =conn.prepareStatement(insertIntoCustomerRegisterQuery);
		pst.setString(1,String.valueOf(order.getBid()));
		pst.setString(2,String.valueOf(order.getFid()));
		pst.setString(3,String.valueOf(order.getUid()));
		pst.setString(4,String.valueOf(order.getFsource()));
		pst.setString(5,String.valueOf(order.getFdestination()));
		pst.setString(6,String.valueOf(order.getFdep()));
		pst.setString(7,String.valueOf(order.getFarrival()));
		pst.setString(8,order.getFtype());
		pst.setFloat(9,Float.valueOf(order.getTotcost()));
		pst.setString(10,String.valueOf(order.getPassengers()));
		pst.setString(11,String.valueOf(order.getDdate()));
		pst.setString(12,String.valueOf(order.getRdate()));
		pst.execute();
	
        stmt.close();
        conn.close();
		}
		catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
	}
	public static void InsertBooking(String id,String name,String age,String sex)
	{
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);	
		Statement stmt = conn.createStatement();
		String insertIntoCustomerRegisterQuery = "INSERT INTO booking_detail(Bid,Num,age,sex)"+ "VALUES (?,?,?,?);";
		//String fname,String lname,String email,String name,String Pass,String utype
		
		PreparedStatement pst =conn.prepareStatement(insertIntoCustomerRegisterQuery);
		pst.setString(1,id);
		pst.setString(2,name);
		pst.setString(3,age);
		pst.setString(4,sex);
		pst.execute();
	
        stmt.close();
        conn.close();
		}
		catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
	}
	
	public static ArrayList<Order> selectOrder(String userid) 
	{
		ArrayList<Order> orderList=new ArrayList<Order>(); 
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB" ,"root","root");

			String selectOrderQuery ="select Fid,Bid,Fsource,Fdestination,Fdep,Farrival,Totcost,Passengers,Ddate,Rdate from order_detail where Uid=?;"; 
			PreparedStatement pst = conn.prepareStatement(selectOrderQuery); 
			pst.setString(1,userid); 
			ResultSet rs = pst.executeQuery();

			
			while(rs.next()) 
			{
				Order order= new Order();
				order.setFid(rs.getString("Fid"));
				order.setBid(rs.getString("Bid"));
				order.setFsource(rs.getString("Fsource"));
				order.setFdestination(rs.getString("Fdestination"));
				order.setFdep(rs.getString("Fdep"));
				order.setFarrival(rs.getString("Farrival"));
				order.setTotcost(rs.getFloat("Totcost"));
				order.setPassengers(rs.getInt("Passengers"));
				order.setDdate(rs.getString("Ddate"));
	            order.setRdate(rs.getString("Rdate"));

				orderList.add(order);
		  	}
		}
		catch(Exception e){}
		return orderList;
	}

	public static void deleteOrder(String bid) 
	{
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB" ,"root","root");

			String deleteOrderQuery ="DELETE FROM order_detail WHERE Bid=?;"; 
			PreparedStatement pst = conn.prepareStatement(deleteOrderQuery); 
			pst.setString(1,bid); 
			pst.execute();

			String deleteOrderQuery1 ="DELETE FROM booking_detail WHERE Bid=?;"; 
			PreparedStatement pstt = conn.prepareStatement(deleteOrderQuery1); 
			pstt.setString(1,bid); 
			pstt.execute();
		}
		catch(Exception e){}
	}

	public static ArrayList<Order> bookdetail(String bid) 
	{
		ArrayList<Order> orderList=new ArrayList<Order>(); 
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB" ,"root","root");

			String selectOrderQuery ="select Num,Name,age,sex from booking_detail where Bid=?;"; 
			PreparedStatement pst = conn.prepareStatement(selectOrderQuery); 
			pst.setString(1,bid); 
			ResultSet rs = pst.executeQuery();

			
			while(rs.next()) 
			{
				Order order= new Order();
				order.setNum(rs.getInt("Num"));
				order.setName(rs.getString("Name"));
				order.setage(rs.getInt("age"));
				order.setsex(rs.getString("sex"));
				orderList.add(order);
		  	}
		}
		catch(Exception e){}
		return orderList;
	}
public static HashMap<String,Order> getbookdetail(String Bid)
	{
		HashMap<String, Order> orderdetail = new HashMap<String, Order>();
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		String id=Bid.trim();
		Statement stmt = conn.createStatement();
		String sql;
		sql = "SELECT Num,Name,age,sex FROM booking_detail where Bid=\""+id+"\"";
		//where Bid=\""+id+"\";"
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("Before Execution");
		// Extract data from result set
		while(rs.next()){
			System.out.println("Entered Loop so data ");
		System.out.println(rs.getString("Name"));
		//Retrieve by column name
		Order order= new Order();
		order.setNum(rs.getInt("Num"));
		order.setName(rs.getString("Name"));
		order.setage(rs.getInt("age"));
		order.setsex(rs.getString("sex"));
		
	
		orderdetail.put(order.getName(),order);
		}
		rs.close();
        stmt.close();
        conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return orderdetail;
	}
	/*public static HashMap<String,Order> getbookdetailofpassenger(String Bid,int num)
	{
		HashMap<String, Order> orderdetail = new HashMap<String, Order>();
		try
		{
		String JDBC_DRIVER="com.mysql.jdbc.Driver";  
		String DB_URL="jdbc:mysql://localhost:3306/BlueWings_DB";

      //  Database credentials
		String USER = "root";
		String PASS = "root";
		Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
        Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		
		String id=Bid.trim();
		int number=num;
		Statement stmt = conn.createStatement();
		String sql;
		sql = "SELECT Num,Name,age,sex FROM booking_detail where Bid=\""+id+"\" and Num=\""+number+"\"";
		//where Bid=\""+id+"\";"
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println("Before Execution");
		// Extract data from result set
		while(rs.next()){
			System.out.println("Entered Loop so data ");
		System.out.println(rs.getString("Name"));
		//Retrieve by column name
		Order order= new Order();
		order.setNum(rs.getInt("Num"));
		order.setName(rs.getString("Name"));
		order.setage(rs.getInt("age"));
		order.setsex(rs.getString("sex"));
		
	
		orderdetail.put(order.getName(),order);
		}
		rs.close();
        stmt.close();
        conn.close();
		}catch(SQLException se){
			//Handle errors for JDBC
			 se.printStackTrace();
		}catch(Exception e){
			 //Handle errors for Class.forName
			 e.printStackTrace();
		}
		return orderdetail;
	}
	*/
	public static void updatedetail(String bid,Integer Num,String name,Integer age,String sex)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB","root","root");

			String insertIntoCustomerRegisterQuery = "UPDATE booking_detail SET Name=?,age=?,sex=? WHERE Bid=? and Num=?;";

			PreparedStatement pst = conn.prepareStatement(insertIntoCustomerRegisterQuery);
			pst.setString(1,name); 
			pst.setInt(2,age); 
			pst.setString(3,sex);
			pst.setString(4,bid); 
			pst.setInt(5,Num); 
			pst.execute();
		}
		catch(Exception e){}
	}


		
	
	
	
}







