<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airline-ticket-booking - Home</title>
<link rel="stylesheet" href="styles.css" type="text/css" />

</head>
<body>
<%@include file="header.jsp"%>
<div id="container">


<%@ page import= "java.io.*"%>
<%@ page import= "javax.servlet.ServletException"%>
<%@ page import= "javax.servlet.annotation.WebServlet"%>
<%@ page import= "javax.servlet.http.HttpServlet"%>
<%@ page import= "javax.servlet.http.HttpServletRequest"%>
<%@ page import= "javax.servlet.http.HttpServletResponse"%>
<%@ page import= "java.util.Arrays"%>
<%@ page import= "java.util.List"%>
<%@ page import= "java.util.Set"%>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.util.*"%>
<%@ page import= "javax.servlet.*"%>
<%@ page import= "javax.servlet.http.*"%>
<%@ page import= "bean.*"%>
<%@ page import= "model.*"%>


<%
	//HashMap<String, Flight> flightdetail = new HashMap<String, Flight>();
	try
		{
			String from=request.getParameter("from");	
			String to=request.getParameter("to");
			String depart=request.getParameter("depart");
			String ret =request.getParameter("return");	
			//String flex=request.getParameter("flex");
			Integer count = Integer.parseInt(request.getParameter("total"));
			//Flight f = new Flight (from, Password,UserType);
			response.setContentType("text/html");
			
			//out.println(count);
            ArrayList<Flight> arr1 = new ArrayList<Flight>();
			arr1=MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			//MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			Iterator<Flight> iter = arr1.iterator();
			//flightdetail = MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			//out.println(depart);
			//out.println(flightdetail);
		   // out.println(arr1); 
		%>
		<table border="1 px" align="center"><form action='BookTicket.jsp'>
		<tr><td>Flight Id</td><td>Source</td><td>Destination</td><td>Dept.</td><td>Arr.</td><td>Type</td><td>Price</td><td>Remaining</td></tr>
		<% while(iter.hasNext())
             {
             
             Flight f = iter.next();

			out.println("<tr>");
			out.println("<td>"+f.getFid()+ "</td>");
			out.println("<td>"+f.getFsource()+ "</td>");
			out.println("<td>"+f.getFdestination()+ "</td>");
			out.println("<td>"+f.getFdep()+ "</td>");
			out.println("<td>"+f.getFarrival()+ "</td>");
			out.println("<td>"+f.getFtype()+ "</td>");
			out.println("<td>"+f.getFcost()+ "</td>");
			out.println("<td>"+f.getFcapacity()+ "</td>");
			out.println("<td><input type='submit' value='Book Ticket'></td></form></tr>");
			
		}
		out.println("</table>");
		}
		catch(Exception e){}
%>
<%@include file="footer.jsp"%>
</body>
</html>