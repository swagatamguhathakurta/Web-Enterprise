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
	<div id="header">																																																																													
		<a href="index.jsp" class="logo"><img src="images/logo.jpg" alt="" width="274" height="90" /></a>																																								
	    <div class ="top">
         
		  <span class ="account" id="account" style="float:right"><a><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button></a></span>

		</div>

			<ul id="menu">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="deal.jsp">Flights & Deals</a></li>
			<li><a href="Contact.jsp">Contact us</a></li>
		</ul>
	</div>
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
    <% 
    response.setContentType("text/html;charset=UTF-8");
    String userid = "a";
    session.setAttribute("uname",userid);

    %>
	<div id="wrapper">																																						
	  <div id="left">
			<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> 
			<div id="search">
				<img src="images/title5.gif" alt="" width="119" height="22" /><br/> 
				<form action="presearch.jsp" method="post">
					

					  <div name="autofillform">
					<table><tr><td>
						<input type="text" name="from" class="input" autocomplete="on" id="searchId" onkeyup="init()" placeholder="From"/>
						<div id="auto-row">
							<table id="complete-table" class="gridtable" bgcolor="white" style="position: absolute;"></table>
						</div> 

					</td><td>


					<input type="text" name="to" class="input" id="searchIds" onkeyup="inits()" placeholder="To"/>
					<div id="auto-rows">
						<table id="complete-tables" class="gridtable" bgcolor="white" style="position: absolute;"></table>
					</div> 

					</td></tr></table>
				</div>

					 </p> 
					<p><input type="radio" name="way" value="oneway" id="way" onclick="if(this.checked){disableDate()}"> One Way
                    <input type="radio" name="way" value="roundtrip" id="way" onclick="if(this.checked){undisableDate()}"> Round Trip</p>
					<p><span class="pad">Depart</span> Return</p>
					<p><input type="date" name="depart">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="date" id= "myDate" name="return"></p><br>
					<p><input type="checkbox" name="flex" value= "true">My dates are flexible</p>
					<p class="pad3">
						<span><strong>Adults</strong><br /><select onblur="findTotal()" name="qty" class="select3"><option>1</option><option>2</option><option>3</option><option>4</option></select></span>
						<span><strong>Children</strong><br /><select onblur="findTotal()" name="qty" class="select3"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select></span>
						<span><strong>Seniors</strong><br /><select onblur="findTotal()" name="qty" class="select3"><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option></select></span>
						<input type="hidden" name="total" id="total"/>					  
						
						<span><a class="button"><input type="image" value="submit" src="images/button.gif" alt="submit Button" width="95" height="19" onMouseOver="this.src='images/button.gif'"></a></span>
						
					</p>
					
				</form>
			</div>
			<div class="text">
				<p><h3><center> BlueWings.There is no other better way to fly.</center></h3> </p>
				
			</div>
		</div>
		<div id="right">
			<div>
			</br>
			</br>
				<H2>About Us </H2>
				</br>
		
				<pf style=font-size: 200%;> Blue Wings is a Chicago-based airline that is on a mission to make flying good again, with brand new planes, attractive fares, top-notch service, and a host of fun.</br>
				</br>The Blue wings experience is unlike any other in the skies, featuring mood-lit cabins with WiFi, custom-designed leather seats, power outlets, and a video touch-screen at every seatback. </br>
				</br>Blue Wings has captured a host of travel industry best-in-class awards, including: “Best Domestic Airline” in both Conde Nast Traveler’s  Reader’s Choice Awards and Travel + Leisure’s World’s Best Awards.</br>			
			</div>
		</div>
		</br>
		</br>
	</div>
	
	<div id="footer">																																										<ul>
			<li><a href="index.jsp">Home Page</a> |</li>
			<li><a href="index.jsp">About Company</a> |</li>                                                                                                      
			<li><a href="index.jsp">Services</a> |</li>
			<li><a href="index.jsp">Reviews</a> |</li>
			<li><a href="index.jsp">Contact us</a></li>
		</ul>
		<p>Copyright &copy;. All rights reserved. Design by Team 3</a></p>																																																			
	</div>
</body>
</html>
