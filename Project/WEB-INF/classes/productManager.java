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


public class productManager extends HttpServlet implements Serializable
{
	
	public static HashMap<String, Flight> flightdetail = new HashMap<String, Flight>();

	
	
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
				default:
					processRequest(request, response,request.getParameter("reqtype").toString());
					break;
			}
	}
	
	
	public void getProduct(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
					
		System.out.println("!~!!!!!!!! GET PRODUCT REACHED");
		String pid = request.getParameter("pid");
		Flight curr = flightdetail.get(pid);
		JSONObject jo = new JSONObject();
		
		jo.put("FlightId", curr.Fid);
		jo.put("Source", curr.Fsource);
		jo.put("Destination",curr.Fdestination);
		jo.put("Departure",curr.Fdep);
		jo.put("Arrival",curr.Farrival);
		jo.put("Type", curr.Ftype);
		jo.put("ECost", curr.Fcost_E);
		jo.put("BCost", curr.Fcost_B);
		jo.put("Capacity", curr.Fcapacity);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jo);
		//out.flush();
	}
	
	
	public void updateProduct(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		MySqlDataStoreUtilities.deleteFlight(request.getParameter("Fid"));		
		String Fid=request.getParameter("Fid");
		String Fsource=request.getParameter("Fsource");
		String Fdestination=request.getParameter("Fdestination");
		String Fdep=request.getParameter("Fdep");
		String Farrival=request.getParameter("Farrival");
		String Ftype=request.getParameter("Ftype");
		float FEcost=Float.valueOf(request.getParameter("FEcost"));
		float FBcost=Float.valueOf(request.getParameter("FBcost"));
		int Fcapacity=Integer.parseInt(request.getParameter("Fcapacity"));

		Flight newF = new Flight(Fid,Fsource,Fdestination,Fdep,Farrival,Ftype,FEcost,FBcost,Fcapacity);
		MySqlDataStoreUtilities.InsertFlight(newF);
		//MySqlDataStoreUtilities.InsertFlight(curr);
		
		response.sendRedirect("StoreManager.jsp");
	
	}
	
	
	
	 public void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	 {
		System.out.println(request.getParameter("pid"));
		//flightdetail.remove(request.getParameter("pid"));
		MySqlDataStoreUtilities.deleteFlight(request.getParameter("pid"));
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("success");
	 }
	
	 public void addProduct(HttpServletRequest request,HttpServletResponse response )throws ServletException, IOException 
	 {
		 
		 
		String Fid=request.getParameter("Fid");
		String Fsource=request.getParameter("Fsource");
		String Fdestination=request.getParameter("Fdestination");
		String Fdep=request.getParameter("Fdep");
		String Farrival=request.getParameter("Farrival");
		String Ftype=request.getParameter("Ftype");
		float FEcost=Float.valueOf(request.getParameter("FEcost"));
		float FBcost=Float.valueOf(request.getParameter("FBcost"));
		int Fcapacity=Integer.parseInt(request.getParameter("Fcapacity"));

		Flight newF = new Flight(Fid,Fsource,Fdestination,Fdep,Farrival,Ftype,FEcost,FBcost,Fcapacity);
		MySqlDataStoreUtilities.InsertFlight(newF);
		System.out.println("ADD PRODUCT REACHED");
		PrintWriter out = response.getWriter();
		out.println("success");
		response.sendRedirect("StoreManager.jsp");
	 }
	
	protected void processRequest(HttpServletRequest request,HttpServletResponse response , String reqtype)
    throws ServletException, IOException 
	{
		
		flightdetail=MySqlDataStoreUtilities.getallFlights();
		PrintWriter out = response.getWriter();		
		response.setContentType("text/html");
		//border=\"1\">
		out.println("<table border=\"1\" cellpadding=\"10\">");
			out.println("<b> <tr>");
			out.println("<td> Flight Id</td>");
			out.println("<td> Source</td>");
			out.println("<td> Destination</td>");
			out.println("<td> Departure</td>");
			out.println("<td> Arrival</td>");
			out.println("<td> Type</td>");
			out.println("<td> Eco_Cost</td>");
			out.println("<td> Buss_Cost</td>");
			out.println("<td> Capacity</td>");
			out.println("<td> Update/Delete</td> </b>");
		for (String key : flightdetail.keySet()) 
		{
			Flight curr_prod=  flightdetail.get(key);
			String id = key;
			

			out.println("<tr>");
			out.println("<td>"+curr_prod.Fid+ "</td>");
			out.println("<td>"+curr_prod.Fsource+ "</td>");
			out.println("<td>"+curr_prod.Fdestination+ "</td>");
			out.println("<td>"+curr_prod.Fdep+ "</td>");
			out.println("<td>"+curr_prod.Farrival+ "</td>");
			out.println("<td>"+curr_prod.Ftype+ "</td>");
			out.println("<td>"+curr_prod.Fcost_E+ "</td>");
			out.println("<td>"+curr_prod.Fcost_B+ "</td>");
			out.println("<td>"+curr_prod.Fcapacity+ "</td>");
		
			
			
			if("show_delete".equals(reqtype))
				out.println("<td>  <button id=\""+id+"\" class=\"delpbut\" onClick=\"deleteProduct(this.id)\">Delete Flight</button></td>");
			else
				out.println("<td>  <button id=\""+id+"\" class=\"updtpbut\" onClick=\"sequencer(this.id)\">Update Flight</button></td>");
				out.println("</tr>");
		}
		out.println("</table>");
	}
}