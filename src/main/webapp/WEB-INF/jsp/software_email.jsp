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
			                       <h3 class="panel-title panel-title-custom"><b>Email</b></h3>
			                   </div>
			                   <div class="panel-body">
			                      	<fieldset>
										<input type="email" name="edit_email" class="form-control border-custom" id="edit_email" size="40" maxlength="40" placeholder="To:"  value="${SPRING_SECURITY_LAST_USERNAME}"/>
			                           	<br />
			                           	<input type="text" name="edit_subject" class="form-control border-custom" id="edit_subject" size="40" maxlength="32" placeholder="Subject:"/>
			                           	<br />
			                          	<textarea cols="50" rows="10" class="form-control border-custom message-not-resizable" name="edit_message" id="edit_message" placeholder="Message ..."></textarea>
			                          	<br />
			                           	<input type="button" value="Send E-mail" onclick="cmdCalendarEditOk_OnClick()" class="btn btn-lg btn-success border-custom pull-right" />
			                       	</fieldset>
			                       	<br/>
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

	<script type="text/javascript">
		// =============================
		// Edit Detail OK Button Clicked
		// =============================     
		function cmdCalendarEditOk_OnClick() {
			var emailObject = new Object();

			emailObject.EMAIL_EMAIL = document.getElementById('edit_email').value;
			emailObject.EMAIL_MESSAGE = document.getElementById('edit_message').value;
			emailObject.EMAIL_SUBJECT = document.getElementById('edit_subject').value;

			var data = JSON.stringify(emailObject);

			$.ajax({
						type : "POST",
						url : '${pageContext.request.contextPath}/api/email/send',
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						data : data,
						statusCode : {
							200 : function() {
								alert("Succesfully send");
							},
							404 : function() {
								alert("Not found");
							},
							400 : function() {
								alert("Bad Request");
							}
						}
					});

		}
	</script>

<!-- footer -->
<%@include file="include_secure_copyright_footer.jsp"%>