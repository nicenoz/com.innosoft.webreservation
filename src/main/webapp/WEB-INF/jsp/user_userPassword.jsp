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
								<h3 class="panel-title ">
									<b>Change Password</b>
								</h3>
							</div>
							<div class="panel-body">
								<fieldset>
									<!-- <input type="text" name="" class="form-control border-custom" id="DATABASE_PASSWORD" size="30" maxlength="40" placeholder="Database Password" /> -->
									<input type="password" name="" class="form-control border-custom" id="OLD_PASSWORD" size="30" maxlength="40" placeholder="Current Password" />
									<hr />
									<input type="password" name="" class="form-control border-custom" id="USER_PASSWORD" size="30" maxlength="32" placeholder="New Password" /> 
									<br />
									<input type="password" name="" class="form-control border-custom" id="CONFIRMED_USER_PASSWORD" size="30" maxlength="32" placeholder="Confirm Password" /> 
									<br /> 
									<input type="button" value="Change Password" class="btn btn-lg btn-danger btn-block border-custom" onclick="ChangePassword_Onclick()" />
								</fieldset>
								<br>
							</div>
							<span class="footer-data-style" id="name"> 
								<sec:authorize access="isAuthenticated()">
										<sec:authentication var="principal" property="principal" />
										<input id="USER_LOGIN" type="hidden" value="${principal.username}" />
								</sec:authorize>
							</span>
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
</div>


<!-- footer -->
<%@include file="include_secure_footer.jsp"%>

<script type="text/javascript">
	function ChangePassword_Onclick() {					
		var password = document.getElementById("USER_PASSWORD");
		var passwordRestriction =  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;  
		
		if ((document.getElementById("OLD_PASSWORD").value == "") || (document.getElementById("OLD_PASSWORD").value == null)) {
			toastr.warning('Current Password field is empty');
		} 
		else if((document.getElementById("USER_PASSWORD").value == "") || (document.getElementById("USER_PASSWORD").value == null)) {
			toastr.warning('New Password field is empty');
		} 
		else if((document.getElementById("CONFIRMED_USER_PASSWORD").value == "") || (document.getElementById("CONFIRMED_USER_PASSWORD").value == null)) {
			toastr.warning('Confirm Password field is empty');
		}
		else {
			if(password.value.match(passwordRestriction))   
			{   
				if (document.getElementById("OLD_PASSWORD").value != document.getElementById("USER_PASSWORD").value && document.getElementById("USER_PASSWORD").value == document.getElementById("CONFIRMED_USER_PASSWORD").value) {
					var userObject = {}; 
					var userLogin = document.getElementById('USER_LOGIN').value;
					var currentPassword = document.getElementById("OLD_PASSWORD").value;
					var newConfirmPassword = document.getElementById('CONFIRMED_USER_PASSWORD').value;
					
					userObject.USER_LOGIN = userLogin;
					userObject.USER_PASSWORD = newConfirmPassword;
					var data = JSON.stringify(userObject);  
					$('#loading').modal('show');
					$.ajax({
						type : 'GET',
						url : '${pageContext.request.contextPath}/api/user/checkCurrentPassword',
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						data : {'currentPassword':currentPassword},
						statusCode : {
							200 : function() {
								$.ajax({
									type : 'POST',
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
											toastr.error(getMessage("E0009"));
										},
										400 : function() {
											$('#loading').modal('hide');
											toastr.error(getMessage("E0003"));
										},
										409 : function(){
											$('#loading').modal('hide');
											toastr.error(getMessage("E0008"));
										}
									}
								});
							},
							404 : function() {
								$('#loading').modal('hide');
								toastr.error(getMessage("E0009"));
							},
							400 : function() {
								$('#loading').modal('hide');
								toastr.error(getMessage("E0003"));
							},
							409 : function() {
								$('#loading').modal('hide');
								toastr.error(getMessage("E0008"));
							}
						}
					});
				} else {
					toastr.error(getMessage("E0008"));
				}
				return true;  
			}  
			else  
			{   
				toastr.error('the password must contain between 8 to 15 characters with at least one lowercase letter, one uppercase letter, one numeric digit, and one special character');
				return false; 
			}  
		}
	}
</script>


