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
<%@ page import= "bean.ReviewClass"%>
<%@ page import= "model.*"%>


<%	

try
{
response.setContentType("text/html;charset=UTF-8");

out.println("<div id='body'>");
                   out.println("<section id='content'>");
                   out.println("<article>");
                   out.println("<table border='1px' >");

                   	out.println("<tr>");
			        out.println("<td>");
			        out.println("SI.No");
			        out.println("<td>");

			        out.println("<td>");
					out.println("Flight Name");
					out.println("</td>");

					out.println("<td>");
					out.println("Flight Source");
					out.println("</td>");

					out.println("<td>");
					out.println("Flight Destination");
					out.println("</td>");

					out.println("<td>");
					out.println("Flight type");
					out.println("</td>");

					out.println("<td>");
					out.println("User ID");
					out.println("</td>");

					out.println("<td>");
					out.println("Review Rating");
					out.println("</td>");

					out.println("<td>");
					out.println("Review Date");
					out.println("</td>");

					out.println("<td>");
					out.println("Review Text");
					out.println("</td>");

					out.println("<tr>");

   
	
MongoClient mongo;
  
   
	
      	// Connect to Mongo DB
		mongo = new MongoClient("localhost", 27017);
		int j=0;
		HashMap<String, ArrayList<ReviewClass>> reviews=(HashMap)MongoDbDataStoreUtilities.selectReview(); 	
			for (Map.Entry<String, ArrayList<ReviewClass>> entry : reviews.entrySet()) 
			 {    
            ArrayList<ReviewClass> list=entry.getValue();
			    
				for  (int i = 0; i < list.size(); i++) 
				{
			     System.out.println(list.get(i));
			   
                   ReviewClass rw=list.get(i);
                   
          
			        j=i+1;
			        out.println("<tr>");
			        out.println("<td>");
			        out.println(j);
			        out.println("<td>");

			        out.println("<td>");
					out.println(rw.getFid());
					out.println("</td>");

					out.println("<td>");
					out.println(rw.getFsource());
					out.println("</td>");

					out.println("<td>");
					out.println(rw.getFdestination());
					out.println("</td>");

					out.println("<td>");
					out.println(rw.getFtype());
					out.println("</td>");

					out.println("<td>");
					out.println(rw.getUserID());
					out.println("</td>");

					out.println("<td>");
					out.println(rw.getReviewRating());
					out.println("</td>");

					out.println("<td>");
					out.println(rw.getReviewDate());
					out.println("</td>");

					out.println("<td>");
					out.println(rw.getReviewText());
					out.println("</td>");

					out.println("<tr>");

					/*out.println("<tr>");
                    out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getFid());
					//out.println("<input type='hidden' name= 'Fid' value ='"+rw.getFid()+"'></tr>");
					out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getFsource());
					out.println("<input type='hidden' name= 'Fsource' value ='"+rw.getFsource()+"'></tr>");
					out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getFdestination());
					out.println(" <input type='hidden' name= 'Fdestination' value ='"+rw.getFdestination()+"'></tr>");
					out.println("</td>");
					out.println("</tr>");
					
				    
					out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getFtype());
					out.println(" <input type='hidden' name= 'Ftype' value ='"+rw.getFtype()+"'></tr>");
				    out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getUserID());
					out.println(" <input type='hidden' name= 'UserID' value ='"+rw.getUserID()+"'></tr>");
				    out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getReviewRating());
					out.println(" <input type='hidden' name= 'ReviewRating' value ='"+rw.getReviewRating()+"'></tr>");
				    out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getReviewDate());
					out.println(" <input type='hidden' name= 'ReviewDate' value ='"+rw.getReviewDate()+"'></tr>");
				    out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr>");
			        out.println("<td>");
					out.println(rw.getReviewText());
					out.println(" <input type='hidden' name= 'ReviewText' value ='"+rw.getReviewText()+"'></tr>");
				    out.println("</td>");
					out.println("</tr>");*/
				} 
			}	

			out.println("</table>");
			out.println("<br></br>");
			out.println("<form action='AddReview.jsp'><input type='submit' value='Review Page'></form>");
					out.println("</article>");
				    out.println("</section>");
					out.println("</div>");		

} // end of try

catch(Exception e)
{
	
}		   

%>



<%@include file="footer.jsp"%>

 </div>

</body>
</html>