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
										<b>Notification Email</b>
									</h3>
								</div>
								<div class="panel-body" align="left">
									<fieldset>
										<br />
										<label>Time Set:</label>
										<div id="TIME" class="autocomplete-wide"></div>
										<input id="TIME_DATA" class="form-control border-custom" name="TIME_DATA" type="hidden" required />
										<br /><br />
										<label>No. of Days:</label>
										<div id="NO_OF_DAYS" class="autocomplete-wide"></div>
										<input id="TIME_DATA" class="form-control border-custom" name="TIME_DATA" type="hidden" required />
										<br /><br /><br />
										<input type="button" value="Set" onclick="postItem();" class="btn btn-lg btn-primary btn-block border-custom pull-right" />
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
var cmb;
	$(document).ready(
		function() {
	
			cmbSetStime = new wijmo.input.ComboBox('#TIME', {
				itemsSource : getTimes(),
				placeholder : 'Set a time',
				isEditable : false
			});
			 
			cmbSetNoOfDays = new wijmo.input.ComboBox('#NO_OF_DAYS', {
				itemsSource : getDays(),
				placeholder : 'Set No. of Days',
				selectedValue : '3',
				isEditable : false
			});
	
			function getTimes() {
				return [ '1 AM', '2 AM', '3 AM', '4 AM', '5 AM',
						'6 AM', '7 AM', '8 AM', '9 AM', '10 AM',
						'11 AM', '12 AM', '1 PM', '2 PM', '3 PM',
						'4 PM', '5 PM', '6 PM', '7 PM', '8 PM',
						'9 PM', '10 PM', '11 PM', '12 PM', ];
			}
			
			function getDays() {
				return [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',];
			}


	});
	
	
	function postItem(){
		var settingsObject = new Object();
		
		settingsObject.SSET_NOTIFICATION_TIME = cmbSetStime.selectedValue;
		settingsObject.SSET_NOTIFICATION_NO_OF_DAYS = cmbSetNoOfDays.selectedValue;
		
		var data = JSON.stringify(settingsObject);
		
		$('#loading').modal('show');
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/api/settings/update',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : data,
			statusCode : {
				200 : function() {
					$('#loading').modal('hide');
					toastr.success(getMessage("S0002"));
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