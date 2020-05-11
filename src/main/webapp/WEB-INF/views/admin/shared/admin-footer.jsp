
    <!-- footer -->
    <footer>
      <div class="container-fluid">
        <div class="row ">
          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row justify-content-center border-top pt-3">
              <div class="col-lg-6 text-center">
                <ul class="list-inline">
                  <li class="list-inline-item mr-2">
                    <a href="#" class="text-dark">DOST XII</a>
                  </li>

                </ul>
              </div>

            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- end of footer -->
   

    <script src="<c:url value='/static/js/jquery-3.3.1.min.js' />" ></script>
    <script src="<c:url value='/static/js/popper.min.js' />"></script>
    <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>
    <script src="<c:url value='/static/js/admin/script.js' />"></script>
    
    <script type="text/javascript">
    	var subcat = "${subcat}";
		if(subcat)
	    $("#"+subcat).addClass("current");
		
		
		var cat = "${cat}";
		 if(cat == 'RECRUITMENT' || cat == 'DEVELOPMENT' || cat == 'PERFORMANCE' || cat == 'RECOGNITION')
		 	  $("#primehrm_id").addClass("show");
		
 	 	   if(cat == 'RECRUITMENT')
			   $("#recruitment_id").addClass("show");
		   else  if(cat == 'DEVELOPMENT')
			   $("#development_id").addClass("show");
		   else  if(cat == 'PERFORMANCE')
			   $("#performance_id").addClass("show");
		   else  if(cat == 'RECOGNITION')
			   $("#rewards_id").addClass("show"); 
 	 	   
 	 	  if(cat == 'ABOUT')
 	 			$("#ABOUT").addClass("current");
 	 	  
 	 	  if(cat == 'DASHBOARD')
 	 	 		$("#DASHBOARD").addClass("current");
	
 	 	  if(cat == 'OTHERS')
	 	 		$("#OTHERS").addClass("current");
 	 	  
	</script>
  
  
  </body>
</html>