<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>System Dashboard</title>

	<!-- Bootstrap Core CSS -->
    <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="<c:url value='/css/landing-page.css' />" rel="stylesheet"/>
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet"/>
	
    <!-- Custom Fonts -->
    
    <link href="<c:url value='/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="<c:url value='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic'/>" rel="stylesheet" type="text/css"/>
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
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">Schedule <span class="caret"></span></a>
                        <ul class="dropdown-menu">
				            <li><a href="/webreservation/software/"><b>Schedule</b></a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/software/email/">Email</a></li>
				            <li><a href="/webreservation/software/charging/">Charging</a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/software/userPassword/">Password</a></li>     
				         </ul>
                    </li>
   
                    <li class="dropdown">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">User <span class="caret"></span></a>
                        <ul class="dropdown-menu">
				            <li><a href="/webreservation/user/"><b>User Dashboard</b></a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/user/user/">User Information</a></li>
				            <li><a href="/webreservation/user/activity">Activity</a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/user/userReport/">User Report</a></li>
				            <li><a href="/webreservation/user/reservationReport/">Reservation Report</a></li>
				            <li><a href="/webreservation/user/chargingReport/">Charging Report</a></li>    
				         </ul>
                     </li>     
                         		
        			<li class="dropdown active">
        				<a class="dropdown-toggle" data-toggle="dropdown" href="#">System <span class="caret"></span></a>
                        <ul class="dropdown-menu">
				            <li><a href="/webreservation/system/"><b>System Dashboard</b></a></li>
				            <li class="divider"></li>
				            <li><a href="/webreservation/system/calendar/">Calendar</a></li>
				            <li><a href="/webreservation/system/time/">Time</a></li>
				            <li><a href="/webreservation/system/userPassword/">Password</a></li>
				            <li><a href="/webreservation/system/customer/">Customer</a></li>
				            <li><a href="/webreservation/system/message/">Message</a></li>
				            <li><a href="/webreservation/system/charge/">Charge</a></li>
				            <li><a href="/webreservation/system/code/">Code</a></li>      
				         </ul>
                    </li>		                    
                </ul>
            </div>   
    </div>
</nav>

<div class="container">
<div align="center" class="jumbotron jumbotron-padding">
<div class="page-wrapper">
    <div class="container-fluid">
        <br/>
        <br/>
        <div class="marginCenter">
            <div class="row">
            
              <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/system/calendar/">
                        <div class="panel panel-dark-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-calendar fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Calendar</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-dark-green-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/system/time/">
                        <div class="panel panel-brownish">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-clock-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Time</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-brownish-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/system/userPassword/">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-key fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Password</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-red-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/system/customer/">
                        <div class="panel panel-dark-brown">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-users fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Customers</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-dark-brown-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/system/message/">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-envelope-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Messege</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-yellow-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/system/charge/">
                        <div class="panel panel-orange">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-bar-chart-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Charge</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-orange-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/system/code/">
                        <div class="panel panel-dark-blue">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-code fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Code</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-dark-blue-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>            
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>
</div>
</div>

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