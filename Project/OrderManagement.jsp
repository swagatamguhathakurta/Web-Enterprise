
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>BestDeal.com:Online Sopping </title>
		<link rel="stylesheet" href="style22.css" type="text/css" />
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>

	<div id="header">
	<img src="images/logo.jpg" alt="" width="274" height="90" />	
	<center><b>Welcome to Flight Management</b></center>
	</div>
		<section class="Encloser">

		
		
		<div class="ManagementOptions">
		<ul id="menu2">
			<li id=""><a href="StoreManager.jsp">Flight Management</a></li>
			<li id=""><a href="OrderManagement.jsp">Order Management</a></li>
			<li><a href="index.jsp">Logout</a></li>
			</ul>
		</div>
		
		</br>
		</br></br></br></br>

		
		<ul id="menu3">
			<button id="addProduct"><a>Add Order</button>
			<button id="delProduct"><a>Delete Order</button>
			<button id="updtProduct"><a>Update Order</button>
			
		</ul>
		

		
		<div id='right_content' ">
		 
		</div>


		</section>
<div id="footer">																																										<ul>
			<li><a href="index.html">Home Page</a> |</li>
			<li><a href="index2.html">About Company</a> |</li>                                                                                                      
			<li><a href="index2.html">Services</a> |</li>
			<li><a href="index2.html">Reviews</a> |</li>
			<li><a href="index2.html">Contact us</a></li>
		</ul>
		<p>Copyright &copy;. All rights reserved. Design by Team 3</a></p>																																																			
	</div>

	</body>

	<script>
		$(document).on("click", "#delProduct", function() {
			 $.ajax({
				type: "POST",
				data:{ reqtype: "show_delete", prodid : 0},
				url: "OrderManagement",
				success: function(data){
					$('#right_content').html(data);
				}
			});
		});
		
		$(document).on("click", "#addProduct", showFormAdd);
		$(document).on("click", "#updtProduct", function() {
			 $.ajax({
				type: "POST",
				data:  { reqtype: "show_update", prodid : 0},
				url: "OrderManagement",
				success: function(data){
					$('#right_content').html(data);
				}
			});
		});
		
		
		function  showFormAdd()
		{
			$.get("addOrder.jsp", function(data){
				$('#right_content').html(data);
			});
		}
		function sequencer(prodid)
		{
			$.ajax({
				   url:showFormUpdate(prodid),
				   success:function(){
				   getUpdateProductForm(prodid);
				}
				})
		}
		function  showFormUpdate(pid)
		{
			$.get("updateOrder.jsp", function(data){
				$('#right_content').html(data);
			});
		}
		function sequencer2(prodid,num)
		{
			$.ajax({
				   url:showall()
				})
		}
		
		
		
		function getBookingDetails(prodid)
		{
			$.ajax({
				type: "POST",
				data:  { reqtype: "get_BookingDetails", pid : prodid },
				url: "OrderManagement",
				success: function(data){
					$('#right_content').html(data);
				}
			});
		}
		
		function getUpdateProductForm(prodid)
		{
			$.ajax({
				type: "POST",
				data:  { reqtype: "get_product", pid : prodid },
				url: "OrderManagement",
				success: function(pdata){
						$("#Fid").val(pdata['Fid']);
						$("#Bid").val(pdata['Bid']);
						$("#Uid").val(pdata['Uid']);
						$("#Rdate").val(pdata['Rdate']);
						$("#Ddate").val(pdata['Ddate']);
						$("#Fsource").val(pdata['Fsource']);
						$("#Fdestination").val(pdata['Fdestination']);
						$("#Fdep").val(pdata['Fdep']);
						$("#Farrival").val(pdata['Farrival']);
						$("#Ftype").val(pdata['Ftype']);
						$("#Totcost").val(pdata['Totcost']);
						$("#Passengers").val(pdata['Passengers']);
				}
			});
		}
		function showall()
		{
			$.ajax({
				type: "POST",
				data:  { reqtype: "show_all", prodid : 0},
				url: "OrderManagement",
				success: function(data){
					$('#right_content').html(data);
				}
			});
		}
		showall();
	</script>
		
</html>