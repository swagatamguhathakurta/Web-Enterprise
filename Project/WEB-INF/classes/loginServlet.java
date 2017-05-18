package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import bean.*;
import model.*;

public class loginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
      public static Boolean status_guest=false;
	 HashMap <String,CustomerDetails> customerdetails = new HashMap <String,CustomerDetails>() ;
	 
	 public loginServlet()
	 {
       
        
     }
	 
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
	processRequest(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
	processRequest(request, response);
	
	}
	 
		
		
		
	
	protected void processRequest(HttpServletRequest request, 
            HttpServletResponse response)
    throws ServletException, IOException 
	{
		
		String reqtype = request.getParameter("reqtype").toString();
		
		switch(reqtype)
			{
				case "login":
				{
					login(request,response);
					break;
				}
				
				case "Signup":
				{
					Signup(request,response);
					break;
				}
				
				default:
				{
					break;
				}
			}
			
	}
	
	public void login(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		customerdetails=MySqlDataStoreUtilities.getUsers();

		PrintWriter out = response.getWriter();		
		response.setContentType("text/html");
		System.out.println(request.getParameter("uname"));
		String temp1=request.getParameter("uname");
		String temp2=request.getParameter("psw");
		
		String username=temp1.trim();
		String password=temp2.trim();
		
			
		if(customerdetails.containsKey(username))
		{
			
			String pass=(customerdetails.get(username)).pass;
			if(pass.equals(password))
			{
				//createSeession --
				//session.user = userdetail.get(uname);
				HttpSession session = request.getSession();
				 session.setAttribute("uname", customerdetails.get(username).uname);
				 session.setAttribute("utype", (customerdetails.get(username)).utype);
			String name=String.valueOf(session.getAttribute("uname"));
			String type=(String)session.getAttribute("utype");
			switch(type)
			{
				case "STR_MGR":
				{
					response.sendRedirect("StoreManager.jsp");
					break;
				}
					
				case "CUST":
				{
					response.sendRedirect("Customer.jsp");
				
				}
				default:
				{
					
				}

			}
			}
		else{
			
			 String title = "Login Error";
				 String Error= "Login Error- Invalid Password ";
				 String docType =
				 "<!doctype html public \"-//w3c//dtd html 4.0 " +
				 "transitional//en\">\n";
				 out.println(docType +
				"<html>\n" +
				"<head><title>" + title + "</title></head>\n"+
				"<body bgcolor=\"#f0f0f0\">\n" +
				"<h1 align=\"center\">" + Error + "</h1>\n" +
				"<p><a href=\"index.jsp\">Try Login again </a>" + "</p>\n");
			}
		}
	else{
		
		 String title = "Login Error";
			 String Error= "Login Error- Invalid Username";
			 String docType =
			 "<!doctype html public \"-//w3c//dtd html 4.0 " +
			 "transitional//en\">\n";
			 out.println(docType +
			"<html>\n" +
			"<head><title>" + title + "</title></head>\n"+
			"<body bgcolor=\"#f0f0f0\">\n" +
			"<h1 align=\"center\">" + Error + "</h1>\n" +
			"<p><a href=\"login.html\">Try Login again </a>" + "</p>\n");
		
		}      	     
	}
	


public void Signup(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("In Registration");
		customerdetails=MySqlDataStoreUtilities.getUsers();
		
		String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
		String pass = request.getParameter("psw");
		String utype= request.getParameter("type");
		 
		if(uname != null && uname.length() != 0 && pass != null && pass.length() != 0) 
		{
			PrintWriter out = response.getWriter();		
			response.setContentType("text/html");
            
			if (customerdetails.containsKey(uname)) 
            {
            out.println("Username Already used");

			} 

            else 
            {
			System.out.println("In Registration-else");
			CustomerDetails user1=new CustomerDetails(fname,lname,email,uname,pass,utype);
			MySqlDataStoreUtilities.InsertUser(user1);
			response.sendRedirect("index.jsp");
				
		
			}	
		}
		}

}