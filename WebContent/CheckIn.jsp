  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
           
           
           
<c:set var="empDetails" value='${requestScope["outputObject"].get("empDetails")}' />
<c:set var="checkInType" value='${requestScope["outputObject"].get("checkInType")}' />
<c:set var="lstLastCheckIns" value='${requestScope["outputObject"].get("lstLastCheckIns")}' />





</head>


<script>


function checkIn()
{	
	
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(showPosition, showError);
	  } else {
	    x.innerHTML = "Geolocation is not supported by this browser.";
	  } 
}

function showPosition(position) {	  
	  
	  
	var str1="Are you sure you want to ";
	<c:if test="${checkInType eq 'O'}">							  				
		str1+="Check In..?";	  									  
</c:if>


	<c:if test="${checkInType eq 'I'}">							  				
		str1+="Check Out..?";			  									  
	</c:if> 	
	  
	  
	  var answer = window.confirm(str1);
		if (!answer) 
		{
			return;    
		}
		
		  document.getElementById("closebutton").style.display='none';
		   document.getElementById("loader").style.display='block';
		$('#myModal').modal({backdrop: 'static', keyboard: false});;

		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() 
		  {
		    if (xhttp.readyState == 4 && xhttp.status == 200) 
		    { 		      
		      document.getElementById("responseText").innerHTML=xhttp.responseText;
			  document.getElementById("closebutton").style.display='block';
			  document.getElementById("loader").style.display='none';
			  $('#myModal').modal({backdrop: 'static', keyboard: false});;
		      
			  
			}
		  };
		  xhttp.open("GET","?a=checkIn&remarks="+txtremarks.value+"&latitude="+position.coords.latitude+"&longitude="+position.coords.longitude, true);    
		  xhttp.send();
	  
	  
	  
	  
	}
	
function showError(error) {
	  switch(error.code) {
	    case error.PERMISSION_DENIED:
	    	alert("User denied the request for Geolocation.");
	    	window.location="chrome://"
	      break;
	    case error.POSITION_UNAVAILABLE:
	      alert("Location information is unavailable.");
	      break;
	    case error.TIMEOUT:
	      alert("The request to get user location timed out.");
	      break;
	    case error.UNKNOWN_ERROR:
	      alert("An unknown error occurred.");
	      break;
	  }
	}


function updateItem()
{
	
	document.getElementById("frm").action="?a=updateItem"; 
	document.getElementById("frm").submit();
	return;
	
	
}





function deleteAttachment(id)
{
		
		
		
		  document.getElementById("closebutton").style.display='none';
		   document.getElementById("loader").style.display='block';
		$("#myModal").modal();

		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() 
		  {
		    if (xhttp.readyState == 4 && xhttp.status == 200) 
		    { 		      
		      document.getElementById("responseText").innerHTML=xhttp.responseText;
			  document.getElementById("closebutton").style.display='block';
			  document.getElementById("loader").style.display='none';
			  $("#myModal").modal();
		      
			  
			}
		  };
		  xhttp.open("GET","?a=deleteAttachment&attachmentId="+id, true);    
		  xhttp.send();
		
		
		
}








</script>



<br>



<div class="container" style="padding:20px;background-color:white">

<div class="col-sm-12" align="center">
  		
  		
  							  				
			<button class="btn btn-primary" type="button" onclick='checkIn()'>Check In</button>			  									  
			 	
		
				
	</div>	

<form id="frm" action="?a=addBrand" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
<div class="row">
  <div class="col-sm-12">
  	<div class="form-group">
      <label for="email">Employee Name</label>
      <input type="text" class="form-control" id="brandname" value="${empDetails.name}" readonly  placeholder="eg. " name="brandName">
    </div>
  </div>
  
  
  <div class="col-sm-12">
  	<div class="form-group">
      <label for="email">Remarks</label>
      <input type="text" class="form-control" id="txtremarks" value=""  placeholder="eg. Late Due to Traffic" name="txtremarks">
    </div>
  </div>
  
  
  
  <br>
 	
	
</div>

</form>
</div>
<br>
<br>
<div class="card">

<br>




<div class="row">



</div>


                    
              
              
              
              
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: 580px;">                
                <table id="example1"class="table table-head-fixed  table-bordered table-striped dataTable dtr-inline" role="grid" aria-describedby="example1_info">
                
                
                <thead>
                    <tr align="center" >
                     <th align="center" colspan="5">Recent Check In/ Check Out </th>
                     
                    </tr>
                  </thead>
                
                  <thead>
                    <tr>
                     <th><b>Check Time</b></th>
                     <th><b>Type</b></th>
                     
                     <th><b>Location</b></th>
                     <th><b>Remarks</b></th>
                     
                     <th></th>
                     
                    </tr>
                  </thead>
                  <tbody>
				<c:forEach items="${lstLastCheckIns}" var="check">
					<tr >
					
						<td>${check.checked_time}</td>
						<td>
						
						<c:if test="${check.check_in_type eq 'I'}">							  				
							Check In			  									  
						</c:if>
						
						
						<c:if test="${check.check_in_type eq 'O'}">							  				
							Check Out			  									  
						</c:if>
												
						</td>
											
						
						<td>
							<a href="#" onclick='openLocation(${check.latitude},${check.longitude})'>
								${check.latitude} ${check.longitude}								
							</a>
						</td>
						<td>${check.remarks}</td>
						
						
					</tr>
				</c:forEach>
				
				
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>

<script>
	
	
	
		
		
		
	<c:if test="${checkInType eq 'O'}">							  				
		document.getElementById("divTitle").innerHTML="Check In";			  									  
	</c:if>
	
	
		<c:if test="${checkInType eq 'I'}">							  				
			document.getElementById("divTitle").innerHTML="Check out";			  									  
		</c:if>
		
		function openLocation(latitude,longitude)
		{
			window.open("https://maps.google.com/maps?q=loc:"+latitude+","+longitude);
		}
		
	
</script>



