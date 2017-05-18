


<form action="productManager" method="post">
  <div class="container">
    <label><b>Flight ID</b></label>
    <input type="text" placeholder="Flight Id" id="Fid" name="Fid">	
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
	<label><b>Flight Type</b></label>
    <input type="text" placeholder="eg. Domestic" id="Ftype" name="Ftype" required>
    </br>
	<label><b>Economy-Cost</b></label>
    <input type="text" placeholder=" eg. 120.00" id="FEcost" name="FEcost" required>
    </br>
	<label><b>Business-Cost</b></label>
    <input type="text" placeholder=" eg. 120.00" id="FBcost" name="FBcost" required>
    </br>
	<label><b>Capacity</b></label>
    <input type="text" placeholder="eg. 150" id="Fcapacity" name="Fcapacity" required>
    </br>
	<input type="hidden"  name="reqtype" value="add_product">
    <button id="submitbtn"type="submit"> Add Product</button>
	</div>
  </div>
</form>
