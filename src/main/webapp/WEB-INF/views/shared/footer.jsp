
  <!-- FOOTER -->
   <div id="main-footer" class=" page-footer py-5 bg-primary text-white">
    <div class="container">
      <div class="row text-center">
        <div class="col-md-6 ml-auto">
          <p class="lead">
            DOST XII-ICT &copy; 2020
          </p>
          <small style="color:#3ebdd8">Developed by Ras Pangcoga</small> 
        </div>
         
      </div>
    	
    </div>
  </div> 
  
 



  <script src="<c:url value='/static/js/jquery-3.3.1.min.js' />" ></script>
  <script src="<c:url value='/static/js/popper.min.js' />"></script>
  <script src="<c:url value='/static/js/bootstrap.min.js' />"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    // Init Scrollspy
    $('body').scrollspy({ target: '#main-nav' });

    // Smooth Scrolling
    $("#main-nav a").on('click', function (event) {
      if (this.hash !== "") {
        event.preventDefault();

        const hash = this.hash;

        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 800, function () {

          window.location.hash = hash;
        });
      }
    });
    

    
  </script>
   <script src="<c:url value='/static/js/myjs.js' />"></script>

<!--

//-->
</script>
</body>

</html>