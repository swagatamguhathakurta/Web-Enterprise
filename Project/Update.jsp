<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Best Deal</title>
<link rel="stylesheet" href="styles.css" type="text/css" />

</head>
<body>
<div id="container">
<%@include file="header_user.jsp"%>

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
<%@ page import= "javax.xml.parsers.ParserConfigurationException"%>
<%@ page import= "javax.xml.parsers.SAXParser"%>
<%@ page import= "javax.xml.parsers.SAXParserFactory"%>
<%@ page import= "org.xml.sax.Attributes"%>
<%@ page import= "org.xml.sax.SAXException"%>
<%@ page import= "org.xml.sax.helpers.DefaultHandler"%>
<%@ page import= "bean.Order"%>
<%@ page import= "model.*"%>

<%


        String fid = request.getParameter("Fid");
        String bid = request.getParameter("Bid");
		
	response.setContentType("text/html");
        
	//String user = session.getAttribute("user").toString();
	//session.setAttribute("user",user);
%>
<%

    try {

    		out.println("<div id='body'>");
            out.println("<section id='content'>");
            out.println("<article>");           
            out.println("<h2>UPDATE DETAILS</h2>");
            out.println("<table border='1px'>");

            ArrayList<Order> orderList=MySqlDataStoreUtilities.bookdetail(bid);
            int size=orderList.size();
            int i=0;
            Order order=new Order();
            out.println("<h3>Booking ID: " + bid+"</h3>");
            out.println("<tr><td>Name</td>");
            out.println("<td>Age</td><td>Sex</td>");
           
            while (i<size)
            {
                order=orderList.get(i);
                 out.println("<form method='post' action='UpdateDetails.jsp'>");
                 out.println("<input type='hidden' name='bid' value='" + bid + "'>");
                 out.println("<input type='hidden' name='Num' value='" + order.getNum() + "'>");
                out.println("<tr><td><input type='text' name='name' value='"+ order.getName() +"'></td>");
                out.println("<td><input type='text' name='age' value='"+ order.getage() +"'></td>");
                out.println("<td><input type='text' name='sex' value='"+ order.getsex() +"'></td>");
                out.println("<td><input type='submit' value='Submit'></td></tr></form>"); 
                i=i+1;
            }
            
            out.println("<form method='post' action='OrderPage.jsp'>");
            out.println("<td><input type='submit' value='Back'></td></form>");  

            out.println("</table>");
            out.println("</article>");
            out.println("</section>");
        	out.println("</div>");

	}
	catch(Exception e) 
	{
		System.out.println("Exception");
	}
    %>

   <%@include file="footer.jsp"%>

   </div>

</body>
</html>