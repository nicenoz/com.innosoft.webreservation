<?xml version="1.0" encoding="ISO-8859-1" ?>
 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	
	<title>System - Customer</title>

	<link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/css/toastr.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/font-awesome/css/font-awesome.min.css' />" rel="stylesheet"></link>
	
	<script src="<c:url value='/js/jquery.js' />"></script>
	<script src="<c:url value='/lib/bootstrap/js/bootstrap.js' />"></script>
	<script src="<c:url value='/js/jquery.validate.js' />"></script>
	<script src="<c:url value='/js/toastr.js' />"></script>
	
	<script src="<c:url value='/js/date.js' />"></script>
	
	<script src="<c:url value='/wijmo/controls/wijmo.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.input.min.js' />"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.grid.min.js' />" type="text/javascript"></script>
	<script src="<c:url value='/wijmo/controls/wijmo.chart.min.js' />"></script>
	
	<link href="<c:url value='/wijmo/styles/wijmo.min.css' />" rel="stylesheet" />
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


<!-- Calendar List -->
<div class="container"> 
<section id="customerList">
	<div class="row">
	    <div class="col-lg-12">
	        <h4>Calendar List</h4>
	    </div>
	</div>
	<div class="row">
	    <div class="col-lg-4">
	        <div class="input-group">
	            <span class="input-group-btn">
	                <button class="btn btn-default btn-extend-padding btn-form-custom" type="button" readonly>
	                <i class="fa fa-search"></i>
	                </button>
	            </span>
	            <input type="text" class="form-control input-form-custom" id="InputFilter" placeholder="Search...">
	        </div>
	    </div>
	    <div class="col-lg-8">
	        <button id="cmdAddProduct" type="submit" class="btn btn-primary pull-right btn-form-custom" onclick="cmdProductAdd_OnClick()">Add</button>
	    </div>
	</div>
	<br />
	<div class="row table-form-custom">
	    <div class="col-lg-12 table-form-custom">
	        <div id="CalendarGrid" class="grid table-form-custom"></div>
	    </div>
	</div>
	
	<br />
	
	<div class="row">
	    <div class="btn-group col-md-7" id="naviagtionPageGrid">
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToFirstPageGrid">
	            <span class="glyphicon glyphicon-fast-backward"></span>
	        </button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToPreviousPageGrid">
	            <span class="glyphicon glyphicon-step-backward"></span>
	        </button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" disabled style="width:100px" id="btnCurrentPageGrid"></button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToNextPageGrid">
	            <span class="glyphicon glyphicon-step-forward"></span>
	        </button>
	        <button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToLastPageGrid">
	            <span class="glyphicon glyphicon-fast-forward"></span>
	        </button>
	    </div>
	</div>
</section>
</div>

<!-- Loading -->
<div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="Loading..." aria-hidden="true">
    <div class="modal-dialog" style="width: 220px;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Loading...</h4>
            </div>
            <div class="modal-body">
                <img src="<c:url value='/img/progress_bar.gif' />"></img>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    var calendar;
    var customerGrid;

    var btnFirstPageGrid;
    var btnPreviousPageGrid;
    var btnNextPageGrid;
    var btnLastPageGrid;
    var btnCurrentPageGrid;

    function cmdCalendarEdit_OnClick() {
        calendar.editItem(calendar.currentItem);

        $('#CalendarEdit').modal({
            show: true,
            backdrop: false
        });

        //var Calendar = Calendars.currentEditItem;
        //document.getElementById('CalendarEdit_Id').value = Calendar.Id !== null && typeof (Calendar.Id) != 'undefined' ? wijmo.Globalize.format(Calendar.Id) : '';
        //document.getElementById('CalendarEdit_CalendarDescription').value = Calendar.CalendarDescription ? Calendar.CalendarDescription : '';

    }
    
    function cmdCalendarAdd_OnClick() {
        $('#CalendarEdit').modal({
            show: true,
            backdrop: false
        });

        //document.getElementById('CalendarEdit_Id').value = 0;
        //document.getElementById('CalendarEdit_CalendarDescription').value = "";

    }
    
    function cmdCalendarDelete_OnClick() {
        calendar.editItem(calendar.currentItem);

/*         var Id = Calendars.currentEditItem.Id;
        var CalendarDescription = Calendars.currentEditItem.CalendarDescription;

        if (confirm("Delete " + CalendarDescription + "?") == true) {
            $.ajax({
                type: "DELETE",
                url: "/api/DeleteCalendar/" + Id,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                statusCode: {
                    200: function () {
                        toastr.success('Successfully Deleted!');
                        window.setTimeout(function () { location.reload() }, 3000);
                    },
                    404: function () {
                        toastr.error("Not found!");
                    },
                    400: function () {
                        toastr.error("Bad request");
                    }
                }
            });
        } */
    }
    function cmdCalendarEditOkFunction() {
	    var Calendar = new Object();
	
	    Calendar.Id = document.getElementById('CalendarEdit_Id').value;
	    Calendar.CalendarDescription = document.getElementById('CalendarEdit_CalendarDescription').value;
	
	    var data = JSON.stringify(Calendar);
	
	    // Add New
	    if (Calendar.Id == 0) {
	        $.ajax({
	            type: "POST",
	            url: "/api/AddCalendar",
	            contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            data: data,
	            success: function (id) {
	                if (id > 0) {
	                    toastr.success('Successfully Added!');
	                    window.setTimeout(function () { location.reload() }, 3000);
	                } else {
	                    toastr.error("Not added!");
	                }
	            }
	        });
	
	        // Edit
	    } else {
	        $.ajax({
	            type: "PUT",
	            url: "/api/UpdateCalendar/" + Calendar.Id,
	            contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            data: data,
	            statusCode: {
	                200: function () {
	                    toastr.success('Successfully Modified!');
	                    window.setTimeout(function () { location.reload() }, 3000);
	                },
	                404: function () {
	                    toastr.error("Not found!");
	                },
	                400: function () {
	                    toastr.error("Bad request");
	                }
	            }
	        });
	    }
    }
    function getCalendars() {
        var calendar = new wijmo.collections.ObservableArray();
        $('#loading').modal('show');
        $.ajax({
            url: '${pageContext.request.contextPath}/api/calendar/list',
            cache: false,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            data: {},
            success: function (Results) {
                $('#loading').modal('hide');
                if (Results.length > 0) {
                    for (i = 0; i < Results.length; i++) {
                        calendar.push({
                            EditId: "<button class='btn btn-primary btn-xs btn-form-custom' data-toggle='modal' id='cmdEditCalendar' onclick='cmdCalendarEdit_OnClick()'>Edit</button>",
                            DeleteId: "<button class='btn btn-danger btn-xs btn-form-custom' data-toggle='modal' id='cmdDeleteCalendar' onclick='cmdCalendarDelete_OnClick()'>Delete</button>",
                            Id: Results[i]["cldr_ID"],
                            Date: Results[i]["cldr_DATE"],
                        	DayCode: Results[i]["cldr_DAYCODE"],
                            CalendarNote: Results[i]["cldr_NOTE"]
                        });
                    }
                } else {
                    alert("No data.");
                }
            }
        }).fail(
            function (xhr, textStatus, err) {
                alert(err);
            }
        );
        return calendar;
    }
    function updateNavigateButtonsCalendar() {
        if (calendar.pageSize <= 0) {
            document.getElementById('naviagtionPageGrid').style.display = 'none';
            return;
        }
        document.getElementById('naviagtionPageGrid').style.display = 'block';
        if (calendar.pageIndex === 0) {
            btnFirstPageGrid.setAttribute('disabled', 'disabled');
            btnPreviousPageGrid.setAttribute('disabled', 'disabled');
            btnNextPageGrid.removeAttribute('disabled');
            btnLastPageGrid.removeAttribute('disabled');
        }
        else if (calendar.pageIndex === (Calendars.pageCount - 1)) {
            btnFirstPageGrid.removeAttribute('disabled');
            btnPreviousPageGrid.removeAttribute('disabled');
            btnLastPageGrid.setAttribute('disabled', 'disabled');
            btnNextPageGrid.setAttribute('disabled', 'disabled');
        }
        else {
            btnFirstPageGrid.removeAttribute('disabled');
            btnPreviousPageGrid.removeAttribute('disabled');
            btnNextPageGrid.removeAttribute('disabled');
            btnLastPageGrid.removeAttribute('disabled');
        }
        btnCurrentPageGrid.innerHTML = (calendar.pageIndex + 1) + ' / ' + calendar.pageCount;
    }
    function FormValidate() {
        var validator = $('form').validate({
            submitHandler: function (form) {
                form.submit();
            }
        });
        var x = validator.form();
        console.log(x);
        return x;
    }
    $.validator.setDefaults({
        errorPlacement: function (error, element) {
            $(element).attr({ "title": error.append() });
        },
        highlight: function (element) {
            $(element).removeClass("textinput");
            $(element).addClass("errorHighlight");
        },
        unhighlight: function (element) {
            $(element).removeClass("errorHighlight");
            $(element).addClass("textinput");
        }
    });
    $(document).ready(function () {

        $('#CmdCalendarEditOk').click(function () {
            if (FormValidate() == true) {
                cmdCalendarEditOkFunction();
                $('#CalendarEdit').modal('hide');
            }
            else {
                toastr.error("Fill the required field!");
            }
        });

        $('#CmdCalendarEditCancel, .close').click(function () {
            $("form input").removeClass("errorHighlight");
            $('form')[0].reset();
            $('#CalendarEdit').modal('hide');
        });

        $('.close-btn').hide();

        btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
        btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
        btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
        btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
        btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

        calendar = new wijmo.collections.CollectionView(getCalendars());

        customerGrid = new wijmo.grid.FlexGrid('#CalendarGrid');

        calendar.canFilter = true;

        var filterText = '';

        $('#InputFilter').keyup(function () {
            filterText = this.value.toLowerCase();
            calendar.refresh();
        });

        calendar.filter = function (item) {
            return !filterText || (item.CalendarName.toLowerCase().indexOf(filterText) > -1);
        }

        customerGrid.initialize({
            columns: [
                        {
                            "header": "Edit",
                            "binding": "EditId",
                            "width": 60,
                            "allowSorting": false,
                            "isContentHtml": true
                        },
                        {
                            "header": "Delete",
                            "binding": "DeleteId",
                            "width": 60,
                            "allowSorting": false,
                            "isContentHtml": true
                        },
                        {
                            "header": "Date",
                            "binding": "Date",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "Day Code",
                            "binding": "DayCode",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "Calendar Note",
                            "binding": "CalendarNote",
                            "allowSorting": true,
                            "width": "2*"
                        }
            ],
            autoGenerateColumns: false,
            itemsSource: calendar,
            isReadOnly: true,
            selectionMode: wijmo.grid.SelectionMode.Row
        });

        customerGrid.trackChanges = true;

        calendar.pageSize = 15;

        calendar.collectionChanged.addHandler(function (sender, args) {
            updateNavigateButtonsCalendar();
        });

        updateNavigateButtonsCalendar();

        btnFirstPageGrid.addEventListener('click', function () {
            calendar.moveToFirstPage();
            updateNavigateButtonsCalendar();
        });
        btnPreviousPageGrid.addEventListener('click', function () {
            calendar.moveToPreviousPage();
            updateNavigateButtonsCalendar();
        });
        btnNextPageGrid.addEventListener('click', function () {
            calendar.moveToNextPage();
            updateNavigateButtonsCalendar();
        });
        btnLastPageGrid.addEventListener('click', function () {
            calendar.moveToLastPage();
            updateNavigateButtonsCalendar();
        });

    });
</script>

</body>
</html>