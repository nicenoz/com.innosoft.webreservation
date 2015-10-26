<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Password</title>

<div class="container">

	<!-- Loading -->
	<div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="Loading..." aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" style="width: 220px;">
			<div class="modal-content border-custom">
				<div class="modal-header">
					<h4 class="modal-title">Sending Email...</h4>
				</div>
				<div class="modal-body">
					<img src="<c:url value='/img/progress_bar.gif' />"></img>
				</div>
			</div>
		</div>
	</div>

	<section id="">
		<form action="" role="form">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="login-panel panel panel-body-border">
							<div class="panel-heading">
								<h3 class="panel-title ">
									<b>Change Password</b>
								</h3>
							</div>
							<div class="panel-body">
								<fieldset>
									<input type="text" name="" class="form-control border-custom" id="Email" size="30" maxlength="40" placeholder="Email" required/>
									<hr />
									<input type="password" name="" class="form-control border-custom" id="newpassword" size="30" maxlength="32" placeholder="New Password" required/>
									<br /> 
									<input type="password" name="" class="form-control border-custom" id="confirmpassword" size="30" maxlength="32" placeholder="Confirm Password" required/> 
									<br /> 
									<input type="button" value="Change Password" class="btn btn-lg btn-danger btn-block border-custom" id="cmdUserPassword" onclick="check()" />
								</fieldset>
								<br>
							</div>
							<span class="footer-data-style" id="name"> 
							<sec:authorize access="isAuthenticated()">
									<sec:authentication var="principal" property="principal" />
									<input id="usernamelogin" type="hidden" value="${principal.username}" />
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
	function check() {
		if (document.getElementById("newpassword").value == document.getElementById("confirmpassword").value) {
			var passwordObject = new Object();
			passwordObject.USER_LOGIN = document.getElementById('Email').value;
			passwordObject.USER_PASSWORD = document.getElementById('confirmpassword').value;

			var data = JSON.stringify(passwordObject);

			var email = document.getElementById('Email');
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

			if (!filter.test(email.value)) {
				toastr.error(getMessage("E0007"));
				email.focus;
				return false;
			}
			
			$('#loading').modal('show');
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/api/user/update',
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				data : data,
				statusCode : {
					200 : function() {
						$('#loading').modal('hide');
						toastr.success(getMessage("S0003"));
						window.setTimeout(function() {
							location.reload()
						}, 1000);
					},
					404 : function() {
						$('#loading').modal('hide');
						toastr.error(getMessage("E0007"));
					},
					400 : function() {
						$('#loading').modal('hide');
						toastr.error(getMessage("E0003"));
					}
				}
			});
		} else {
			toastr.error(getMessage("E0008"));
		}
	}

	$(document).ready(function() {
	
	
	});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>

