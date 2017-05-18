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
	response.setContentType("text/html;charset=UTF-8");

	   
	// Connect to Mongo DB	
	MongoClient mongo;
	mongo = new MongoClient("localhost", 27017);
			
	String Fid=request.getParameter("Fid");
	String Fsource=request.getParameter("Fsource");
	String Fdestination=request.getParameter("Fdestination");
	//String Fdep=request.getParameter("Fdep");
	//String Farrival=request.getParameter("Farrival");
	String Ftype=request.getParameter("Ftype");
	//float Fcost_E=Float.parseFloat(request.getParameter("Fcost_E");
	//float Fcost_B=Float.parseFloat(request.getParameter("Fcost_B");
	//int Fcapacity=Integer.parseInt(request.getParameter("Fcapacity");
	
	String UserID= request.getParameter("UserID");
	
	//int UserAge = Integer.parseInt(request.getParameter("UserAge"));
	//String UserGender = request.getParameter("UserGender");
	//String UserOccupation = request.getParameter("UserOccupation");
	
	int ReviewRating = Integer.parseInt(request.getParameter("ReviewRating"));
	String ReviewDate = request.getParameter("ReviewDate");
	String ReviewText = request.getParameter("ReviewText");
		    
	int count=0;
		    
	MongoDbDataStoreUtilities.storeReview(Fid,Fsource,Fdestination,Ftype,UserID,ReviewRating,ReviewDate,ReviewText);
		
		
	//pageContent = "<table>"+tableData+"</table>"+"<h1>"+count+"</h1>";
	out.println("<div id='body'>");
	            
	out.println("<section id='content'>");
    out.println("<article>");
	
	out.println("<h2>Document inserted successfully</h2>");	
			
}
            
catch (Exception e)
{
	System.out.println(""+e);

}    
	out.println("<form action='AddReview.jsp'><input type='submit' value='Review Page'></form>");

%>



<%@include file="footer.jsp"%>

 </div>

</body>
</html>

