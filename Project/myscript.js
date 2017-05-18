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

function disableDate() {
    
    document.getElementById("myDate").disabled = true;
}

function undisableDate() {
    document.getElementById("myDate").disabled = false;
}

function findTotal(){
    var arr = document.getElementsByName('qty');
    var tot=0;
    for(var i=0;i<arr.length;i++){
        if(parseInt(arr[i].value))
            tot += parseInt(arr[i].value);
    }
    document.getElementById('total').value = tot;
}



var req;
var isIE;
var searchId;
var completeTable;
var autoRow;

function init() {
    searchId = document.getElementById("searchId"); 
    completeTable = document.getElementById("complete-table");
    autoRow = document.getElementById("auto-row");
    completeTable.style.top = getElementY(autoRow) + "px";
    doCompletion();
}

function inits() {
    searchId = document.getElementById("searchIds"); 
    completeTable = document.getElementById("complete-tables");
    autoRow = document.getElementById("auto-rows");
    completeTable.style.top = getElementY(autoRow) + "px";
    doCompletion();
}

function doCompletion() {
    var url = "autocomplete?action=complete&searchId=" + escape(searchId.value); 
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function initRequest() {
    if (window.XMLHttpRequest) 
    {
        if (navigator.userAgent.indexOf('MSIE') != -1) 
        {
            isIE = true; 
        }
        return new XMLHttpRequest(); 
    } 
    else if (window.ActiveXObject) 
    {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP"); 
    }
}

function appendProduct(productName) { 
    var row;
    var cell;
    var linkElement;
    if (isIE) 
    {
        completeTable.style.display = 'block';
        row = completeTable.insertRow(completeTable.rows.length); 
        cell = row.insertCell(0);
    } 
    else 
    {
        completeTable.style.display = 'table'; 
        row = document.createElement("tr"); 
        cell = document.createElement("td"); 
        row.appendChild(cell); 
        completeTable.appendChild(row);
    }
    cell.className = "popupCell";
    linkElement = document.createElement("input");
    linkElement.className = "popupItem";
    linkElement.setAttribute("value", productName); 
    linkElement.appendChild(document.createTextNode(productName)); 
    cell.appendChild(linkElement);
    linkElement.onclick = function(){
        setVal(this);
        //searchId.value = this.value;
        //autoRow.style.display='none';
        //completeTable.style.display='none';
    };
    //document.autoRow.style.display='none';
}

function parseMessages(responseXML) { // no matches returned
    if (responseXML == null) 
    {
        return false; 
    } 
    else 
    {
        var products = responseXML.getElementsByTagName("products")[0]; 
        if (products.childNodes.length > 0) 
        {
            completeTable.setAttribute("bordercolor", "black"); 
            completeTable.setAttribute("border", "1");
            for (loop = 0; loop < products.childNodes.length; loop++) 
            {
                var product = products.childNodes[loop];
                var productName = product.getElementsByTagName("productName")[0]; 
                appendProduct(productName.childNodes[0].nodeValue); 
            }
        } 
    }
}

function callback() { 
    clearTable();
    if (req.readyState == 4) {
        if (req.status == 200) 
        { 
            parseMessages(req.responseXML);
        } 
    }
}
function clearTable() {
    if (completeTable.getElementsByTagName("tr").length > 0) 
    {
        completeTable.style.display = 'none';
        for (loop = completeTable.childNodes.length -1; loop >= 0 ; loop--) 
        {
            completeTable.removeChild(completeTable.childNodes[loop]); 
        }
    } 
}

function getElementY(element){
    
    var targetTop = 0;
    
    if (element.offsetParent) 
    {
        while (element.offsetParent) 
        {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } 
    else if (element.y) 
    {
        targetTop += element.y;
    }
    return targetTop;
}

function setVal(selectedVal){
    searchId.value = selectedVal.value;
    autoRow.style.display='none';
    //completeTable.style.display='none';

}

function findTotalPrice(){
      var total = 0;
            var controls = document.getElementsByTagName('input');
            var count = document.getElementById('count').value;
            for (var i = 0; i < controls.length; i++) {
                if ((controls[i].type == 'radio') && controls[i].checked)
                    total = total + parseFloat(controls[i].value);
            }
            var totalprice = total * count;
    document.getElementById('totalprice').value = totalprice;
    //document.getElementById('total').innerHTML = total;
}


