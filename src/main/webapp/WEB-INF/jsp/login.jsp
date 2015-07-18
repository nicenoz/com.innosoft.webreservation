<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Login page</title>

	<!-- Bootstrap Core CSS -->
    <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/css/landing-page.css' />" rel="stylesheet">
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet"/>
	
    <!-- Custom Fonts -->
    <link href="<c:url value='/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<style>

</style>
</head>
<body class="bodytopindent">
 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="${pageContext.request.contextPath}/">Web Reservation</a>
            </div>
        </div>
        <!-- /.container -->
    </nav>

<div class="container"> 
<section id="loginForm">
<form method="post" action="<c:url value='/j_spring_security_check' />" role="form">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-primary panel-custom">
                    <div class="panel-heading panel-custom">
                        <h3 class="panel-title ">Please Login</h3>
                    </div>
                    <div class="panel-body">
                        <fieldset>
                           	<input type="text" name="j_username" class="form-control btn-form-custom" id="j_username" size="30" maxlength="40" placeholder="Username"/>
                            <br />
                            <input type="password" name="j_password" class="form-control btn-form-custom" id="j_password" size="30" maxlength="32" placeholder="Password"/>
                            <br />
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                </label>
                            </div>
                            <br />
                            <input type="submit" value="Log in" class="btn btn-lg btn-primary btn-block btn-form-custom" />
                        </fieldset>
                        <br>
                        <p>
							<%-- <c:if test="${error == true}">
							<b class="error">Invalid login or password.</b>
							</c:if> --%>
							<b class="error"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></b>
					</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form></section>
</div>
	   <!-- Footer -->
    <footer class="navbar-inverse navbar-fixed-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="copyright text-muted small">Copyright &copy; Innosoft Solutions 2015. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>
		
		

 	<!-- jQuery -->
    <script src="<c:url value='/js/jquery.js'/>"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>


</body>
</html>