<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - Dashboard</title>
 
 <!-- Dashboard -->
<div class="container">
<div align="center" class="jumbotron jumbotron-padding">
<div class="page-wrapper">
    <div class="container-fluid">
        <br/>
        <br/>
        <div class="marginCenter">
            <div class="row">
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/user/user/">
                        <div class="panel panel-violet">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-info fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>User Information</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-violet-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/user/activity/">
                        <div class="panel panel-brown">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-thumb-tack fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Activity</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-brown-footer">
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

<div align="center" class="jumbotron jumbotron-padding">
<div class="page-wrapper">
    <div class="container-fluid">
        <br/>
        <br/>
        <div class="marginCenter">
            <div class="row">
            
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/user/userReport/">
                        <div class="panel panel-pink">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file-text-o fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="UsersCounts">&nbsp;</div>
                                        <div>User Report</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-pink-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/user/reservationReport/">
                        <div class="panel panel-gray">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-book fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Reservation Report</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer panel-gray-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-lg-4 col-md-4">
                    <a href="/webreservation/user/chargingReport/">
                        <div class="panel panel-orange">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-bar-chart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge" id="EventsCounts">&nbsp;</div>
                                        <div>Charging Report</div>
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

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>