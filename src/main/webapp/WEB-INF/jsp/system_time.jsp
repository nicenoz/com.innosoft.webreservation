<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="<c:url value='/font-awesome/css/font-awesome.min.css' />"
	rel="stylesheet"></link>

<script src="<c:url value='/js/jquery.js' />"></script>
<script src="<c:url value='/lib/bootstrap/js/bootstrap.js' />"></script>
<script src="<c:url value='/js/jquery.validate.js' />"></script>
<script src="<c:url value='/js/toastr.js' />"></script>

<script src="<c:url value='/js/date.js' />"></script>

<script src="<c:url value='/wijmo/controls/wijmo.min.js' />"
	type="text/javascript"></script>
<script src="<c:url value='/wijmo/controls/wijmo.input.min.js' />"></script>
<script src="<c:url value='/wijmo/controls/wijmo.grid.min.js' />"
	type="text/javascript"></script>
<script src="<c:url value='/wijmo/controls/wijmo.chart.min.js' />"></script>

<link href="<c:url value='/wijmo/styles/wijmo.min.css' />"
	rel="stylesheet" />
</head>

<body class="bodytopindent">

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top topnav"
		role="navigation">
	<div class="container topnav">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand topnav"
				href="${pageContext.request.contextPath}/">Web Reservation</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Schedule <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webreservation/software/"><b>Schedule</b></a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/software/email/">Email</a></li>
						<li><a href="/webreservation/software/charging/">Charging</a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/software/userPassword/">Password</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">User <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webreservation/user/"><b>User Dashboard</b></a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/user/user/">User Information</a></li>
						<li><a href="/webreservation/user/activity">Activity</a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/user/userReport/">User
								Report</a></li>
						<li><a href="/webreservation/user/reservationReport/">Reservation
								Report</a></li>
						<li><a href="/webreservation/user/chargingReport/">Charging
								Report</a></li>
					</ul></li>

				<li class="dropdown active"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">System <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/webreservation/system/"><b>System
									Dashboard</b></a></li>
						<li class="divider"></li>
						<li><a href="/webreservation/system/calendar/">Calendar</a></li>
						<li><a href="/webreservation/system/time/">Time</a></li>
						<li><a href="/webreservation/system/userPassword/">Password</a></li>
						<li><a href="/webreservation/system/customer/">Customer</a></li>
						<li><a href="/webreservation/system/message/">Message</a></li>
						<li><a href="/webreservation/system/charge/">Charge</a></li>
						<li><a href="/webreservation/system/code/">Code</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- Time List -->
	<div class="container">
		<section id="customerList">
		<div class="row">
			<div class="col-lg-12">
				<h4>Customer Time List</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default btn-extend-padding btn-form-custom"
							type="button" readonly>
							<i class="fa fa-search"></i>
						</button>
					</span> <input type="text" class="form-control input-form-custom"
						id="InputFilter" placeholder="Search...">
				</div>
			</div>
			<div class="col-lg-8">
				<button id="cmdAddProduct" type="submit"
					class="btn btn-primary pull-right btn-form-custom"
					onclick="cmdCustomerTimeAdd_OnClick()">Add</button>
			</div>
		</div>
		<br />
		<div class="row table-form-custom">
			<div class="col-lg-12 table-form-custom">
				<div id="CustomerTimeGrid" class="grid table-form-custom"></div>
			</div>
		</div>

		<br />

		<div class="row">
			<div class="btn-group col-md-7" id="naviagtionPageGrid">
				<button type="button"
					class="btn btn-default btn-extend-padding btn-form-custom"
					id="btnMoveToFirstPageGrid">
					<span class="glyphicon glyphicon-fast-backward"></span>
				</button>
				<button type="button"
					class="btn btn-default btn-extend-padding btn-form-custom"
					id="btnMoveToPreviousPageGrid">
					<span class="glyphicon glyphicon-step-backward"></span>
				</button>
				<button type="button"
					class="btn btn-default btn-extend-padding btn-form-custom" disabled
					style="width: 100px" id="btnCurrentPageGrid"></button>
				<button type="button"
					class="btn btn-default btn-extend-padding btn-form-custom"
					id="btnMoveToNextPageGrid">
					<span class="glyphicon glyphicon-step-forward"></span>
				</button>
				<button type="button"
					class="btn btn-default btn-extend-padding btn-form-custom"
					id="btnMoveToLastPageGrid">
					<span class="glyphicon glyphicon-fast-forward"></span>
				</button>
			</div>
		</div>
		</section>
	</div>

	<!-- Loading -->
	<div class="modal fade" id="loading" tabindex="-1" role="dialog"
		aria-labelledby="Loading..." aria-hidden="true">
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
	
	<!-- Charge Edit Detail -->
	<div class="modal fade" id="CustomerTimeEdit">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" aria-hidden="true">
						&times;</button>
					<h4 class="modal-title">Charge Edit</h4>
				</div>
				<div class="modal-body">
					<form id="chargeForm">
						<dl class="dl-horizontal">
				
							<dt>Customer ID</dt>
							<dd>
								<input class="form-control" id="EDIT_CTIM_ID" type="hidden" />
								<input class="form-control" id="EDIT_CTIM_CUST_ID" name="EDIT_CTIM_CUST_ID" type="text" required />
							</dd>
					
							<dt>Details No</dt>
							<dd>
								<input class="form-control" id="EDIT_CTIM_DETAILS_NO"	name="EDIT_CTIM_DETAILS_NO" type="text" required />
							</dd>
							<dt>Interval of Times</dt>
							<dd>
								<input class="form-control" id="EDIT_CTIM_INTERVAL_OF_TIMES" name="EDIT_CTIM_INTERVAL_OF_TIMES" type="text" required />
							</dd>
							<dt>Max Unit No</dt>
							<dd>
								<input class="form-control" id="EDIT_CTIM_MAX_UNIT_NO"	name="EDIT_CTIM_MAX_UNIT_NO" type="text" required />
							</dd>
							<dt>Max Parts No</dt>
							<dd>
								<input class="form-control" id="EDIT_CTIM_MAX_PARTS_NO"  name="EDIT_CTIM_MAX_PARTS_NO" type="text" required />
							</dd>

						</dl>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="cmdCustomerTimeEditOk" onclick="cmdCustomerTimeEditOk_OnClick()">Ok</button>
					<button type="button" class="btn btn-danger" id="cmdCustomerTimeEditCancel" onclick="cmdCustomerTimeEditCancel_OnClick()">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		var customerTime;
		var customerGrid;

		var btnFirstPageGrid;
		var btnPreviousPageGrid;
		var btnNextPageGrid;
		var btnLastPageGrid;
		var btnCurrentPageGrid;
		
	    // ===================
	    // Edit Button Clicked
	    // ===================
	    function cmdCustomerTimeEdit_OnClick() {
	    
	    	customerTime.editItem(customerTime.currentItem);

	        $('#CustomerTimeEdit').modal({
	            show: true,
	            backdrop: false
	        });

	        var customerTimes = customerTime.currentEditItem;
	        document.getElementById('EDIT_CTIM_ID').value = customerTimes.CTIM_ID !== null && typeof (customerTimes.CTIM_ID) != 'undefined' ? wijmo.Globalize.format(customerTimes.CTIM_ID) : '';
	        document.getElementById('EDIT_CTIM_CUST_ID').value = customerTimes.CTIM_CUST_ID ? customerTimes.CTIM_CUST_ID : '';
	        document.getElementById('EDIT_CTIM_DETAILS_NO').value = customerTimes.CTIM_DETAILS_NO ? customerTimes.CTIM_DETAILS_NO : '';
	        document.getElementById('EDIT_CTIM_INTERVAL_OF_TIMES').value = customerTimes.CTIM_INTERVAL_OF_TIMES ? customerTimes.CTIM_INTERVAL_OF_TIMES : '';
	        document.getElementById('EDIT_CTIM_MAX_UNIT_NO').value = customerTimes.CTIM_MAX_UNIT_NO ? customerTimes.CTIM_MAX_UNIT_NO : '';
	        document.getElementById('EDIT_CTIM_MAX_PARTS_NO').value = customerTimes.CTIM_MAX_PARTS_NO ? customerTimes.CTIM_MAX_PARTS_NO : '';
	        
		};
		
		// ==================
		// Add Button Clicked
		// ==================   
		function cmdCustomerTimeAdd_OnClick() {
			$('#CustomerTimeEdit').modal({
				show : true,
				backdrop : false
			});

			document.getElementById('EDIT_CTIM_ID').value = "0.0";
			document.getElementById('EDIT_CTIM_CUST_ID').value = "0.0";
			document.getElementById('EDIT_CTIM_DETAILS_NO').value = "0.0";
			document.getElementById('EDIT_CTIM_INTERVAL_OF_TIMES').value = "0.0";
			document.getElementById('EDIT_CTIM_MAX_UNIT_NO').value = "0.0";
			document.getElementById('EDIT_CTIM_MAX_PARTS_NO').value = "0.0";
		}
		
		// =====================
		// Delete Button Clicked
		// =====================   
		function cmdCustomerTimeDelete_OnClick() {
			
			customerTime.editItem(customerTime.currentItem);
			
			var id = customerTime.currentEditItem.CTIM_ID;
			var timeCodes = customerTime.currentEditItem.CTIM_DETAILS_NO;

			if (confirm("Delete " + timeCodes + "?") == true) {
				$.ajax({
					type : "DELETE",
					url : '${pageContext.request.contextPath}/api/customerTime/delete/'
							+ id,
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					statusCode : {
						200 : function() {
							toastr.success('Successfully Deleted!');
							window.setTimeout(function() {
								location.reload()
							}, 3000);
						},
						404 : function() {
							toastr.error("Not found!");
						},
						400 : function() {
							toastr.error("Bad request");
						}
					}
				});
			}
		}
		
		// =================================
		// Edit Detail Cancel Button Clicked 
		// =================================     
		function cmdCustomerTimeEditCancel_OnClick() {
			$('#CustomerTimeEdit').modal('hide');
		}
		
		// =============================
		// Edit Detail OK Button Clicked
		// =============================   
		function cmdCustomerTimeEditOk_OnClick() {
			var chargeObject = new Object();

			chargeObject.CTIM_ID                =  parseInt(document.getElementById('EDIT_CTIM_ID').value);
			chargeObject.CTIM_CUST_ID           =  parseInt(document.getElementById('EDIT_CTIM_CUST_ID').value);
			chargeObject.CTIM_DETAILS_NO        =  parseInt(document.getElementById('EDIT_CTIM_DETAILS_NO').value);
			chargeObject.CTIM_INTERVAL_OF_TIMES =  parseInt(document.getElementById('EDIT_CTIM_INTERVAL_OF_TIMES').value);
			chargeObject.CTIM_MAX_UNIT_NO       =  parseInt(document.getElementById('EDIT_CTIM_MAX_UNIT_NO').value);
			chargeObject.CTIM_MAX_PARTS_NO      =  parseInt(document.getElementById('EDIT_CTIM_MAX_PARTS_NO').value);
			
			var data = JSON.stringify(chargeObject);

			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/api/customerTime/update',
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				data : data,
				success : function(data) {
					if (data.CTIM_ID > 0) {
						toastr.success('Successfully Added!');
						window.setTimeout(function() {
							location.reload()
						}, 3000);
					} else {
						toastr.error("Not added!");
					}
				}
			});

		}
		
		// =================
		// Get Charges Data
		// =================   
		function getCustomerTimex2() {
			var customerTime = new wijmo.collections.ObservableArray();
			$('#loading').modal('show');
			$
					.ajax(
							{
								url : '${pageContext.request.contextPath}/api/customerTime/list',
								cache : false,
								type : 'GET',
								contentType : 'application/json; charset=utf-8',
								data : {},
								success : function(Results) {
									$('#loading').modal('hide');
									if (Results.length > 0) {
										for (i = 0; i < Results.length; i++) {
											customerTime
													.push({
														EditId : "<button class='btn btn-primary btn-xs btn-form-custom' data-toggle='modal' id='cmdEditCharge' onclick='cmdCustomerTimeEdit_OnClick()'>Edit</button>",
														DeleteId : "<button class='btn btn-danger btn-xs btn-form-custom' data-toggle='modal' id='cmdDeleteCharge' onclick='cmdCustomerTimeDelete_OnClick()'>Delete</button>",
														CTIM_ID : Results[i]["ctim_ID"],
														CTIM_CUST_ID : Results[i]["ctim_CUST_ID"],
														CTIM_DETAILS_NO : Results[i]["ctim_DETAILS_NO"],
														CTIM_INTERVAL_OF_TIMES : Results[i]["ctim_INTERVAL_OF_TIMES"],
														CTIM_MAX_UNIT_NO : Results[i]["ctim_MAX_UNIT_NO"],
														CTIM_MAX_PARTS_NO : Results[i]["ctim_MAX_PARTS_NO"],
													});
										}
									} else {
										alert("No data.");
									}
								}
							}).fail(function(xhr, textStatus, err) {
						alert(err);
					});
			return customerTime;
		}
		
		// ==================
		// Navigation Buttons 
		// ==================   
		function updateNavigateButtonsCharge() {
			if (customerTime.pageSize <= 0) {
				document.getElementById('naviagtionPageGrid').style.display = 'none';
				return;
			}
			document.getElementById('naviagtionPageGrid').style.display = 'block';
			if (customerTime.pageIndex === 0) {
				btnFirstPageGrid.setAttribute('disabled', 'disabled');
				btnPreviousPageGrid.setAttribute('disabled', 'disabled');
				btnNextPageGrid.removeAttribute('disabled');
				btnLastPageGrid.removeAttribute('disabled');
			} else if (customerTime.pageIndex === (customerTime.pageCount - 1)) {
				btnFirstPageGrid.removeAttribute('disabled');
				btnPreviousPageGrid.removeAttribute('disabled');
				btnLastPageGrid.setAttribute('disabled', 'disabled');
				btnNextPageGrid.setAttribute('disabled', 'disabled');
			} else {
				btnFirstPageGrid.removeAttribute('disabled');
				btnPreviousPageGrid.removeAttribute('disabled');
				btnNextPageGrid.removeAttribute('disabled');
				btnLastPageGrid.removeAttribute('disabled');
			}
			btnCurrentPageGrid.innerHTML = (customerTime.pageIndex + 1) + ' / '
					+ customerTime.pageCount;
		}
		
		
		// =====================
		// Detail Edit Validator
		// =====================     
		function FormValidate() {
			var validator = $('form').validate({
				submitHandler : function(form) {
					form.submit();
				}
			});
			var x = validator.form();
			console.log(x);
			return x;
		}

		// ==============================
		// Detail Edit Validator Defaults
		// ==============================    
		$.validator.setDefaults({
			errorPlacement : function(error, element) {
				$(element).attr({
					"title" : error.append()
				});
			},
			highlight : function(element) {
				$(element).removeClass("textinput");
				$(element).addClass("errorHighlight");
			},
			unhighlight : function(element) {
				$(element).removeClass("errorHighlight");
				$(element).addClass("textinput");
			}
		});

		// ============
		// On Page Load
		// ============
		$(document).ready(
				function() {

		/* 			//validation
					$('#cmdCustomerTimeEditOk').click(function() {
						if (FormValidate() == true) {
							cmdCustomerTimeEditOkFunction();
							$('#ChargeEdit').modal('hide');
						} else {
							toastr.error("Fill the required field!");
						}
					});

					$('#cmdCustomerTimeEditCancel, .close').click(function() {
						$("form input").removeClass("errorHighlight");
						$('form')[0].reset();
						$('#ChargeEdit').modal('hide');
					});
					$('.close-btn').hide();
 */
					// Collection View
					customerTime = new wijmo.collections.CollectionView(getCustomerTimex2());
					customerTime.canFilter = true;
					customerTime.pageSize = 15;

				    var filterText = '';
					$('#InputFilter').keyup(function () {
					    filterText = this.value.toLowerCase();
					    customerTime.refresh();
					});
					customerTime.filter = function (item) {
					    return !filterText || (item.ChargeName.toLowerCase().indexOf(filterText) > -1);
					}

					//ERROR CODE
	/*
					charges.collectionChanged.addHandler(function (sender, args) {
					    updateNavigateButtonsMessage();
					});
	*/				

					// Flex Grid
					customerGrid = new wijmo.grid.FlexGrid('#CustomerTimeGrid');
					customerGrid.initialize({
						columns : [ {
							"header" : "Edit",
							"binding" : "EditId",
							"width" : 60,
							"allowSorting" : false,
							"isContentHtml" : true
						}, {
							"header" : "Delete",
							"binding" : "DeleteId",
							"width" : 60,
							"allowSorting" : false,
							"isContentHtml" : true
						}, {
							"header" : "Time Id.",
							"binding" : "CTIM_ID",
							"allowSorting" : true,
							"width" : "6*"
						}, {
							"header" : "Customer Id",
							"binding" : "CTIM_CUST_ID",
							"allowSorting" : true,
							"width" : "6*"
						},  {
							"header" : "Details No",
							"binding" : "CTIM_DETAILS_NO",
							"allowSorting" : true,
							"width" : "6*"
						}, {
							"header" : "Interval of Times",
							"binding" : "CTIM_INTERVAL_OF_TIMES",
							"allowSorting" : true,
							"width" : "6*"
						}, {
							"header" : "Max Unit No",
							"binding" : "CTIM_MAX_UNIT_NO",
							"allowSorting" : true,
							"width" : "6*"
						}, {
							"header" : "Max Part No",
							"binding" : "CTIM_MAX_PARTS_NO",
							"allowSorting" : true,
							"width" : "6*"
						} ],
						autoGenerateColumns : false,
						itemsSource : customerTime,
						isReadOnly : true,
						selectionMode : wijmo.grid.SelectionMode.Row
					});

					customerGrid.trackChanges = true;

					//Navigation button
					btnFirstPageGrid = document.getElementById('btnMoveToFirstPageGrid');
					btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
					btnNextPageGrid = document.getElementById('btnMoveToNextPageGrid');
					btnLastPageGrid = document.getElementById('btnMoveToLastPageGrid');
					btnCurrentPageGrid = document.getElementById('btnCurrentPageGrid');

					updateNavigateButtonsCharge();

					btnFirstPageGrid.addEventListener('click', function() {
						customerTime.moveToFirstPage();
						updateNavigateButtonsCharge();
					});
					btnPreviousPageGrid.addEventListener('click', function() {
						customerTime.moveToPreviousPage();
						updateNavigateButtonsCharge();
					});
					btnNextPageGrid.addEventListener('click', function() {
						customerTime.moveToNextPage();
						updateNavigateButtonsCharge();
					});
					btnLastPageGrid.addEventListener('click', function() {
						customerTime.moveToLastPage();
						updateNavigateButtonsCharge();
					});

				});
	</script>

</body>
</html>