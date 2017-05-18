<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airline-ticket-booking - Home</title>
<link rel="stylesheet" href="styles.css" type="text/css" />

</head>
<body>
<script>
<%@ page import= "controller.*"%>
// Get the modal
var modal = document.getElementById('id01');
//var way = document.getElementById("way").value;

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function todo(){
	document.getElementById('id01').style.display='none';
	document.getElementById('id02').style.display='block';
}
function findTotalPrice(){
      var total = 0;
      var price1 = document.getElementById('price1').value;
      var price2 = document.getElementById('price2').value;
            var controls = document.getElementsByTagName('input');
            var count = document.getElementById('count').value;
            for (var i = 0; i < controls.length; i++) {
                if ((controls[i].type == 'radio') && controls[i].checked)
                    total = total + parseFloat(controls[i].value);
            }
            var totalprice = total * count;
    document.getElementById('totalprice').value = totalprice;
    document.getElementById('Price1').value = price1;
    document.getElementById('Price2').value = price2;
    document.getElementById('Totalprice').value = totalprice;
    //document.getElementById('total').innerHTML = total;
}
</script>
<%          
            response.setContentType("text/html");
			String userid=String.valueOf(session.getAttribute("uname"));
            session.setAttribute("uname",userid);

if (!userid.equals("a")){ 

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
	}
	else{ %>
	<%@include file="header.jsp"%>
   <% } %>

<div id="container">
    <%      String select1=request.getParameter("select1");	
			String select2=request.getParameter("select2");
			String depart=request.getParameter("depart");
			String ret =request.getParameter("ret");	
			//String flex=request.getParameter("flex");
			Integer count = Integer.parseInt(request.getParameter("count"));
    %>
<div id="id01" class="modal">
  
	  <form class="modal-content animate" action="${pageContext.request.contextPath}/loginServlet" method="post">
		<div class="imgcontainer">
		  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
		  <p>Log in or Register</p>
		</div>

		<div class="container">
		  <label><b>Username</b></label>
		  <input type="text" placeholder="Enter Username" name="uname" required>
		  <label><b>Password</b></label>
		  <input type="password" placeholder="Enter Password" name="psw" required>
		  <input type="hidden"  name="reqtype" value="login">
		  <input type="hidden"  name="Price1" id="Price1">
		  <input type="hidden"  name="Price2" id="Price2">
		  <input type="hidden" name="Totalprice" id="Totalprice">
		  <%
		  loginServlet login=new loginServlet();
		  login.status_guest=true;
          out.println("<input type='hidden'  name='Fid1' id='Fid1' value='"+select1+"'>");
          out.println("<input type='hidden'  name='Fid2' id='Fid2' value='"+select2+"'>");
          out.println("<input type='hidden'  name='depart' id='depart' value='"+depart+"'>");
          out.println("<input type='hidden'  name='ret' id='ret' value='"+ret+"'>");
          out.println("<input type='hidden'  name='count' id='count' value='"+count+"'>");
		  %>

		  <button type="submit">Login</button>
		  <input type="checkbox" checked="checked"> Remember me
		</div>

		<div class="container" style="background-color:#f1f1f1">
		  <button type="button" onclick="document.getElementById('id01').style.display='none'" class="">Cancel</button>
		  <span class="psw">Forgot <a href="#">password?</a> | <a href="javascript:void(0)" onclick="todo()" >Register Here</a></span>
		</div>
	  </form>
    </div>
    <div id="id02" class="modal">
  
	  <form class="modal-content animate" action="loginServlet" method="post">
		<div class="imgcontainer">
		  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
		  <p>Registration form</p>
		</div>

		<div class="container">
		<table>
		<tr><td>
		<label><b>First Name</b></label></td><td>
		  <input type="text" placeholder="Enter First Name" name="fname" required></td></tr>
		<tr><td>
		<label><b>Last Name</b></label></td><td>
		  <input type="text" placeholder="Enter Last Name" name="lname" required></td></tr>
		<tr><td>
		<label><b>Email</b></label></td><td>
		  <input type="text" placeholder="Enter Email" name="email" required></td></tr>
		<tr><td>
		  <label><b>Username</b></label></td><td>
		  <input type="text" placeholder="Enter Username" name="uname" required></td></tr>
		  <tr><td>
		  <label><b>Password</b></label></td><td>
		  <input type="password" placeholder="Enter Password" name="psw" required></td></tr>
		  <tr><td>
		  <label><b>Retype Password</b></label></td><td>
		  <input type="password" placeholder="Retype Password" name="rpsw" required></td></tr>
		  <tr><td>
		  <label><b>UserType</b></label></td><td>
		  <select name="type">
		  <option value="CUST">Customer</option>
		  <option value="STR_MGR">Admin</option>
		  </select></td></tr>
		  <input type="hidden"  name="reqtype" value="Signup">
			</table>
			<br/>
		  <button type="submit">Register</button>
		  
		</div>

		<div class="container" style="background-color:#f1f1f1">
		  <button type="button" onclick="document.getElementById('id02').style.display='none'" class="">Cancel</button>
		  
		</div>
	  </form>
    </div>



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


<% 
	//HashMap<String, Flight> flightdetail = new HashMap<String, Flight>();
	try
		{
			     
			//Flight f = new Flight (from, Password,UserType);
			
			
			//out.println(count);
            ArrayList<Flight> arr1 = new ArrayList<Flight>();
			arr1=MySqlDataStoreUtilities.selectFlight(depart,ret,select1,select2);
			//MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			Iterator<Flight> iter = arr1.iterator();
			//flightdetail = MySqlDataStoreUtilities.flightSearch(from,to,depart,ret,count);
			//out.println(depart);
			//out.println(flightdetail);
		   // out.println(arr1); 
		%>
		<br>
		<div>
		<% if (!userid.equals("a")){
		  out.println("<form action='booking.jsp'>");

          out.println("<input type='hidden'  name='Fid1' id='Fid1' value='"+select1+"'>");
          out.println("<input type='hidden'  name='Fid2' id='Fid2' value='"+select2+"'>");
          out.println("<input type='hidden'  name='depart' id='depart' value='"+depart+"'>");
          out.println("<input type='hidden'  name='ret' id='ret' value='"+ret+"'>");
          out.println("<input type='hidden'  name='count' id='count' value='"+count+"'>");
		  
		}
		%>
		<table border="1 px" align="center">
		<tr><td><b>Flight Id</b></td><td><b>Source</b></td><td><b>Destination</b></td><td><b>Dept.</b></td><td><b>Arr.</b></td><td><b>Type</b></td><td><b>Economic Price</b></td><td><b>Business Price</b></td><td><b>Remaining</b></td></tr>
		<% while(iter.hasNext())
             {
             
             Flight f = iter.next();
            if (select1.equals(f.getFid())){
			out.println("<tr>");
			out.println("<td>"+f.getFid()+ "</td>");
			out.println("<td>"+f.getFsource()+ "</td>");
			out.println("<td>"+f.getFdestination()+ "</td>");
			out.println("<td>"+f.getFdep()+ "</td>");
			out.println("<td>"+f.getFarrival()+ "</td>");
			out.println("<td>"+f.getFtype()+ "</td>");
			out.println("<td><input type='radio' onclick='findTotalPrice()' name='price1' id='price1' value='"+f.getFcost_E()+"'>"+f.getFcost_E()+ "</td>");
			out.println("<td><input type='radio' onclick='findTotalPrice()' name='price1' id='price1' value='"+f.getFcost_B()+"'>"+f.getFcost_B()+ "</td>");
			out.println("<td>"+f.getFcapacity()+ "</td>");
			out.println("</tr>");
			out.println("<input type='hidden'  name='fsource' id='fsource' value='"+f.getFsource()+"'>");
			out.println("<input type='hidden'  name='fdest' id='fdest' value='"+f.getFdestination()+"'>");
			out.println("<input type='hidden'  name='fdep1' id='fdep1' value='"+f.getFdep()+"'>");
			out.println("<input type='hidden'  name='farr1' id='farr1' value='"+f.getFarrival()+"'>");

			}
			else {
			out.println("<tr>");
			out.println("<td>"+f.getFid()+ "</td>");
			out.println("<td>"+f.getFsource()+ "</td>");
			out.println("<td>"+f.getFdestination()+ "</td>");
			out.println("<td>"+f.getFdep()+ "</td>");
			out.println("<td>"+f.getFarrival()+ "</td>");
			out.println("<td>"+f.getFtype()+ "</td>");
			out.println("<td><input type='radio' onclick='findTotalPrice()' name='price2' id='price2' value='"+f.getFcost_E()+"'>"+f.getFcost_E()+ "</td>");
			out.println("<td><input type='radio' onclick='findTotalPrice()' name='price2' id='price2' value='"+f.getFcost_B()+"'>"+f.getFcost_B()+ "</td>");
			out.println("<td>"+f.getFcapacity()+ "</td>");
			out.println("</tr>");
			out.println("<input type='hidden'  name='fdep2' id='fdep2' value='"+f.getFdep()+"'>");
			out.println("<input type='hidden'  name='farr2' id='farr2' value='"+f.getFarrival()+"'>");
			}
		}
		out.println("</table>");
		out.println("<br>");
		out.println("<table border='1 px' align='center'>");
		out.println("<tr>");
		out.println("<td><b>Number of Travellers</b></td><td>"+count+"</td><input type='hidden' name='count' id='count' value='"+count+"'></tr>");
		out.println("<tr><td><b>Total Price</b></td><td><input type='text' name='totalprice' id='totalprice'></td>");
		//out.println("<div id='total'></div>");
		out.println("</tr>");
		out.println("</table>");
		out.println("<br>");
        if (!userid.equals("a")){
        out.println("<p align='center'><input type='submit' value='Book Ticket'></p></form></div>");
        }
        else{
		out.println("<p align='center'><font color='DarkBlue'><b>Please login to proceed.</font></b></p>");
		}
		}
		catch(Exception e){}
%>
<%@include file="footer.jsp"%>
</body>
</html>