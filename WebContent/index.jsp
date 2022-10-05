
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



  
 
 <br>

<c:if test="${adminFlag eq true}">





                
                
                
                
		
		
		
		                  
                
        
        
      </div><!-- /.container-fluid -->
      
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
        
        