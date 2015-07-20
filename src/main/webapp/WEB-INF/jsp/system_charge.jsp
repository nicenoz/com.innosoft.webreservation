<?xml version="1.0" encoding="ISO-8859-1" ?>
  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	
	<title>System - Charge</title>

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

<!-- Charge List -->
<div class="container"> 
<section id="chargeList">
	<div class="row">
	    <div class="col-lg-12">
	        <h4>Charge List</h4>
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
	        <div id="ChargeGrid" class="grid table-form-custom"></div>
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
    var charges;
    var chargeGrid;

    var btnFirstPageGrid;
    var btnPreviousPageGrid;
    var btnNextPageGrid;
    var btnLastPageGrid;
    var btnCurrentPageGrid;
    
    function cmdChargeEdit_OnClick() {
        charges.editItem(charges.currentItem);

        $('#ChargeEdit').modal({
            show: true,
            backdrop: false
        });

        //var Charge = Charges.currentEditItem;
        //document.getElementById('ChargeEdit_Id').value = Charge.Id !== null && typeof (Charge.Id) != 'undefined' ? wijmo.Globalize.format(Charge.Id) : '';
        //document.getElementById('ChargeEdit_ChargeDescription').value = Charge.ChargeDescription ? Charge.ChargeDescription : '';

    }
    function cmdChargeAdd_OnClick() {
        $('#ChargeEdit').modal({
            show: true,
            backdrop: false
        });

        //document.getElementById('ChargeEdit_Id').value = 0;
        //document.getElementById('ChargeEdit_ChargeDescription').value = "";

    }
    function cmdChargeDelete_OnClick() {
        charges.editItem(charges.currentItem);

/*         var Id = Charges.currentEditItem.Id;
        var ChargeDescription = Charges.currentEditItem.ChargeDescription;

        if (confirm("Delete " + ChargeDescription + "?") == true) {
            $.ajax({
                type: "DELETE",
                url: "/api/DeleteCharge/" + Id,
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
    function cmdChargeEditOkFunction() {
	    var Charge = new Object();
	
	    Charge.Id = document.getElementById('ChargeEdit_Id').value;
	    Charge.ChargeDescription = document.getElementById('ChargeEdit_ChargeDescription').value;
	
	    var data = JSON.stringify(Charge);
	
	    // Add New
	    if (Charge.Id == 0) {
	        $.ajax({
	            type: "POST",
	            url: "/api/AddCharge",
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
	            url: "/api/UpdateCharge/" + Charge.Id,
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
    function getCharges() {
        var charges = new wijmo.collections.ObservableArray();
        $('#loading').modal('show');
        $.ajax({
            url: '${pageContext.request.contextPath}/api/charge/list',
            cache: false,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            data: {},
            success: function (Results) {
                $('#loading').modal('hide');
                if (Results.length > 0) {
                    for (i = 0; i < Results.length; i++) {
                        charges.push({
                            EditId: "<button class='btn btn-primary btn-xs btn-form-custom' data-toggle='modal' id='cmdEditCharge' onclick='cmdChargeEdit_OnClick()'>Edit</button>",
                            DeleteId: "<button class='btn btn-danger btn-xs btn-form-custom' data-toggle='modal' id='cmdDeleteCharge' onclick='cmdChargeDelete_OnClick()'>Delete</button>",
                            Id: Results[i]["chrg_ID"],
                            Chrg_CustID: Results[i]["chrg_CUST_ID"],
                            Chrg_Charge_No: Results[i]["chrg_CHARGE_NO"],
                            ChargeName: Results[i]["chrg_PRICE"],
                            Chrg_AppDivision: Results[i]["chrg_APP_DIVISION"],
                            Chrg_StartDate: Results[i]["chrg_APP_START_DATE"],
                            Chrg_EndDate: Results[i]["chrg_APP_END_DATE"],
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
        return charges;
    }
    function updateNavigateButtonsCharge() {
        if (charges.pageSize <= 0) {
            document.getElementById('naviagtionPageGrid').style.display = 'none';
            return;
        }
        document.getElementById('naviagtionPageGrid').style.display = 'block';
        if (charges.pageIndex === 0) {
            btnFirstPageGrid.setAttribute('disabled', 'disabled');
            btnPreviousPageGrid.setAttribute('disabled', 'disabled');
            btnNextPageGrid.removeAttribute('disabled');
            btnLastPageGrid.removeAttribute('disabled');
        }
        else if (charges.pageIndex === (Charges.pageCount - 1)) {
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
        btnCurrentPageGrid.innerHTML = (charges.pageIndex + 1) + ' / ' + charges.pageCount;
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

        $('#CmdChargeEditOk').click(function () {
            if (FormValidate() == true) {
                cmdChargeEditOkFunction();
                $('#ChargeEdit').modal('hide');
            }
            else {
                toastr.error("Fill the required field!");
            }
        });

        $('#CmdChargeEditCancel, .close').click(function () {
            $("form input").removeClass("errorHighlight");
            $('form')[0].reset();
            $('#ChargeEdit').modal('hide');
        });

        $('.close-btn').hide();

        btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
        btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
        btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
        btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
        btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

        charges = new wijmo.collections.CollectionView(getCharges());

        chargeGrid = new wijmo.grid.FlexGrid('#ChargeGrid');

        charges.canFilter = true;

        var filterText = '';

        $('#InputFilter').keyup(function () {
            filterText = this.value.toLowerCase();
            charges.refresh();
        });

        charges.filter = function (item) {
            return !filterText || (item.ChargeName.toLowerCase().indexOf(filterText) > -1);
        }

        chargeGrid.initialize({
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
                            "header": "Charge ID",
                            "binding": "Id",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "Cust ID",
                            "binding": "Chrg_CustID",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "Charge No",
                            "binding": "Chrg_Charge_No",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "Charge Price",
                            "binding": "ChargeName",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "App Division",
                            "binding": "Chrg_AppDivision",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "Start Date",
                            "binding": "Chrg_StartDate",
                            "allowSorting": true,
                            "width": "1*"
                        },
                        {
                            "header": "End Date",
                            "binding": "Chrg_EndDate",
                            "allowSorting": true,
                            "width": "1*"
                        }
            ],
            autoGenerateColumns: false,
            itemsSource: charges,
            isReadOnly: true,
            selectionMode: wijmo.grid.SelectionMode.Row
        });

        chargeGrid.trackChanges = true;

        charges.pageSize = 15;

        charges.collectionChanged.addHandler(function (sender, args) {
            updateNavigateButtonsCharge();
        });

        updateNavigateButtonsCharge();

        btnFirstPageGrid.addEventListener('click', function () {
            charges.moveToFirstPage();
            updateNavigateButtonsCharge();
        });
        btnPreviousPageGrid.addEventListener('click', function () {
            charges.moveToPreviousPage();
            updateNavigateButtonsCharge();
        });
        btnNextPageGrid.addEventListener('click', function () {
            charges.moveToNextPage();
            updateNavigateButtonsCharge();
        });
        btnLastPageGrid.addEventListener('click', function () {
            charges.moveToLastPage();
            updateNavigateButtonsCharge();
        });

    });
</script>

</body>
</html>