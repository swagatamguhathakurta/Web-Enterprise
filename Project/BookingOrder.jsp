


<form action="OrderManagement" method="post">
  <div class="container">
	<label><b>Booking Id</b></label>
    <input type="text" placeholder="Booking Id" id="Bid" name="Bid" readonly>	
	</br>
     <label><b>Name</b></label>
    <input type="text" placeholder="PName" id="PName" name="PName" required>	
	</br>
    <label><b>Age</b></label>
    <input type="text" placeholder="Age" id="Age" name="Age" required>
    </br>
	 <label><b>sex</b></label>
    <input type="text" placeholder="eg. M" id="Sex" name="Sex" required>
    </br>
	<input type="hidden"  name="reqtype" value="updateBooking">
    <button id="submitbtn"type="submit"> Update </button>
	</div>
  </div>
</form>
