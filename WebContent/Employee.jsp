<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function deleteEmployee(employeeId)
{
	
	var answer = window.confirm("Are you sure you want to delete ?");
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
	  xhttp.open("GET","?a=deleteEmployee&employeeId="+employeeId, true);    
	  xhttp.send();
}

function EditEmployee(employeeId,employeeName)
{
	
	
	document.getElementById("closebutton").style.display='none';
	   document.getElementById("loader").style.display='block';
	$('#myModal').modal({backdrop: 'static', keyboard: false});;
	
	var stringToPopulate='<table class="table table-bordered tablecss" border="3">';
	stringToPopulate+='<tr style="background-color:cornsilk;" align="center"><td colspan="2">Update Employee</td></tr>';
	stringToPopulate+='<tr><td>Employee Name </td> <td colspan="2"><input id="txtemployeenamepopup" placeholder="Employee Name" value="'+employeeName+'" class="form-control input-sm" id="inputsm" type="text"></td></tr>';
	stringToPopulate+="<tr align=\"center\"><td colspan=\"2\"><button class=\"btn btn-primary\" onclick=\"updatedemployee("+employeeId+")\">Update</button></td></tr>";
	stringToPopulate+='</table>';
	
	document.getElementById("responseText").innerHTML=stringToPopulate;
     document.getElementById("closebutton").style.display='block';
	   document.getElementById("loader").style.display='none';
	$('#myModal').modal({backdrop: 'static', keyboard: false});;

	
}

function updatedemployee(catId)
{
	var catName=document.getElementById('txtemployeenamepopup').value;
	document.getElementById("closebutton").style.display='none';
	document.getElementById("loader").style.display='block';
	document.getElementById("responseText").innerHTML="";
	$('#myModal').modal({backdrop: 'static', keyboard: false});;
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() 
	  {
	    if (xhttp.readyState == 4 && xhttp.status == 200) 
	    { 		    	
	    	
	    	document.getElementById("responseText").innerHTML=xhttp.responseText;
		     document.getElementById("closebutton").style.display='block';
			   document.getElementById("loader").style.display='none';			  
		}
	  };
	  xhttp.open("GET","?a=updateEmployee&employeeId="+catId+"&employeeName="+catName, true);    
	  xhttp.send();
	
	
}




function addEmployeepopup()
{
	
	document.getElementById("closebutton").style.display='none';
	document.getElementById("loader").style.display='block';		 
	$('#myModal').modal({backdrop: 'static', keyboard: false});;		
	var stringToPopulate='<table class="table table-bordered tablecss" border="3">';
	stringToPopulate+='<tr style="background-color:cornsilk;" align="center"><td colspan="2">Add Employee</td></tr>';
	stringToPopulate+='<tr><td>Employee Name </td> <td colspan="2"><input id="txtemployeenamepopup" placeholder="Employee Name"  class="form-control input-sm" id="inputsm" type="text"></td></tr>';
	stringToPopulate+="<tr align=\"center\"><td colspan=\"2\"><button class=\"btn btn-primary\" onclick=\"addEmployee()\">Add</button></td></tr>";
	stringToPopulate+='</table>';
	
	document.getElementById("responseText").innerHTML=stringToPopulate;
     document.getElementById("closebutton").style.display='block';
	   document.getElementById("loader").style.display='none';
	$('#myModal').modal({backdrop: 'static', keyboard: false});;
	
	
}

function addEmployee()
{			
	
	var catName=document.getElementById('txtemployeenamepopup').value;
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() 
	  {
	    if (xhttp.readyState == 4 && xhttp.status == 200) 
	    { 		    	
	    	
	    	document.getElementById("responseText").innerHTML=xhttp.responseText;
		     document.getElementById("closebutton").style.display='block';
			   document.getElementById("loader").style.display='none';			  
		}
	  };
	  xhttp.open("GET","?a=addEmployee&employeeName="+catName, true);    
	  xhttp.send();
	
}



</script>	



<c:set var="message" value='${requestScope["outputObject"].get("ListOfEmployee")}' />



<br>
<div class="card">









           <div class="card-header">    
                
                
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 200px;">                    
                    <input type="button"  class="btn btn-block btn-primary btn-sm" onclick="window.location='?a=showAddEmployee'" value="Add New Employee" class="form-control float-right" >                      
                  </div>
                </div>
                
                <div class="card-tools">
                  <div class="input-group input-group-sm" align="center" style="width: 200px;display:inherit">
                    <div class="icon-bar" style="font-size:22px;color:firebrick">
  <a title="Download Excel" onclick="downloadExcel()"><i class="fa fa-file-excel-o" aria-hidden="true"></i></a> 
  <a title="Download PDF" onclick="downloadPDF()"><i class="fa fa-file-pdf-o"></i></a>
  <a title="Download Text"  onclick="downloadText()"><i class="fa fa-file-text-o"></i></a>  
</div>           
                  </div>
                </div>
                
                
                
                
                

                
              </div>
              
              
              
              
              
              
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0" style="height: 580px;">                
                <table id="example1"class="table table-head-fixed  table-bordered table-striped dataTable dtr-inline" role="grid" aria-describedby="example1_info">
                  <thead>
                    <tr>
                     <th><b>Employee Id</b></th> <th><b>User Name</b></th><th><b>Employee Name</b></th><th><b>Mobile Number</b></th><th>Supervisor Name</th><th>Qr Code</th><th><b>Type</b></th><th></th><th></th>
                    </tr>
                  </thead>
                  <tbody>
				<c:forEach items="${message}" var="item">
					<tr >
						<td>${item.user_id}</td><td>${item.username}</td><td>${item.name}</td><td>${item.mobile}</td><td>${item.supervisorName}</td><td>${item.qr_code}</td><td>${item.type}</td><td><a href="?a=showAddEmployee&employeeId=${item.user_id}">Edit</a></td><td><button class="btn btn-danger" onclick="deleteEmployee(${item.user_id})">Delete</button></td>
					</tr>
				</c:forEach>
				
				
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            
            
            
            



<script>
  $(function () {
    
    $('#example1').DataTable({
      "paging": true,      
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
      "pageLength": 50
    });
  });
  
  document.getElementById("divTitle").innerHTML="Employee Master";
  
</script>