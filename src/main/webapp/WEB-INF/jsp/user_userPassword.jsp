<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>Software - Password</title>

<div class="container"> 
<section id="">
	<form action="" role="form">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-4 col-md-offset-4">
	                <div class="login-panel panel panel-body-border">
	                    <div class="panel-heading">
	                        <h3 class="panel-title "><b>Change Password</b></h3>
	                    </div>
	                    <div class="panel-body">
	                        <fieldset>
	                           	<input type="password" name="" class="form-control border-custom" id="OLD_PASSWORD" size="30" maxlength="40" placeholder="Current Password"/>
	                            <hr/>
	                            <input type="password" name="" class="form-control border-custom" id="USER_PASSWORD" size="30" maxlength="32" placeholder="New Password"/>
	                            <br />
	                            <input type="password" name="" class="form-control border-custom" id="CONFIRMED_USER_PASSWORD" size="30" maxlength="32" placeholder="Confirm Password"/>
	                            <br />
	                            <input type="button" value="Change Password" class="btn btn-lg btn-danger btn-block border-custom" onclick="ChangePassword_Onclick()"/>
	                        </fieldset>
	                        <br>
	                     </div>
	                     <span class="footer-data-style" id="name">
		          			<sec:authorize access="isAuthenticated()">
			  					<sec:authentication var="principal" property="principal"/>
								  <input id="USER_LOGIN" type="hidden" value="${principal.username}"></input>
							</sec:authorize> 
						 </span> 
	                </div>
	            </div>
	        </div>
	    </div>
	</form>
</section>
</div>

<script type="text/javascript">
function ChangePassword_Onclick()
{
	if(document.getElementById("OLD_PASSWORD").value != document.getElementById("USER_PASSWORD").value && 
	   document.getElementById("USER_PASSWORD").value == document.getElementById("CONFIRMED_USER_PASSWORD").value)
	{
		var userObject = new Object();
		
		userObject.USER_LOGIN = document.getElementById('USER_LOGIN').value;
		userObject.USER_PASSWORD = document.getElementById('CONFIRMED_USER_PASSWORD').value;
		
		var data = JSON.stringify(userObject);
		
	    $.ajax({
	        type: "POST",
	        url: '${pageContext.request.contextPath}/api/user/update',
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        data: data,
            statusCode: {
                200: function () {
                    toastr.success('Successfully Updated.');
                    window.setTimeout(function () { location.reload() }, 1000);
                },
                404: function () {
                    toastr.error("Not found.");
                },
                400: function () {
                    toastr.error("Bad request.");
                }
            }
	    });
	} else { 
		toastr.error("Password mismatch.");
	}
}

$(document).ready(function(){
	
});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>

