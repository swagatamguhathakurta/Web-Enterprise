<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airline-ticket-booking - Home</title>
<link rel="stylesheet" href="styles.css" type="text/css" />

</head>
<body>
<%          
            response.setContentType("text/html");
			String userid=String.valueOf(session.getAttribute("uname"));
            session.setAttribute("uname",userid);

if (!userid.equals("a")){ 

        out.println("<div id='header'>");																																																																													
		out.println("<a href='index.jsp' class='logo'><img src='images/logo.jpg' alt='' width='274' height='90' /></a>");																																								
	    out.println("<div class ='top'>");
        
		out.println("<span class ='account' id='account' style='float:right'><a>"+userid+"</a>|<a href='LogoutServlet.jsp'><button style='width:auto;'>Logout</button></a></span>");

		out.println("</div>");

			out.println("<ul id='menu'>");
			out.println("<li><a href='Customer.jsp'>Home</a></li>");
			out.println("<li><a href='Customer.jsp'>Flights & Deals</a></li>");
			out.println("<li><a href='OrderPage.jsp'>My Bookings</a></li>");
			out.println("<li><a href='AddReview.jsp'>Reviews</a></li>");
			out.println("<li><a href='Customer.jsp'>Contact us</a></li>");
		out.println("</ul>");
	out.println("</div>");
	}
	else{ %>
	<%@include file="header.jsp"%>
   <% } %>

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
			

			//out.println(count);
            ArrayList<Flight> arr1 = new ArrayList<Flight>();
			arr1=MySqlDataStoreUtilities.flightSearchOutbound(from,to,depart,ret,count);
			//MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			Iterator<Flight> iter1 = arr1.iterator();
			//flightdetail = MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			//out.println(depart);
			//out.println(flightdetail);
		   out.println("<br><font color='DarkBlue'><b>Select a flight for your outbound journey,"+from+" - "+to+"</font></b>"); 
		   out.println("<br><br>");
		%>
		<div><form action='postsearch.jsp'>
		<table border="1 px" align="center"><tr><td>
		
		
		
		<% while(iter1.hasNext())
             {
             
             Flight f1 = iter1.next();
            out.println("<table><tr>");
		    out.println("<input type='radio' name='select1' id = 'select1' value='"+f1.getFid()+"'>");
		    //out.println("<input type='hidden' name='fid1' value='"+f1.getFid()+"'>");
		    out.println("<input type='hidden' name='depart' value='"+depart+"'>");
			out.println("<td><b>Flight Id: </b>"+f1.getFid()+"</td>");
			out.println("<td><b>Source: </b>"+f1.getFsource()+ "</td>");
			out.println("<td><b>Dest: </b>"+f1.getFdestination()+ "</td>");
			out.println("<td><b>Date: </b>"+depart+"</td>");
			out.println("<td><b>Dept: </b>"+f1.getFdep()+ "</td>");
			out.println("<td><b>Arr: </b>"+f1.getFarrival()+ "</td>");
			out.println("<td><b>Type: </b>"+f1.getFtype()+ "</td>");
			out.println("<td><b>Economic Price: </b>"+f1.getFcost_E()+ "</td>");
			out.println("<td><b>Business Price: </b>"+f1.getFcost_B()+ "</td>");
			out.println("<td><b>Left: </b>"+f1.getFcapacity()+ "</td>");
			out.println("</tr></table>");
			
		}

		out.println("</td></tr>");
		out.println("</table>");
		

		ArrayList<Flight> arr2 = new ArrayList<Flight>();
			arr2=MySqlDataStoreUtilities.flightSearchInbound(from,to,depart,ret,count);
			//MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			Iterator<Flight> iter2 = arr2.iterator();
			//flightdetail = MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			//out.println(depart);
			//out.println(flightdetail);
		   out.println("<br><font color='DarkBlue'><b>Select a flight for your inbound journey,"+to+" - "+from+"</font></b>"); 
		   out.println("<br><br>");
		%>
		
		<table border="1 px" align="center"><tr><td>
		
		
		
		<% while(iter2.hasNext())
             {
             
             Flight f2 = iter2.next();
            out.println("<table><tr>");
		    out.println("<input type='radio' name='select2' id = 'select2' value='"+f2.getFid()+"'>");
		    //out.println("<input type='hidden' name='fid1' value='"+f2.getFid()+"'>");
		    out.println("<input type='hidden' name='ret' value='"+ret+"'>");
			out.println("<td><b>Flight Id: </b>"+f2.getFid()+"</td>");
			out.println("<td><b>Source: </b>"+f2.getFsource()+"</td>");
			out.println("<td><b>Dest: </b>"+f2.getFdestination()+"</td>");
			out.println("<td><b>Date: </b>"+ret+"</td>");
			out.println("<td><b>Dept: </b>"+f2.getFdep()+"</td>");
			out.println("<td><b>Arr: </b>"+f2.getFarrival()+"</td>");
			out.println("<td><b>Type: </b>"+f2.getFtype()+"</td>");
			out.println("<td><b>Economic Price: </b>"+f2.getFcost_E()+"</td>");
			out.println("<td><b>Business Price: </b>"+f2.getFcost_B()+"</td>");
			out.println("<td><b>Left: </b>"+f2.getFcapacity()+"</td>");
			out.println("</tr></table>");
			
		}

		out.println("</td></tr>");
		out.println("</table>");
		out.println("<br>");
		out.println("<input type='hidden' name='count' value='"+count+"'>");
		out.println("<p align='center'><input type='submit' value='Proceed'></p>");
		out.println("</form></div>");
		}
		catch(Exception e){}
%>
<%@include file="footer.jsp"%>
</body>
</html>