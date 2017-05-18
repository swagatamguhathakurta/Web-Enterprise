<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Airline-ticket-booking - Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<script src="myscript.js"></script>
	<div id="header">																																					<%
        response.setContentType("text/html;charset=UTF-8");

        String userid = session.getAttribute("uname").toString();
        session.setAttribute("uname",userid);
        %>																																								
		<a href="Customer.jsp" class="logo"><img src="images/logo.jpg" alt="" width="274" height="90" /></a>																																								
	    <div class ="top">
         
		  <span class ="account" id="account" style="float:right"><a><%=userid%></a>|<a href="LogoutServlet.jsp"><button style="width:auto;">Logout</button></a></span>
		  
		</div>

			<ul id="menu">
			<li><a href="Customer.jsp">Home</a></li>
			<li><a href="deal.jsp">Flights & Deals</a></li>
			<li><a href="OrderPage.jsp">My Bookings</a></li>
			<li><a href="AddReview.jsp">Reviews</a></li>
			<li><a href="Contact.jsp">Contact us</a></li>
		</ul>
	</div>
</body>
</html>
