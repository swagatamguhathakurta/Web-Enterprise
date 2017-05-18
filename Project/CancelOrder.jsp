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


        String Fid = request.getParameter("Fid");
        String Bid = request.getParameter("Bid");
        //Date date = request.getParameter("date");
        //Int ret = MySqlDataStoreUtilities.verifyDate(userid,name,date);

        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<div id='body'>");
            out.println("<section id='content'>");
            out.println("<article>");           
            out.println("<h2>Orders</h2>");
            out.println("<table border='1px'>");
            /*if(ret==0)
            {
                out.println("<h3>Already Delivered</h3>");   
            }
            else if(ret==1)
            {
                out.println("<h3>Cancelation date has crossed</h3>");   
            }
            else if(ret==2)
            {
                MySqlDataStoreUtilities.deleteOrder(userid,name,date);
                out.println("<h3>Order Successfully Deleted!</h3>");   
            }*/
            MySqlDataStoreUtilities.deleteOrder(Bid);
            out.println("<h3>Order Successfully Deleted!</h3>");   
            out.println("<table border='1px'>");
            ArrayList<Order> orderList=MySqlDataStoreUtilities.selectOrder(userid);
            int size=orderList.size();
            int i=0;
            Order order=new Order();
            out.println("<tr><td>Flight ID</td><td>Booking ID</td><td>Source</td>");
            out.println("<td>Destination</td><td>Departure ID</td><td>Arrival</td>");
            out.println("<td>Cost</td><td>No of Passengers ID</td><td>Date of Travel</td><td>Date of Return</td>");
            while (i<size)
            {
                order=orderList.get(i);
                out.println("<form method='post' action='CancelOrder.jsp'>");
                out.println("<input type='hidden' name='Bid' value='" + order.getBid() + "'>");
                
                out.println("<tr><td>" + order.getFid() + "</td><td>" + order.getBid() + "</td><td>" + order.getFsource() + "</td>");
                out.println("<td>" + order.getFdestination() + "</td><td>" + order.getFdep() + "</td><td>" + order.getFarrival() + "</td>");
                out.println("<td>" + order.getTotcost() + "</td><td>" + order.getPassengers() + "</td><td>" + order.getDdate() + "</td>");
                out.println("<td>" + order.getRdate() + "</td>");
                out.println("<td><input type='submit' value='Cancel'></td></form>"); 

                out.println("<form method='post' action='EditOrder.jsp'>");
                out.println("<input type='hidden' name='Fid' value='" + order.getFid() + "'>");
                out.println("<input type='hidden' name='Bid' value='" + order.getBid() + "'>");
                out.println("<td><input type='submit' value='Edit'></td></tr></form>");   
                i=i+1;
            }
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