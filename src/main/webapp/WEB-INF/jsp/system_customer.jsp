<?xml version="1.0" encoding="ISO-8859-1" ?>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
    
<!-- Customer List -->
<div class="container"> 
<section id="customerList">
	<div class="row">
	    <div class="col-lg-12">
	        <h4>Customer List</h4>
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
	        <div id="CustomerGrid" class="grid table-form-custom"></div>
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
    var customers;
    var customerGrid;

    var btnFirstPageGrid;
    var btnPreviousPageGrid;
    var btnNextPageGrid;
    var btnLastPageGrid;
    var btnCurrentPageGrid;

    function cmdCustomerEdit_OnClick() {
        customers.editItem(customers.currentItem);

        $('#CustomerEdit').modal({
            show: true,
            backdrop: false
        });

        //var Customer = Customers.currentEditItem;
        //document.getElementById('CustomerEdit_Id').value = Customer.Id !== null && typeof (Customer.Id) != 'undefined' ? wijmo.Globalize.format(Customer.Id) : '';
        //document.getElementById('CustomerEdit_CustomerDescription').value = Customer.CustomerDescription ? Customer.CustomerDescription : '';

    }
    function cmdCustomerAdd_OnClick() {
        $('#CustomerEdit').modal({
            show: true,
            backdrop: false
        });

        //document.getElementById('CustomerEdit_Id').value = 0;
        //document.getElementById('CustomerEdit_CustomerDescription').value = "";

    }
    function cmdCustomerDelete_OnClick() {
        customers.editItem(customers.currentItem);

/*         var Id = Customers.currentEditItem.Id;
        var CustomerDescription = Customers.currentEditItem.CustomerDescription;

        if (confirm("Delete " + CustomerDescription + "?") == true) {
            $.ajax({
                type: "DELETE",
                url: "/api/DeleteCustomer/" + Id,
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
    function cmdCustomerEditOkFunction() {
	    var Customer = new Object();
	
	    Customer.Id = document.getElementById('CustomerEdit_Id').value;
	    Customer.CustomerDescription = document.getElementById('CustomerEdit_CustomerDescription').value;
	
	    var data = JSON.stringify(Customer);
	
	    // Add New
	    if (Customer.Id == 0) {
	        $.ajax({
	            type: "POST",
	            url: "/api/AddCustomer",
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
	            url: "/api/UpdateCustomer/" + Customer.Id,
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
    function getCustomers() {
        var customers = new wijmo.collections.ObservableArray();
        $('#loading').modal('show');
        $.ajax({
            url: '${pageContext.request.contextPath}/api/customer/list',
            cache: false,
            type: 'GET',
            contentType: 'application/json; charset=utf-8',
            data: {},
            success: function (Results) {
                $('#loading').modal('hide');
                if (Results.length > 0) {
                    for (i = 0; i < Results.length; i++) {
                        customers.push({
                            EditId: "<button class='btn btn-primary btn-xs btn-form-custom' data-toggle='modal' id='cmdEditCustomer' onclick='cmdCustomerEdit_OnClick()'>Edit</button>",
                            DeleteId: "<button class='btn btn-danger btn-xs btn-form-custom' data-toggle='modal' id='cmdDeleteCustomer' onclick='cmdCustomerDelete_OnClick()'>Delete</button>",
                            Id: Results[i]["cust_ID"],
                            CustomerName: Results[i]["cust_NAME"]
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
        return customers;
    }
    function updateNavigateButtonsCustomer() {
        if (customers.pageSize <= 0) {
            document.getElementById('naviagtionPageGrid').style.display = 'none';
            return;
        }
        document.getElementById('naviagtionPageGrid').style.display = 'block';
        if (customers.pageIndex === 0) {
            btnFirstPageGrid.setAttribute('disabled', 'disabled');
            btnPreviousPageGrid.setAttribute('disabled', 'disabled');
            btnNextPageGrid.removeAttribute('disabled');
            btnLastPageGrid.removeAttribute('disabled');
        }
        else if (customers.pageIndex === (Customers.pageCount - 1)) {
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
        btnCurrentPageGrid.innerHTML = (customers.pageIndex + 1) + ' / ' + customers.pageCount;
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

        $('#CmdCustomerEditOk').click(function () {
            if (FormValidate() == true) {
                cmdCustomerEditOkFunction();
                $('#CustomerEdit').modal('hide');
            }
            else {
                toastr.error("Fill the required field!");
            }
        });

        $('#CmdCustomerEditCancel, .close').click(function () {
            $("form input").removeClass("errorHighlight");
            $('form')[0].reset();
            $('#CustomerEdit').modal('hide');
        });

        $('.close-btn').hide();

        btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
        btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
        btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
        btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
        btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

        customers = new wijmo.collections.CollectionView(getCustomers());

        customerGrid = new wijmo.grid.FlexGrid('#CustomerGrid');

        customers.canFilter = true;

        var filterText = '';

        $('#InputFilter').keyup(function () {
            filterText = this.value.toLowerCase();
            customers.refresh();
        });

        customers.filter = function (item) {
            return !filterText || (item.CustomerName.toLowerCase().indexOf(filterText) > -1);
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
                            "header": "Name",
                            "binding": "CustomerName",
                            "allowSorting": true,
                            "width": "3*"
                        }
            ],
            autoGenerateColumns: false,
            itemsSource: customers,
            isReadOnly: true,
            selectionMode: wijmo.grid.SelectionMode.Row
        });

        customerGrid.trackChanges = true;

        customers.pageSize = 15;

        customers.collectionChanged.addHandler(function (sender, args) {
            updateNavigateButtonsCustomer();
        });

        updateNavigateButtonsCustomer();

        btnFirstPageGrid.addEventListener('click', function () {
            customers.moveToFirstPage();
            updateNavigateButtonsCustomer();
        });
        btnPreviousPageGrid.addEventListener('click', function () {
            customers.moveToPreviousPage();
            updateNavigateButtonsCustomer();
        });
        btnNextPageGrid.addEventListener('click', function () {
            customers.moveToNextPage();
            updateNavigateButtonsCustomer();
        });
        btnLastPageGrid.addEventListener('click', function () {
            customers.moveToLastPage();
            updateNavigateButtonsCustomer();
        });

    });
</script>

</body>
</html>