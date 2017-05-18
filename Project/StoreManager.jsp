
<html>
	<head>
		<title>BestDeal.com:Online Sopping </title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
		<link rel="stylesheet" type="text/css" href="style22.css" />
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
		</br></br></br></br>
		<ul id="menu3">
			<button id="addProduct"><a>Add Flight</button>
			<button id="delProduct"><a>Delete Flight</button>
			<button id="updtProduct"><a>Update Flight</button>
			
		</ul>
		

		
		<div id='right_content' >
		  
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
				url: "productManager",
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
				url: "productManager",
				success: function(data){
					$('#right_content').html(data);
				}
			});
		});
		
		
		function  showFormAdd()
		{
			$.get("addProduct.jsp", function(data){
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
			$.get("updateProduct.jsp", function(data){
				$('#right_content').html(data);
			});
		}
		
		function deleteProduct(prodid)
		{
			$.ajax({
				type: "POST",
				data:  { reqtype: "delete_product", pid : prodid },
				url: "productManager",
				success: function(data){
					$('#right_content').html(data);
					$("#delProduct").click();
				}
			});
		}
		
		function getUpdateProductForm(prodid)
		{
			$.ajax({
				type: "POST",
				data:  { reqtype: "get_product", pid : prodid },
				url: "productManager",
				success: function(pdata){
						$("#Fid").val(pdata['FlightId']);
						$("#Fsource").val(pdata['Source']);
						$("#Fdestination").val(pdata['Destination']);
						$("#Fdep").val(pdata['Departure']);
						$("#Farrival").val(pdata['Arrival']);
						$("#Ftype").val(pdata['Type']);
						$("#FEcost").val(pdata['ECost']);
						$("#FBcost").val(pdata['BCost']);
						$("#Fcapacity").val(pdata['Capacity']);
				}
			});
		}
		function showall()
		{
			$.ajax({
				type: "POST",
				data:  { reqtype: "show_all", prodid : 0},
				url: "productManager",
				success: function(data){
					$('#right_content').html(data);
				}
			});
		}
		showall();
	</script>
		
</html>