


<form action="OrderManagement" method="post">
  <div class="container">
    <label><b>Booking_ID</b></label>
    <input type="text" placeholder="Booking_ID" id="Bid" name="Bid" required>	
	</br>
	<label><b>Flight_ID</b></label> 
    <input type="text" placeholder="Flight Id" id="Fid" name="Fid" required>	
	</br>
	<label><b>UserId</b></label>
    <input type="text" placeholder="User Id" id="Uid" name="Uid" required>	
	</br>
    <label><b>Source</b></label>
    <input type="text" placeholder="Source" id="Fsource" name="Fsource" required>
    </br>
	<label><b>Destination</b></label>
    <input type="text" placeholder="Destination" id="Fdestination" name="Fdestination" required>
	</br>
	<label><b>Departure</b></label>
    <input type="text" placeholder="eg. 01:30 AM " id="Fdep" name="Fdep"required>
	</br>
	<label><b>Arrival </b></label>
    <input type="text" placeholder="eg. 01:30 AM" id="Farrival" name="Farrival" required>
	</br>
	<label><b>Flight Type </b></label>
    <input type="text" placeholder="eg. domestic" id="Ftype" name="Ftype" required>
	</br>
	<label><b>Total Cost</b></label>
    <input type="text" placeholder="eg. 100" id="Totcost" name="Totcost" required>
    </br>
	<label><b>Ddate</b></label>
    <input type="text" placeholder=" eg. 01:30 AM " id="Ddate" name="Ddate" required>
    </br>
	<label><b>Rdate</b></label>
    <input type="text" placeholder=" eg. 01:30 AM " id="Rdate" name="Rdate" required>
    </br>
	<label><b>Passengers</b></label>
    <input type="text" placeholder="eg. 2" id="Passengers" name="Passengers" required>
    </br>
	<input type="hidden"  name="reqtype" value="update_product">
    <button id="submitbtn"type="submit"> Update Order</button>
	</div>
  </div>
</form>
