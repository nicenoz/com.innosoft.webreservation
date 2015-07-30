<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge/">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- CSS Links -->
<link href="<c:url value='/css/landing-page.css' />" rel="stylesheet" />
<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet" />
<link href="<c:url value='/css/toastr.css' />" rel="stylesheet" />
<link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css" />

	<!-- Scripts -->
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/toastr.js' />"></script>
<script src="<c:url value='/js/style.js'/>"></script>
<script src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script src="<c:url value='/js/date.js' />"></script>
</head>
<body class="bodytopindent">

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top topnav"
		role="navigation">
	<div class="container topnav">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Web
				Reservation</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav navbar-right">
				<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
				<li class="hidden"><a class="page-scroll"
					href="/webreservation/#page-top"></a></li>

				<li><a class="page-scroll" href="/webreservation/#about">About</a>
				</li>
				<li><a class="page-scroll" href="/webreservation/#software">Software</a>
				</li>
				<li><a class="page-scroll" href="/webreservation/#support">Support</a>
				</li>
				<li><sec:authorize access="isAuthenticated()">
						<a href="logout">Logout</a>
					</sec:authorize></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div class="container">
		<form method="post" action="" id="registrationForm">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="login-panel panel panel-primary panel-custom">
							<div class="panel-heading panel-custom">
								<h3 class="panel-title">Register</h3>
							</div>
							<div class="panel-body">
								<fieldset>
									<br /> <input type="email" name="REG_EMAIL_ADDRESS"	id="REG_EMAIL_ADDRESS" class="form-control input-form-custom" size="30" maxlength="30" placeholder="Email Address" /> <br />
									<input type="password" name="REG_PASSWORD" id="REG_PASSWORD" class="form-control input-form-custom" size="30" maxlength="30" placeholder="Password" /> <br /> 
									<input type="password" name="REG_CONFIRM_PASSWORD"	id="REG_CONFIRM_PASSWORD" class="form-control input-form-custom" size="30" 	maxlength="30" placeholder="Confirm Password" /> <br /> 
									<input type="button" class="btn btn-lg btn-primary btn-block btn-form-custom" onclick="cmdRegisterSendEmailOk_OnClick()" value="Submit" />
								</fieldset>
								<br />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Footer -->
	<footer class="navbar-inverse navbar-fixed-bottom">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="list-inline">
					<li><a class="page-scroll" href="/webreservation/#page-top">Home</a>
					</li>
					<li class="footer-menu-divider">&sdot;</li>
					<li><a class="page-scroll" href="/webreservation/#about">About</a>
					</li>
					<li class="footer-menu-divider">&sdot;</li>
					<li><a class="page-scroll" href="/webreservation/#software">Software</a>
					</li>
					<li class="footer-menu-divider">&sdot;</li>
					<li><a class="page-scroll" href="/webreservation/#support">Support</a>
					</li>
				</ul>
				<p class="copyright text-muted small">Copyright &copy; Your
					Innosoft Solutions 2015. All Rights Reserved</p>
			</div>
		</div>
	</div>
	</footer>


	<script type="text/javascript">
		//==================
		// Password Validation
		//==================  	
		jQuery.validator.setDefaults({
			debug : true,
			success : "valid"
		});

		$("#registrationForm").validate({
			rules : {
				REG_PASSWORD : "required",
				REG_CONFIRM_PASSWORD : {
					equalTo : "#REG_PASSWORD"
				}
			}
		});

		//=============================
		//Edit Detail OK Button Clicked 
		//=============================     
		function cmdRegisterSendEmailOk_OnClick() {
			var userObject = new Object();

			userObject.USER_LOGIN = document.getElementById('REG_EMAIL_ADDRESS').value;
			userObject.USER_PASSWORD = document.getElementById('REG_PASSWORD').value;

			var data = JSON.stringify(userObject);

			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/api/user/update',
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				data : data,
				statusCode : {
					200 : function() {
						alert("Succesfully send");
					},
					404 : function() {
						alert("Email Already Exist");
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
