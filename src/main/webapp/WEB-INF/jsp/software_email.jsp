<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	
	<title>System - Email</title>

	<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/toastr.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/font-awesome/css/font-awesome.min.css' />" rel="stylesheet"></link>
	
	<script src="<c:url value='/js/jquery.js' />"></script>
	<script src="<c:url value='/lib/bootstrap/js/bootstrap.js' />"></script>
	<script src="<c:url value='/js/jquery.validate.js' />"></script>
	<script src="<c:url value='/js/toastr.js' />"></script>
	<script src="<c:url value='/js/jquery.slimscroll.min.js' />"></script>
	
	<script src="<c:url value='/js/date.js' />"></script>
	
	<script src="<c:url value='/wijmo/controls/wijmo.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.input.min.js' />"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.grid.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.chart.min.js' />"></script>
	
	<link href="<c:url value='/wijmo/styles/wijmo.min.css' />" rel="stylesheet" />
</head>

<body class="bodytopindent">

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top topnav"
		role="navigation">
	<div class="container topnav">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand topnav"
				href="${pageContext.request.contextPath}/">Web Reservation</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown active"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Schedule <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webreservation/software/"><b>Schedule</b></a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/software/email/">Email</a></li>
						<li><a href="/webreservation/software/charging/">Charging</a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/software/userPassword/">Password</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">User <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webreservation/user/"><b>User Dashboard</b></a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/user/user/">User Information</a></li>
						<li><a href="/webreservation/user/activity">Activity</a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/user/userReport/">User
								Report</a></li>
						<li><a href="/webreservation/user/reservationReport/">Reservation
								Report</a></li>
						<li><a href="/webreservation/user/chargingReport/">Charging
								Report</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">System <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webreservation/system/"><b>System
									Dashboard</b></a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/system/calendar/">Calendar</a></li>
						<li><a href="/webreservation/system/time/">Time</a></li>
						<li><a href="/webreservation/system/userPassword/">Password</a></li>
						<li><a href="/webreservation/system/customer/">Customer</a></li>
						<li><a href="/webreservation/system/message/">Message</a></li>
						<li><a href="/webreservation/system/charge/">Charge</a></li>
						<li><a href="/webreservation/system/code/">Code</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container">
		<center>
			<h1>Sending e-mail with Spring MVC</h1>
			<form method="post" action="sendEmail.do">
				<table border="0" width="80%">
					<tr>
						<td>To:</td>
						<td><input type="text" name="edit_email" id="edit_email"
							size="65" /></td>
					</tr>
					<tr>
						<td>Subject:</td>
						<td><input type="text" name="edit_subject" id="edit_subject"
							size="65" /></td>
					</tr>
					<tr>
						<td>Message:</td>
						<td><textarea cols="50" rows="10" name="edit_message"
								id="edit_message"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
							value="Send E-mail" onclick="cmdCalendarEditOk_OnClick()" /></td>
					</tr>
				</table>
			</form>
		</center>
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

</body>
</html>