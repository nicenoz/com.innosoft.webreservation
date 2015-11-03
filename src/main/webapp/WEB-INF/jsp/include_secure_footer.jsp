<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Footer -->
<footer class="navbar-inverse navbar-fixed-bottom footer-style">
    <div class="container">
        <div class="row">
         	<div data-toggle="collapse" data-target=".navbar-ex1-collapse"></div>
          	<div class="col-sm-6">
          		<p class="footer-title-style">Web Reservation</p>
          		<p class="footer-details-style">Version: <span class="footer-data-style"> Test 1.9 </span></p>
          		<p class="footer-details-style">
          			Current User:
          			<span class="footer-data-style" id="currentUserName">
	          			<sec:authorize access="isAuthenticated()">
		  					<sec:authentication var="principal" property="principal"/>
								<span>${principal.username}</span>
						</sec:authorize> 
					</span>
				</p>
          		<p class="footer-details-style hidden">Current Customer: <span class="footer-data-style"> Firstname Familyname </span></p>
            </div>
            <div class="col-sm-6">
          		<p class="footer-details-style">Created by: <span class="footer-data-style" id="EDIT_CREATED_BY"></span></p>
          		<p class="footer-details-style">Create Date: <span class="footer-data-style" id="EDIT_CREATE_DATE"></span></p>
          		<p class="footer-details-style">Updated by:  <span class="footer-data-style" id="EDIT_UPDATED_BY"></span></p>
          		<p class="footer-details-style">Update Date: <span class="footer-data-style" id="EDIT_UPDATE_DATE"></span></p>
            </div>
        </div>     
    </div>
</footer>

</body>
</html>