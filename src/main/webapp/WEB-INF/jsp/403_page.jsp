<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Error 404!</title>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge/">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- CSS Links -->
<link href="<c:url value='/css/alertify.core.css' />" rel="stylesheet" />
<link href="<c:url value='/css/alertify.default.css' />" rel="stylesheet" />
<link href="<c:url value='/css/landing-page.css' />" rel="stylesheet" />
<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet" />
<link href="<c:url value='/css/toastr.css' />" rel="stylesheet" />
<link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
<link href="<c:url value='/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />

<!-- Scripts -->
<script src="<c:url value='/js/alertify.min.js'/>"></script>
<script src="<c:url value='/js/jquery.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/jquery.validate.js' />"></script>
<script src="<c:url value='/js/toastr.js' />"></script>
<script src="<c:url value='/js/style.js'/>"></script>
<script src="<c:url value='/js/message.js'/>"></script>
<script src="<c:url value='/js/jquery.easing.min.js'/>"></script>
<script src="<c:url value='/js/date.js' />"></script>

<!-- Wijmo -->
<script src="<c:url value='/wijmo/controls/wijmo.min.js' />" type="text/javascript"></script>
<script src="<c:url value='/wijmo/controls/wijmo.input.min.js' />"></script>
<script src="<c:url value='/wijmo/controls/wijmo.grid.min.js' />" type="text/javascript"></script>
<script src="<c:url value='/wijmo/controls/wijmo.chart.min.js' />"></script>
<link href="<c:url value='/wijmo/styles/wijmo.min.css' />" rel="stylesheet" />
</head>
<body>
<br /><br /><br /><br />
<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="panel panel-danger border-custom">
			<div class="panel-heading">
				<h3 class="panel-title "><i class="fa fa-exclamation-triangle"></i> Sorry, Access Denied!</h3>
			</div>
		<div class="panel-body">
			 <img class="img-responsive" src="<c:url value='/img/403_Error.png'/>" alt="">
		</div>
		<div class="panel-footer">
			<center>
				<a href="${pageContext.request.contextPath}/" class="btn btn-default btn-lg"><i class="fa fa-arrow-left"></i> Back</a>
			</center>
		</div>
	<div class="col-md-2"></div>
</div>	
		</div>
	</div>
</div>
</body>
</html>