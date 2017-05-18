package controller;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import bean.*;
import model.*;

public class performPayment extends HttpServlet
{
	Order order;
	HashMap<Integer, Order> orderplaced = new HashMap<Integer, Order>();

    
  
  public void init() throws ServletException
	{
		
	}
	

	
	protected void processRequest(HttpServletRequest request, 
            HttpServletResponse response)
    throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String userid = session.getAttribute("uname").toString();
		
		Random rand = new Random();
		int  orderno = rand.nextInt(1000) + 1;
		int orderno1=orderno;
		int orderno2=orderno+1;
		PrintWriter out = response.getWriter();		
		response.setContentType("text/html");
		String fid1=request.getParameter("fid1");
		//String Uid=request.getParameter("uname");
		String fid2=request.getParameter("fid2");
		String depart=request.getParameter("depart");//date
		String ret=request.getParameter("ret");//date
		String dep1=request.getParameter("fdep1");
		String arr1=request.getParameter("fdep2");
		String dep2=request.getParameter("farr1");
		String arr2=request.getParameter("farr2");
		String place1=request.getParameter("fsource");
		String place2=request.getParameter("fdest");
		
		int count=Integer.parseInt(request.getParameter("count"));
		float price1=Float.parseFloat(request.getParameter("price1"));
		float price2=Float.parseFloat(request.getParameter("price2"));
		float totalprice=Float.parseFloat(request.getParameter("totalprice"));
		int j=0;
		for( int i=0;i<count;i++)
		{
			j=i;
			String name=request.getParameter("Pname");
			j=j+10;
			String age=request.getParameter("Page");
			j=j+10;
			String sex=request.getParameter("Psex");
			MySqlDataStoreUtilities.InsertBooking(String.valueOf(orderno1),name,age,sex);
			MySqlDataStoreUtilities.InsertBooking(String.valueOf(orderno2),name,age,sex);

		}
		
		for(int i=0;i<2;i++)
		{
			int ordernumber=orderno+i;
			Order order= new Order();
			int Bid=orderno;
			String Fid1;		
			//userid=Uid;
			String Fsource,Fdestination;
			String Fdep,Farrival,source,destination;
			if(i==0)
			{
				Fid1=fid1;
				 Fdep=dep1;
				 Farrival=arr1;
				 source=place1;
				 destination=place2;
				 
			}
			else
			{
				source=place2;
				destination=place1;
				Fid1=fid2;
				Fdep=dep2;
				Farrival=arr2;
			}
			String Ftype="domestic";
			Float Totcost=totalprice;
			String Ddate=depart;
			String Rdate=ret;
			Integer Passengers=count;

			order.setFtype(Ftype);
			order.setUid(userid);
			order.setFid(Fid1);
			order.setBid(String.valueOf(Bid));
			order.setFsource(source);
			order.setFdestination(destination);
			order.setFdep(Fdep);
			order.setFarrival(Farrival);
			order.setTotcost(Totcost);
			order.setPassengers(Passengers);
			order.setDdate(Ddate);
			order.setRdate(Rdate);
			
			MySqlDataStoreUtilities.InsertOrder(order);
		}
		
		String title = "Order Confirmation";
		String message= "Successfully Placed an Order ";
		
		
		out.println("<html>");
		out.println("<head> <title>Order Confirmation</title> </head>");
		out.println("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
		out.println("<title>Airline-ticket-booking - Home</title>");
		out.println("<link rel='stylesheet' href='styles.css' type='text/css' />");

		out.println("</head>");
		out.println("<body>");
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

		out.println("<h1 align=\"center\">" + message + "</h1>\n");
		out.println("<h1> Your Order number is :"+ orderno + "</h1>");
		out.println("</br></br>");
		out.println("<a href=\"index.jsp\"> <button>Continue to Home</button> </a>");
		out.println("</body></html>");
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
	processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
	processRequest(request, response);
	}
	 
		
}