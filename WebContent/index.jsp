
<style>
	@media screen and (min-width: 601px) {
  .labelFonts {
    font-size: 30px;
    font-style: italic;color: darkblue;font-weight: 800;
  }
}

/* If the screen size is 600px wide or less, set the font-size of <div> to 30px */
@media screen and (max-width: 600px) {
  .labelFonts {
    font-size: 15px;
    font-style: italic;color: darkblue;font-weight: 800;
  }
}
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="HomePageContent" value='${requestScope["outputObject"]}' />


<br>

<div class="row">
          <div class="col-12 col-sm-6 col-md-3" onclick="window.location='?a=showVisitors'">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-pencil-square-o"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Visitor Register</span>
                
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>

  
  <div class="col-12 col-sm-6 col-md-3" onclick="window.location='?a=showAddVisitor'">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-pencil-square-o"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Add Visitor</span>
                
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          
          
          
 <div class="col-l2 col-sm-6 col-md-3" onclick="window.location='?a=showEmployeeMaster'">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
              
              


                <h3>${HomePageContent.get('ActiveEmployees')}</h3>

                <p>Total Employees</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" onclick="window.location='?a=showEmployeeMaster'" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          
          
             
                
 <br>

<c:if test="${adminFlag eq true}">

        
                
		
		
		
		                  
                
        
        
      </div>
      
      <a id="back-to-top" href="#" class="btn btn-primary back-to-top" role="button" aria-label="Scroll to top">
      <i class="fas fa-chevron-up"></i>
    </a>
    
    </section>
    </c:if>
    
    
    <!-- below is the link to find more icons -->
<!-- https://www.tutorialspoint.com/ionic/ionic_icons.htm -->


<script type="text/javascript">
        $( function() 
        		{
            $( "#txtfromdate" ).datepicker({ dateFormat: 'dd/mm/yy' });
            $( "#txttodate" ).datepicker({ dateFormat: 'dd/mm/yy' });
            
                       
            
          } );
        
        
        
        
        document.getElementById("divTitle").innerHTML="<p1 class='labelFonts'>SKP Security Gate</p1>";
        </script>
        
        