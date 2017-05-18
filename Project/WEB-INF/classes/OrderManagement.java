// Import required java libraries
package controller;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.ServletContext;
import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.io.Serializable;
import org.json.simple.JSONObject;

// Extend HttpServlet class

import java.io.File;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.SAXException;

import bean.*;
import model.*;


public class OrderManagement extends HttpServlet implements Serializable
{
	
	public static HashMap<String, Order> orderdetail = new HashMap<String, Order>();

	
	
	public void init() throws ServletException
	{
		
	}
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		processRequest(request, response, request.getParameter("reqtype").toString());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		String reqtype = request.getParameter("reqtype").toString();
		System.out.println("In do Post");
		switch(reqtype)
			{
				case "show_all":
				{
					processRequest(request,response,"");
					break;
				}
				
				case "update_product":
				{
					updateProduct(request,response);
					break;
				}
				
				case "delete_product":
				{
					deleteProduct(request,response);
					break;
				}
					
				
				case "add_product":
				{
					addProduct(request,response);
					break;
				}
				
			
				case "get_product":
				{
					getProduct(request,response);
					break;
				}
				case "get_BookingDetails":
				{
					getBookingDetails(request,response);
					break;
				}
				
				default:
					processRequest(request, response,request.getParameter("reqtype").toString());
					break;
			}
	}
	
	
	public void getProduct(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
					
		System.out.println("!~!!!!!!!! GET PRODUCT REACHED");
		String pid = request.getParameter("pid");
		Order order = orderdetail.get(pid);
		JSONObject jo = new JSONObject();
		
		jo.put("Fid", order.getFid());
		jo.put("Bid", order.getBid());
		jo.put("Uid", order.getUid());
		jo.put("Fsource", order.getFsource());
		jo.put("Fdestination",order.getFdestination());
		jo.put("Fdep",order.getFdep());
		jo.put("Farrival",order.getFarrival());
		jo.put("Ftype", order.getFtype());
		jo.put("Totcost", order.getTotcost());
		jo.put("Ddate", order.getDdate());
		jo.put("Rdate", order.getRdate());
		jo.put("Passengers", order.getPassengers());
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jo);
		//out.flush();
	}
	
	/*public void getPassenger(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		
		System.out.println("In getBooking");
		String pid = request.getParameter("pid");
		System.out.println(pid);
		ArrayList<Order> order = new ArrayList<Order>();
		order=MySqlDataStoreUtilities.bookdetail(pid);
		JSONObject jo = new JSONObject();
		
		System.out.println(order.get(0).getName());
		jo.put("Bid",pid);
		jo.put("PName", order.get(0).getName());
		jo.put("Age", order.get(0).getage());
		jo.put("Sex", order.get(0).getsex());
		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jo);
		//out.flush();
	}
	*/
	public void getBookingDetails(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HashMap<String, Order> allorders = new HashMap<String, Order>();
		String pid = request.getParameter("pid");
		allorders=MySqlDataStoreUtilities.getbookdetail(pid);
		
		PrintWriter out = response.getWriter();		
		response.setContentType("text/html");
		//border=\"1\">
		out.println("<h3> Booking ID -"+pid+"</h3>");
		out.println("<table border=\"1\" cellpadding=\"10\">");
			out.println("<b> <tr>");
			out.println("<td> S.No</td>");
			out.println("<td> Passenger Name </td>");
			out.println("<td> Age </td>");
			out.println("<td> Gender </td></tr>");
		for (String key : allorders.keySet()) 
		{
			Order ord=  allorders.get(key);
			String id = key;
			
			out.println("<tr>");
			out.println("<td>"+ord.getNum()+ "</td>");
			out.println("<td>"+ord.getName()+ "</td>");
			out.println("<td>"+ord.getage()+ "</td>");
			out.println("<td>"+ord.getsex()+ "</td>");

				out.println("</tr>");
		}
		out.println("</table>");
		out.println("<button id=\"Continue2\" class=\"updtpbut\" onClick=\"sequencer2(this.id)\">Continue</button>");
		
	}
	
	public void updateProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		MySqlDataStoreUtilities.deleteOrder(request.getParameter("Bid"));		
		
		Order order= new Order();
		String Bid=request.getParameter("Bid");
		String Fid=request.getParameter("Fid");
		String Uid=request.getParameter("Uid");
		String Fsource=request.getParameter("Fsource");
		String Fdestination=request.getParameter("Fdestination");
		String Fdep=request.getParameter("Fdep");
		String Farrival=request.getParameter("Farrival");
		String Ftype=request.getParameter("Ftype");
		float Totcost=Float.parseFloat(request.getParameter("Totcost"));
		String Ddate=request.getParameter("Ddate");
		String Rdate=request.getParameter("Rdate");
		Integer Passengers=Integer.parseInt(request.getParameter("Passengers"));

		order.setFtype(Ftype);
		order.setUid(Uid);
		order.setFid(Fid);
		order.setBid(Bid);
		order.setFsource(Fsource);
		order.setFdestination(Fdestination);
		order.setFdep(Fdep);
		order.setFarrival(Farrival);
		order.setTotcost(Totcost);
		order.setPassengers(Passengers);
		order.setDdate(Ddate);
		order.setRdate(Rdate);
		
		MySqlDataStoreUtilities.InsertOrder(order);
		
		response.sendRedirect("OrderManagement.jsp");
	
	}
	
	
	
	 public void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	 {
		System.out.println(request.getParameter("pid"));
		//flightdetail.remove(request.getParameter("pid"));
		MySqlDataStoreUtilities.deleteOrder(request.getParameter("pid"));
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("success");
	 }
	
	 public void addProduct(HttpServletRequest request,HttpServletResponse response )throws ServletException, IOException 
	 {
		Order order= new Order();
		String Bid=request.getParameter("Bid");
		String Fid=request.getParameter("Fid");
		String Uid=request.getParameter("Uid");
		String Fsource=request.getParameter("Fsource");
		String Fdestination=request.getParameter("Fdestination");
		String Fdep=request.getParameter("Fdep");
		String Farrival=request.getParameter("Farrival");
		String Ftype=request.getParameter("Ftype");
		float Totcost=Float.parseFloat(request.getParameter("Totcost"));
		String Ddate=request.getParameter("Ddate");
		String Rdate=request.getParameter("Rdate");
		Integer Passengers=Integer.parseInt(request.getParameter("Passengers"));

		order.setFtype(Ftype);
		order.setUid(Uid);
		order.setFid(Fid);
		order.setBid(Bid);
		order.setFsource(Fsource);
		order.setFdestination(Fdestination);
		order.setFdep(Fdep);
		order.setFarrival(Farrival);
		order.setTotcost(Totcost);
		order.setPassengers(Passengers);
		order.setDdate(Ddate);
		order.setRdate(Rdate);
		
		MySqlDataStoreUtilities.InsertOrder(order);
		System.out.println("ADD PRODUCT REACHED");
		PrintWriter out = response.getWriter();
		out.println("success");
		response.sendRedirect("OrderManagement.jsp");
	 }
	
	protected void processRequest(HttpServletRequest request,HttpServletResponse response , String reqtype)
    throws ServletException, IOException 
	{
		
		orderdetail=MySqlDataStoreUtilities.getallOrders();
		PrintWriter out = response.getWriter();		
		response.setContentType("text/html");
		//border=\"1\">
		out.println("<table border=\"1\" cellpadding=\"10\">");
			out.println("<b> <tr>");
			out.println("<td> Booking Id</td>");
			out.println("<td> Flight Id</td>");
			out.println("<td> Source</td>");
			out.println("<td> Destination</td>");
			out.println("<td> Departure</td>");
			out.println("<td> Arrival</td>");
			out.println("<td> Cost</td>");
			out.println("<td> Passengers</td>");
			out.println("<td> Ddate</td>");
			out.println("<td> Rdate</td>");
			out.println("<td> Update/Delete</td> </b>");
		for (String key : orderdetail.keySet()) 
		{
			Order ord=  orderdetail.get(key);
			String id = key;
			
			String userid=ord.getUid();
			String type=ord.getFtype();
			out.println("<tr>");
			out.println("<td> <a id=\""+id+"\" onClick=\"getBookingDetails(this.id)\">"+ord.getBid()+ "</a></td>");
			out.println("<td>"+ord.getFid()+ "</td>");
			out.println("<td>"+ord.getFsource()+ "</td>");
			out.println("<td>"+ord.getFdestination()+ "</td>");
			out.println("<td>"+ord.getFdep()+ "</td>");
			out.println("<td>"+ord.getFarrival()+ "</td>");
			out.println("<td>"+ord.getTotcost()+ "</td>");
			out.println("<td>"+ord.getPassengers()+ "</td>");
			out.println("<td>"+ord.getDdate()+ "</td>");
			out.println("<td>"+ord.getRdate()+ "</td>");

		
			
			
			if("show_delete".equals(reqtype))
				out.println("<td>  <button id=\""+id+"\" class=\"delpbut\" onClick=\"deleteProduct(this.id)\">Delete Order</button></td>");
			else
				out.println("<td>  <button id=\""+id+"\" class=\"updtpbut\" onClick=\"sequencer(this.id)\">Update Order</button></td>");
				out.println("</tr>");
		}
		out.println("</table>");
	}
}