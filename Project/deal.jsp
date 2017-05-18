<%@ page language="java" %>
<%@ page import="com.mongodb.*"%>
<%@ page import="java.net.UnknownHostException"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="connection.*"%>
<%@ page import="java.sql.Array"%>
<%@ page import="beans.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Airline-ticket-booking - Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<script src="myscript.js"></script>
	<div id="header">																																																																													
		<a href="index.jsp" class="logo"><img src="images/logo.jpg" alt="" width="274" height="90" /></a>																																								
	    <div class ="top">
         
			<span class ="account" id="account" style="float:right"><a><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button></a></span>

		</div>

		<ul id="menu">
		<li><a href="index.jsp">Home</a></li>
		<li><a href="deal.jsp">Flights & Deals</a></li>
		<li><a href="index.jsp">Contact us</a></li>
		</ul>
	</div>

	<div id="id01" class="modal">
  
	  	<form class="modal-content animate" action="${pageContext.request.contextPath}/loginServlet" method="post">
			<div class="imgcontainer">
		  		<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
		  		<p>Log in or Register</p>
			</div>

			<div class="container">
		  		<label><b>Username</b></label>
				<input type="text" placeholder="Enter Username" name="uname" required>
				<label><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="psw" required>
				<input type="hidden"  name="reqtype" value="login">
				<button type="submit">Login</button>
				<input type="checkbox" checked="checked"> Remember me
			</div>

			<div class="container" style="background-color:#f1f1f1">
		  		<button type="button" onclick="document.getElementById('id01').style.display='none'" class="">Cancel</button>
		  		<span class="psw">Forgot <a href="#">password?</a> | <a href="javascript:void(0)" onclick="todo()" >Register Here</a></span>
			</div>
	  	</form>
    </div>
    
    <div id="id02" class="modal">
  
	  	<form class="modal-content animate" action="loginServlet" method="post">
			<div class="imgcontainer">
			  	<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
			  	<p>Registration form</p>
			</div>

			<div class="container">
				<table>
				<tr><td>
				<label><b>First Name</b></label></td><td>
			  	<input type="text" placeholder="Enter First Name" name="fname" required></td></tr>
				<tr><td>
				<label><b>Last Name</b></label></td><td>
			  	<input type="text" placeholder="Enter Last Name" name="lname" required></td></tr>
				<tr><td>
				<label><b>Email</b></label></td><td>
			  	<input type="text" placeholder="Enter Email" name="email" required></td></tr>
				<tr><td>
				<label><b>Username</b></label></td><td>
				<input type="text" placeholder="Enter Username" name="uname" required></td></tr>
				<tr><td>
				<label><b>Password</b></label></td><td>
				<input type="password" placeholder="Enter Password" name="psw" required></td></tr>
				<tr><td>
				<label><b>Retype Password</b></label></td><td>
				<input type="password" placeholder="Retype Password" name="rpsw" required></td></tr>
				<tr><td>
				<label><b>UserType</b></label></td><td>
				<select name="type">
				<option value="CUST">Customer</option>
				<option value="STR_MGR">Admin</option>
				</select></td></tr>
				<input type="hidden"  name="reqtype" value="Signup">
				</table><br/>
			  	<button type="submit">Register</button>
			  
			</div>

			<div class="container" style="background-color:#f1f1f1">
			  	<button type="button" onclick="document.getElementById('id02').style.display='none'" class="">Cancel</button>
			  
			</div>
		</form>
    </div>

	<div id="wrapper">																																						
	  	<div id="center">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> 
			<div>
		<%
				File file = new File("/usr/local/apache-tomcat-7.0.70/webapps/Project-Phase2/DealMatches.txt");
				try
				{
					BufferedReader reader = new BufferedReader(new FileReader(file));
					String line = reader.readLine();
					List<String> lines = new ArrayList<String>();
					while (line != null) 
					{
					     lines.add(line);
					     line = reader.readLine();
					}
					int i=0;
					Connection con = null;
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/BlueWings_DB","root","root");
		
					Statement stmt2 = con.createStatement();
		
		
					String query2 = "Select * from flight_info";
					ResultSet rs1 = stmt2.executeQuery(query2);
		
		
					String fsource = null;
					
			
				
					if(lines.size()==0)
					{
			%>
						<h2>We beat our competitors in all aspects. Price-Match Guaranteed </h2>
						<h3>No Offers Found</h3><BR>
						<h2>Deal Matches</h2>
						<h3>No Deals Found</h3>

			<%		} 
					else 
					{
						String findhttp = null;

						Random r = new Random();
						String randomLine1 = lines.get(r.nextInt(lines.size()));

						String randomLine2 = lines.get(r.nextInt(lines.size()));

						while((randomLine1.equals(randomLine2))) 
						{
								randomLine2 = lines.get(r.nextInt(lines.size()));
						}

			%>
						<br><br><br>
						<td style="vertical-align: middle;">
				 		<h2 style="text-align: center;"><font color="black"><b>We beat our competitors in all aspects. Price-Match Guaranteed</b> </font> </h2>
				 		</td>
				 
 						<br>
						<h3><%=randomLine1%></h3><br>
						<h3><%=randomLine2%></h3><br>
						<td style="vertical-align: middle;">
 						<h2 style="text-align: center;"><font color="#000FFF"><b>Deal Matches</b> </font> </h2></td>
 						<center><table border="1px"><tr>
 						<td><h3>Source</h3></td>
						<td><h3>Destination</h3></td>
						<td><h3>Departure</h3></td>
						<td><h3>Arrival</h3></td>
						<td><h3>Type</h3></td>
						<td><h3>Economy</h3></td>
						<td><h3>Business</h3><br></td></tr>
 
 			<%

						String fdestination = "";
						String fdep = "";
						String farrival = "";
						String ftype = "";
						Integer fcost_E = 0;
						Integer fcost_B = 0;
 
						while(rs1.next())
						{
				
							 fsource = rs1.getString("Fsource");
							 fdestination = rs1.getString("Fdestination");
							 fdep = rs1.getString("Fdep");
							 farrival = rs1.getString("Farrival");
							 ftype = rs1.getString("Ftype");
							 fcost_E = rs1.getInt("Fcost_E");
							 fcost_B = rs1.getInt("Fcost_B");
							
	
							if(randomLine1.contains(fsource) || randomLine2.contains(fsource) )
							{
		
 			%>
 								<tr>
								<td><h3><%=fsource%></h3></td>
								<td><h3><%=fdestination%></h3></td>
								<td><h3><%=fdep%></h3></td>
								<td><h3><%=farrival%></h3></td>
								<td><h3><%=ftype%></h3></td>
								<td><h3><%=fcost_E%></h3></td>
								<td><h3><%=fcost_B%></h3><br></td></tr>
			<%
							}
						}

					}
				}

				catch(Exception e)
				{
					out.println(e);
				}
		
			%>
			</table></center>
			</div>
		</div>

		<div id="footer">																																							<ul>
			<li><a href="index.jsp">Home Page</a> |</li>
			<li><a href="index.jsp">Contact us</a></li>
			</ul>
			<p>Copyright &copy;. All rights reserved. Design by Team 3</a></p>																																																			
		</div>
	</div>
</body>
</html>
