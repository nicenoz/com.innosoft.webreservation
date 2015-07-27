<!-- Footer -->
<footer class="navbar-inverse navbar-fixed-bottom footer-custom">
    <div class="container">
        <div class="row footer-margin">
         	<div data-toggle="collapse" data-target=".navbar-ex1-collapse"></div>
        	<div class="col-sm-1 collapse navbar-collapse navbar-ex1-collapse">
        		<img alt="" src="<c:url value='/img/logo.png' />" height="90" width="90" data-toggle="collapse"/>
        	</div>
          	<div class="col-sm-7">
          		<p class="footer-title-style"><span class="footer-data-style">Web Reservation</span></p>
          		<p class="footer-details-style">Version: <span class="footer-data-style"> 1.Beta </span></p>
          		<p class="footer-details-style">
          			Current User:
          			<span class="footer-data-style">
	          			<sec:authorize access="isAuthenticated()">
		  					<sec:authentication var="principal" property="principal"/>
								${principal.username}
						</sec:authorize> 
					</span>
				</p>
          		<p class="footer-details-style">Current Customer:</p>
            </div>
            <div class="col-sm-4">
          		<p class="footer-details-style">Created by: </p>
          		<p class="footer-details-style">Create Date: </p>
          		<p class="footer-details-style">Updated by:  </p>
          		<p class="footer-details-style">Update Date: </p>
            </div>
        </div>     
    </div>
</footer>

</body>
</html>