<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Password</title>

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
	                           	<input type="password" name="" class="form-control border-custom" id="oldpassword" size="30" maxlength="40" placeholder="Current Password"/>
	                            <hr/>
	                            <input type="password" name="" class="form-control border-custom" id="newpassword" size="30" maxlength="32" placeholder="New Password"/>
	                            <br />
	                            <input type="password" name="" class="form-control border-custom" id="confirmpassword" size="30" maxlength="32" placeholder="Confirm Password"/>
	                            <br />
	                            <input type="button" value="Change Password" class="btn btn-lg btn-danger btn-block border-custom" onclick="check()"/>
	                        </fieldset>
	                        <br>
	                     </div>
	                     <span class="footer-data-style" id="name">
		          			<sec:authorize access="isAuthenticated()">
			  					<sec:authentication var="principal" property="principal"/>
								  <input id="usernamelogin" type="hidden" value="${principal.username}"></input>
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
	function check()
	{
		if(document.getElementById("oldpassword").value != document.getElementById("newpassword").value && document.getElementById("newpassword").value == document.getElementById("confirmpassword").value)
		{
			var passwordObject = new Object();
			passwordObject.OLD_PASSWORD = document.getElementById('oldpassword').value;
			console.log(passwordObject.OLD_PASSWORD);
			passwordObject.USER_LOGIN = document.getElementById('usernamelogin').value;
			console.log(passwordObject.USER_LOGIN);
			passwordObject.USER_PASSWORD = document.getElementById('confirmpassword').value;
			console.log(passwordObject.USER_PASSWORD);
			
			var data = JSON.stringify(passwordObject);
			
		    $.ajax({
		        type: "POST",
		        url: '${pageContext.request.contextPath}/api/userPass/update',
		        contentType: "application/json; charset=utf-8",
		        dataType: "json",
		        data: data,
		        success: function (data) {
		            if (data.USER_ID > 0) {
		                toastr.success('Successfully updated.');
		                window.setTimeout(function () { location.reload() }, 1000);
		            } else {
		                toastr.error("Not updated.");
		            }
		        }
		    });
		}else{ alert("please check your password");}
	}
	$(document).ready(function(){
		
	});
</script>

<!-- footer -->
<%@include file="include_secure_copyright_footer.jsp"%>

