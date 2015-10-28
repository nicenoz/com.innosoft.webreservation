<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>Software - Email</title>

<div class="container">
	<div align="center">
		<div id="loginForm">
			<form method="post" action="sendEmail.do">
				<div class="container">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="panel panel-body-border">
								<div class="panel-heading">
									<h3 class="panel-title panel-title-custom">
										<b>Email</b>
									</h3>
								</div>
								<div class="panel-body">
									<fieldset>
										<input type="email" name="edit_email" class="form-control border-custom" id="edit_email" placeholder="To:" value="${SPRING_SECURITY_LAST_USERNAME}" /> 
										<br /> 
										<input type="text" name="edit_subject" class="form-control border-custom" id="edit_subject" maxlength="32" placeholder="Subject:" /> <br />
										<textarea cols="50" rows="10" class="form-control border-custom message-not-resizable" name="edit_message" id="edit_message" placeholder="Message ..."></textarea>
										<br /> 
										<input type="button" value="Send E-mail" onclick="cmdCalendarEditOk_OnClick()" class="btn btn-lg btn-success border-custom pull-right" />
									</fieldset>
									<br />
								</div>
							</div>
						</div>
						<div class="col-md-3"></div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Loading -->
<div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="Loading..." aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" style="width: 220px;">
		<div class="modal-content border-custom">
			<div class="modal-header">
				<h4 class="modal-title">Sending Mail...</h4>
			</div>
			<div class="modal-body">
				<img src="<c:url value='/img/progress_bar.gif' />"></img>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function cmdCalendarEditOk_OnClick() {
		var emailObject = new Object();

		emailObject.EMAIL_EMAIL = document.getElementById('edit_email').value;
		emailObject.EMAIL_MESSAGE = document.getElementById('edit_message').value;
		emailObject.EMAIL_SUBJECT = document.getElementById('edit_subject').value;

		var email = document.getElementById('edit_email');
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if (!filter.test(email.value)) {
			toastr.error(getMessage("E0007"));
			email.focus;
			return false;
		}
		
		var data = JSON.stringify(emailObject);

		$('#loading').modal('show');
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/api/email/send',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : data,
			statusCode : {
				200 : function() {
					$('#loading').modal('hide');
					toastr.info(getMessage("M0001"));
				},
				404 : function() {
					$('#loading').modal('hide');
					toastr.error(getMessage("E0002"));
				},
				400 : function() {
					$('#loading').modal('hide');
					toastr.error(getMessage("E0003"));
				}
			}
		});
	}
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>
