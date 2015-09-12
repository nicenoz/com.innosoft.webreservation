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
								<div class="panel-body">
									<fieldset>
										<div id="TIME" class="autocomplete-wide"></div>
										<input id="TIME_DATA" class="form-control border-custom" name="TIME_DATA" type="hidden" required />
										<br />
										<br /> 
										<input type="button" value="Set" onclick="" class="btn btn-lg btn-primary btn-block border-custom pull-right" />
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
	$(document).ready(
		function() {
	
			var cmb = new wijmo.input.ComboBox('#TIME', {
				itemsSource : getTimes(),
				placeholder : 'select a country',
				isEditable : false
			});
	
			function getTimes() {
				return [ '1 am', '2 am', '3 am', '4 am', '5 am',
						'6 am', '7 am', '8 am', '9 am', '10 am',
						'11 am', '12 am', '1 pm', '2 pm', '3 pm',
						'4 pm', '5 pm', '6 pm', '7 pm', '8 pm',
						'9 pm', '10 pm', '11 pm', '12 pm', ];
			}

	});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>