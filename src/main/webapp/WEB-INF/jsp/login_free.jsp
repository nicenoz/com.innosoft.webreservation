<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>Login - Free User</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="<c:url value='/css/landing-page.css' />" rel="stylesheet"/>
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet"/>
	<link href="<c:url value='/css/alertify.core.css' />" rel="stylesheet"/>
	<link href="<c:url value='/css/alertify.default.css' />" rel="stylesheet"/>
	
    <!-- Custom Fonts -->
    <link href="<c:url value='/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css"/>
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css"/>
    
    <!-- Scripts -->
    <script src="<c:url value='/js/alertify.min.js'/>"></script>
</head>
<body class="bodytopindent">

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top topnav" role="navigation">
      	 <div class="container topnav">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                 <span class="sr-only">Toggle navigation</span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
             </button>
             <a class="navbar-brand" href="${pageContext.request.contextPath}/">Web Reservation</a>
         </div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav navbar-right">
                  <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                  <li class="hidden">
                      <a class="page-scroll" href="#page-top"></a>
                  </li>
                  <li>
                      <a class="page-scroll" href="/webreservation/#about">About</a>
                  </li>
                  <li>
                      <a class="page-scroll" href="/webreservation/#software">Software</a>
                  </li>
                  <li>
                      <a class="page-scroll" href="/webreservation/#support">Support</a>
                  </li>
              </ul>
           </div>
            <!-- /.navbar-collapse -->
        </div>
     <!-- /.container -->
</nav>
 
<div class="container"> 
	<form action="" role="form">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-4 col-md-offset-4">
	                <div class="login-panel panel panel-body-border">
	                    <div class="panel-heading">
	                        <h3 class="panel-title ">Login as Free</h3>
	                    </div>
	                    <div class="panel-body">
	                        <fieldset>
	                           	<input type="email" name="" id="EDIT_EMAIL_ADDRESS" class="form-control border-custom" size="30" maxlength="30" value="${Email}" placeholder="Email Address"/>
	                            <br />
	                            <button type="button" id="cmdLoginFree" class="btn btn-lg btn-primary btn-block border-custom" onclick="cmdLoginFree_OnClick()">
		                           		Submit
		                        </button>
		                        <a href="/webreservation/login" class="btn btn-lg btn-success btn-block border-custom">Change Login</a>
	                        </fieldset>
	                        <br>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</form>
</div>

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

<!-- Footer -->
<footer class="navbar-inverse navbar-fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-inline">
                    <li>
                        <a class="page-scroll" href="/webreservation/#page-top">Home</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a class="page-scroll" href="/webreservation/#about">About</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a class="page-scroll" href="/webreservation/#software">Software</a>
                    </li>
                    <li class="footer-menu-divider">&sdot;</li>
                    <li>
                        <a class="page-scroll" href="/webreservation/#support">Support</a>
                    </li>
                </ul>
                <p class="copyright text-muted small">Copyright &copy; Your Innosoft Solutions 2015. All Rights Reserved</p>
            </div>
        </div>
    </div>
</footer>
		
<!-- jQuery -->
<script src="<c:url value='/js/jquery.js'/>"></script>

<!-- Style JS -->
<script src="<c:url value='/js/style.js'/>"></script>

<!-- jQuery -->
<script src="<c:url value='/js/jquery.easing.min.js'/>"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>



<script type="text/javascript">  
	function cmdLoginFree_OnClick() {
		var userEmailObject = new Object();

		userEmailObject.USER_LOGIN = document.getElementById('EDIT_EMAIL_ADDRESS').value;

		var data = JSON.stringify(userEmailObject);
		
	    $('#loading').modal('show');
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}/api/user/loginFreeUser',
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : data,
			statusCode : {
				200 : function() {
					$('#loading').modal('hide');
					alertify.alert("Succesfully send Email");
				},
				404 : function() {
					$('#loading').modal('hide');
					alertify.alert("Email Already Exist");
				},
				400 : function() {
					$('#loading').modal('hide');
					alertify.alert("Bad Request");
				}
			}
		});
	
	}
</script>


</body>
</html>