<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
   	<meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge/">
   	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
	
	<!-- CSS Links -->
	<link href="<c:url value='/css/landing-page.css' />" rel="stylesheet"/>
	<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet"/>
	<link href="<c:url value='/css/toastr.css' />" rel="stylesheet"/>
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet"/>
	
	<!-- Scripts -->
	<script src="<c:url value='/js/jquery.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/toastr.js' />"></script>
	<script src="<c:url value='/js/style.js'/>"></script>
	<script src="<c:url value='/js/jquery.easing.min.js'/>"></script>	
	<script src="<c:url value='/js/date.js' />"></script>	
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

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
                      <a class="page-scroll" href="#about">About</a>
                  </li>
                  <li>
                      <a class="page-scroll" href="#software">Software</a>
                  </li>
                  <li>
                      <a class="page-scroll" href="#support">Support</a>
                  </li>
                  <li>
                    <sec:authorize access="isAuthenticated()">
						<a href="logout">Logout</a>
					</sec:authorize> 
                  </li>   
              </ul>
           </div>
            <!-- /.navbar-collapse -->
        </div>
     <!-- /.container -->
</nav>
