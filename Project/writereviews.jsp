<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Blue Wings</title>
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
<%@ page import= "com.mongodb.MongoException"%>
<%@ page import= "com.mongodb.WriteConcern"%>
<%@ page import= "com.mongodb.DB"%>
<%@ page import= "com.mongodb.DBCollection"%>
<%@ page import= "com.mongodb.BasicDBObject"%>
<%@ page import= "com.mongodb.DBObject"%>
<%@ page import= "com.mongodb.DBCursor"%>
<%@ page import= "com.mongodb.ServerAddress"%>
<%@ page import= "com.mongodb.*"%>
<%@ page import= "bean.Order"%>
<%@ page import= "model.*"%>


<%	
	

	try
	{
		
		
	//Connect to Mongo DB
		//MongoClient mongo = new MongoClient("localhost", 27017);
						
		// if database doesn't exists, MongoDB will create it for you
		//DB db = mongo.getDB("FlightReviews");
		
		//DBCollection myReviews = db.getCollection("myReviews");
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
			
			//response.setContentType("text/html");
			
			//PrintWriter out = response.getWriter();
			
			 
			
							
				//Fid=request.getParameter("Fid");
				//Fsource=request.getParameter("Fsource");
				//Fdestination=request.getParameter("Fdestination");
				//Fdep=request.getParameter("Fdep");
				//Farrival=request.getParameter("Farrival");
				//Ftype=request.getParameter("Ftype");
				//Fcost_E=Float.parseFloat(request.getParameter("Fcost_E");
				//Fcost_B=Float.parseFloat(request.getParameter("Fcost_B");
				//Fcapacity=Integer.parseInt(request.getParameter("Fcapacity"));
				
				
				out.println("<div id='body'>");
	            
				out.println("<section id='content'>");
	            out.println("<article>");
				
				out.println("<h1>Write Review</h1>");							
				//out.println(" <h3>" +FlightName+"</h3> ");
				out.println("<form method=\"get\" action=\"submitreviews.jsp\">");
				out.println("<table>");	

				out.println("<tr>");
				out.println("<td> User ID: </td>");
				out.println("<td> <input type=\"text\" name=\"UserID\" value = \""+userid+"\" readonly> </td>");
				out.println("</tr>");					
				
				out.println("<tr>");
				out.println("<td> Flight Name: </td>");
				out.println("<td> <input type=\"text\" name= \"Fid\">  </td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td> Flight Source: </td>");
				out.println("<td> <input type=\"text\" name= \"Fsource\">  </td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td> Flight Destination: </td>");
				out.println("<td> <input type=\"text\" name= \"Fdestination\">  </td>");
				
				out.println("<tr>");
				out.println("<td> Flight Type: </td>");
				out.println("<td> <input type=\"text\" name= \"Ftype\"> </td>");
				out.println("</tr>");

				out.println("<tr>");
				out.println("<td> Review Rating: </td>");
				out.println("<td>");
				out.println("<select name=\"ReviewRating\">");
				out.println("<option value=\"1\" selected>1</option>");
				out.println("<option value=\"2\">2</option>");
				out.println("<option value=\"3\">3</option>");
				out.println("<option value=\"4\">4</option>");
				out.println("<option value=\"5\">5</option>");
				out.println("</td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td> Review Date: </td>");
				out.println("<td> <input type=\"text\" name=\"ReviewDate\"> </td>");
				out.println("</tr>");
				
				out.println("<tr>");
				out.println("<td> Review Text: </td>");
				out.println("<td><textarea name=\"ReviewText\" rows=\"4\" cols=\"50\"> </textarea></td>");
				out.println("</tr>");
				out.println("</table>");
				
				out.println("<br><br>");
				out.println("<input type=\"submit\" value=\"Submit Review\">");

				out.println("</form>");
				out.println("<br><br>");
				out.println("<form action='AddReview.jsp'><input type='submit' value='Review Page'></form>");
				out.println("</article>");
	            out.println("</section>");
	            out.println("</div>");
	            
	           
							
	}

	catch (Exception e)
	{
		System.out.println(""+e);
		
	}    


%>

 <%@include file="footer.jsp"%>

 </div>

</body>
</html>
