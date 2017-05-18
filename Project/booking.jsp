<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airline-ticket-booking - Home</title>
<link rel="stylesheet" href="styles.css" type="text/css" />

</head>
<body>
<script>
function addRows() {
	document.getElementById("demo").innerHTML = "Enter your booking details:";
    var table = document.getElementById('tableElement');
    var rows = parseInt(document.getElementById('table-row-num').value);
    for (var i = 1; i <= rows; i++) {
        var tr = document.createElement('tr');
        var cell1 = document.createElement('td');
        var cell2 = document.createElement('td');
        var cell3 = document.createElement('td');
        var cell4 = document.createElement('td');
        var input1 = document.createElement('input');
        var input2 = document.createElement('input');
        var input3 = document.createElement('input');
        input1.type = "text";
        input2.type = "text";
        input3.type = "text";
        input1.placeholder = "Enter Name";
        input2.placeholder = "Enter Age";
        input3.placeholder = "Enter Sex";
        //cell1.innerHTML = i.toString();
        cell2.appendChild(input1);
        cell3.appendChild(input2);
        cell4.appendChild(input3);
        tr.appendChild(cell1);
        tr.appendChild(cell2);
        tr.appendChild(cell3);
        tr.appendChild(cell4);
        table.appendChild(tr);
    }

}	

function toggleTable()
    {

    var status = document.getElementById("CardDetailsTable").style.display;

    if (status == 'block') {
      document.getElementById("CardDetailsTable").style.display="none";
    } else {
      document.getElementById("CardDetailsTable").style.display="block";
    }
  }


</script>
<%          
            response.setContentType("text/html");
			String userid=String.valueOf(session.getAttribute("uname"));
            session.setAttribute("uname",userid);


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
	 %>

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
<%@ page import= "controller.*"%>

<%
	//HashMap<String, Flight> flightdetail = new HashMap<String, Flight>();
	/*float price1=0,price2=0,totalprice=0;
	String fid1="",fid2="",depart="",ret="";
	Integer count=0;*/
/*	loginServlet login=new loginServlet();
	if(login.status_guest==true)
		{
		    price1=(Float)session.getAttribute("price1");
		    price2=(Float)session.getAttribute("price2");
		    totalprice=(Float)session.getAttribute("totalprice");
		    fid1=(String)session.getAttribute("fid1");
			fid2=(String)session.getAttribute("fid2");
			depart=(String)session.getAttribute("depart");
			ret=(String)session.getAttribute("ret");
			count=(Integer)session.getAttribute("count");	
			login.status_guest=false;
		}
		else
			

			{*/

		try{
			Float price1=Float.parseFloat(request.getParameter("price1"));
		    Float price2=Float.parseFloat(request.getParameter("price2"));
		    Float totalprice=Float.parseFloat(request.getParameter("totalprice"));
		    String fid1=request.getParameter("Fid1");
			String fid2=request.getParameter("Fid2");
			String depart=request.getParameter("depart");
			String ret=request.getParameter("ret");
			String fdep1=request.getParameter("fdep1");
			String fdep2=request.getParameter("fdep2");
			String farr1=request.getParameter("farr1");
			String farr2=request.getParameter("farr2");
			String fsource=request.getParameter("fsource");
			String fdest=request.getParameter("fdest");
			Integer count=Integer.parseInt(request.getParameter("count"));
		
			
			
			//String flex=request.getParameter("flex");
			//Integer count = Integer.parseInt(request.getParameter("total"));
			//Flight f = new Flight (from, Password,UserType);
			

			//out.println(count);
            //ArrayList<Flight> arr1 = new ArrayList<Flight>();
			//arr1=MySqlDataStoreUtilities.flightSearchOutbound(from,to,depart,ret,count);
			//MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			//Iterator<Flight> iter1 = arr1.iterator();
			//flightdetail = MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			//out.println(depart);
			//out.println(flightdetail);
		   out.println("<br><b><font color='DarkBlue'>Booking Confirmation</font></b>"); 
		   out.println("<table border='1 px' align='center'>");
			out.println("<tr>");
			out.println("<td><b>Number of Travellers</b></td><td>"+count+"</td><input type='hidden' name='count' id='count' value='"+count+"'></tr>");
			out.println("<tr><td><b>Total Price</b></td><td>"+totalprice+"</td>");
			//out.println("<div id='total'></div>");
			out.println("</tr>");
			out.println("</table>");
		   out.println("<br>");
		
		 out.println("<div><form action='performPayment' method='post'>");
		 out.println("<input type='hidden'  name='userid' id='userid' value='"+userid+"'>");
		 out.println("<input type='hidden'  name='fid1' id='fid1' value='"+fid1+"'>");
		 out.println("<input type='hidden'  name='fid2' id='fid2' value='"+fid2+"'>");
		 out.println("<input type='hidden'  name='depart' id='depart' value='"+depart+"'>");
		 out.println("<input type='hidden'  name='ret' id='ret' value='"+ret+"'>");
		 out.println("<input type='hidden'  name='count' id='count' value='"+count+"'>");
		 out.println("<input type='hidden'  name='price1' id='price1' value='"+price1+"'>");
		 out.println("<input type='hidden'  name='price2' id='price2' value='"+price2+"'>");
		 out.println("<input type='hidden'  name='totalprice' id='totalprice' value='"+totalprice+"'>");
		 out.println("<input type='hidden'  name='fdep1' id='fdep1' value='"+fdep1+"'>");
		 out.println("<input type='hidden'  name='fdep2' id='fdep2' value='"+fdep2+"'>");
		 out.println("<input type='hidden'  name='farr1' id='farr1' value='"+farr1+"'>");
		 out.println("<input type='hidden'  name='farr2' id='farr2' value='"+farr2+"'>");
		 out.println("<input type='hidden'  name='fsource' id='fsource' value='"+fsource+"'>");
		 out.println("<input type='hidden'  name='fdest' id='fdest' value='"+fdest+"'>");
		 out.println("<table border= '1 px' cellpadding='1'>");
		 out.println("<tr><td>Name</td>");
		 out.println("<td>Age</td>");
		 out.println("<td>Sex</td></tr>");
		 int j=0;
        for(int i=0;i<count;i++)
        {
        j=i;
       	out.println("<tr><td><input type='text' id='Pname' required></td>");
       	j=j+10;
        out.println("<td><input type='text' id='Page' required></td>");
        j=j+10;
        out.println("<td><input type='text' id='Psex'required></td></tr>");
        
        }
        out.println("</table>");
        
		out.println("<table cellpadding='1' cellspacing='1' border='1' id='tableElement'>");
        out.println("<input type='hidden' id='table-row-num' value='"+count+"'>");
        //out.println("<button onclick='addRows();toggleTable();'>Confirm</button>");
        out.println("<b><font color='DarkBlue'><p id='demo'></p></font></b><br>");
		//out.println("<table border='1 px' align='center'><tr><td>");
		//out.println("<br><table border='1 px' id='CardDetailsTable' border='1' align='center' style='display:none'>");
		out.println("<br><table border='1 px' id='CardDetailsTable' border='1' align='center'>");
		out.println("<tr><td><b>Enter Credit Card No</b></td><td><input type='text' name='cardno'</td></tr>");
		out.println("<tr><td><b>Card Expiry Date(mm/yyyy)</b></td><td><input type='text' name='date'</td></tr>");
		out.println("</table><br>");
		out.println("<p align='center'><input type='submit' value ='Pay'></p>");

		out.println("</form></div>");
		
	
		}
		catch(Exception e){}
		
%>
<%@include file="footer.jsp"%>
</body>
</html>