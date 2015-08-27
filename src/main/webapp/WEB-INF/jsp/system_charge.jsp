<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Charge</title>

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
						<button class="btn btn-default border-custom" type="button" readonly>
							<i class="fa fa-search"></i>
						</button>
					</span> 
					<input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search">
				</div>
			</div>
			<div class="col-lg-8">
				<button id="cmdAddCharge" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdChargeAdd_OnClick()">Add</button>
			</div>
		</div>		
		<br />		
		<div class="row">
			<div class="col-lg-12">
				<div id="ChargeGrid" class="grid border-custom"></div>
			</div>
		</div>
		<br />	
		<div class="row">
	    <div class="btn-group col-md-7" id="naviagtionPageGrid">
	        <button type="button" class="btn btn-default border-custom" id="btnMoveToFirstPageGrid">
	            <span class="glyphicon glyphicon-fast-backward"></span>
	        </button>
	        <button type="button" class="btn btn-default border-custom" id="btnMoveToPreviousPageGrid">
	            <span class="glyphicon glyphicon-step-backward"></span>
	        </button>
	        <button type="button" class="btn btn-default border-custom" disabled style="width:100px" id="btnCurrentPageGrid"></button>
	        <button type="button" class="btn btn-default border-custom" id="btnMoveToNextPageGrid">
	            <span class="glyphicon glyphicon-step-forward"></span>
	        </button>
	        <button type="button" class="btn btn-default border-custom" id="btnMoveToLastPageGrid">
	            <span class="glyphicon glyphicon-fast-forward"></span>
	        </button>
	    </div>
	</div>	
	</section>
</div>

<!-- Loading -->
<div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="Loading..." aria-hidden="true">
	<div class="modal-dialog" style="width: 220px;">
		<div class="modal-content border-custom">
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
<div class="modal fade" id="ChargeEdit">
	<div class="modal-dialog">
		<div class="modal-content border-custom">	
			<div class="modal-header">
				<button type="button" class="close" aria-hidden="true">
					&times;</button>
				<h4 class="modal-title">Charge Edit</h4>
			</div>		
			<div class="modal-body">
				<form id="chargeForm">
					<dl class="dl-horizontal">
						<dt>Charge No: </dt>
						<dd>
							<input id="EDIT_CHRG_ID" type="hidden" />
							<input class="form-control border-custom" id="EDIT_CHRG_CHARGE_NO" name="EDIT_CHRG_CHARGE_NO" type="text" required />
						</dd>
				
						<dt>Customer: </dt>
						<dd>
							<div id="EDIT_CHRG_CUST_ID"  class="form-control border-custom"></div>	
										
							<input id="EDIT_CHRG_CUST_ID_DATA" name="EDIT_CHRG_CUST_ID_DATA" type="hidden" required />
							<input id="EDIT_CUST_NAME" name="EDIT_CUST_NAME" type="hidden" required />
						</dd>
						<dt>Charge Price: </dt>
						<dd>
							<input class="form-control border-custom" id="EDIT_CHRG_PRICE" name="EDIT_CHRG_PRICE" type="text" required />
						</dd>
						<dt>App Division: </dt>
						<dd>
							<input class="form-control border-custom" id="EDIT_CHRG_APP_DIVISION" name="EDIT_CHRG_APP_DIVISION" type="text" required />
						</dd>
						<dt>Start Date: </dt>
						<dd>
							<div id="EDIT_CHRG_APP_START_DATE" class="form-control border-custom"></div>
							<input id="EDIT_CHRG_APP_START_DATE_DATA" type="hidden" />
						</dd>
						<dt>End Date: </dt>
						<dd>
							<div id="EDIT_CHRG_APP_END_DATE" class="form-control border-custom"></div>
							<input id="EDIT_CHRG_APP_END_DATE_DATA" type="hidden" />
						</dd>
					</dl>
				</form>
			</div>	
			<div class="modal-footer">
				<button type="button" class="btn btn-primary border-custom" id="cmdChargeEditOk" onclick="cmdChargeEditOk_OnClick()">
					Ok
				</button>
				<button type="button" class="btn btn-danger border-custom" id="cmdChargeEditCancel" onclick="cmdChargeEditCancel_OnClick()">
					Cancel
				</button>
			</div>	
		</div>
	</div>
</div>

<script type="text/javascript">
//================
// Global variables
// ================
var charges;
var chargeGrid;

var chargeStartDate;
var chargeEndDate;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

//====================================
//Get Customer
//====================================	
function getCustomers() {
var customers = new wijmo.collections.ObservableArray();
$.ajax({
  url: '${pageContext.request.contextPath}/api/customer/list',
  cache: false,
  type: 'GET',
  contentType: 'application/json; charset=utf-8',
  data: {},
  success: function (results) {
      if (results.length > 0) {
          for (i = 0; i < results.length; i++) {
          	customers.push({
                  customerId: results[i]["CUST_ID"],
                  customerName: results[i]["CUST_NAME"]
              });
          }
          createCboCustomer(customers);
      }
  }
}).fail(
  function (xhr, textStatus, err) {
      alert(err);
  }
);
}

//===========
//Combo Box
//===========
function createCboCustomer(customers) {
	customerCollection = new wijmo.collections.CollectionView(customers);

var customerList = new Array();
for (var i = 0; i < customerCollection.items.length; i++) {
	customerList.push(customerCollection.items[i].customerName);
}
	
cboCustomer.dispose();
	cboCustomer = new wijmo.input.AutoComplete('#EDIT_CHRG_CUST_ID', {
  itemsSource: customerList,
  placeholder: 'select a customer',
  selectedValue: document.getElementById('EDIT_CUST_NAME').value.toString(),
  onSelectedIndexChanged: function () {
      $("#EDIT_CHRG_CUST_ID_DATA").val(customerCollection.items[this.selectedIndex].customerId);
      getCustomerTime(customerCollection.items[this.selectedIndex].customerId)
  }
});	
}

	function pad (str, max) {
	  str = str.toString();
	  return str.length < max ? pad("0" + str, max) : str;
	}

/* 	pad("3", 3);    // => "003"
	pad("123", 3);  // => "123"
	pad("1234", 3); // => "1234"

	var test = "MR 2";
	var parts = test.split(" ");
	parts[1] = pad(parts[1], 3);
	parts.join(" ");  */
	
// ===================
// Edit Button Clicked
// ===================
function cmdChargeEdit_OnClick() {	
    charges.editItem(charges.currentItem);

    $('#ChargeEdit').modal({
        show: true,
        backdrop: 'static'
    });

    var charge = charges.currentEditItem;   
    document.getElementById('EDIT_CHRG_ID').value = charge.CHRG_ID !== null && typeof (charge.CHRG_ID) != 'undefined' ? wijmo.Globalize.format(charge.CHRG_ID) : '';
    document.getElementById('EDIT_CHRG_CHARGE_NO').value = charge.CHRG_CHARGE_NO ? charge.CHRG_CHARGE_NO : '';
    document.getElementById('EDIT_CHRG_CUST_ID_DATA').value = charge.CHRG_CUST_ID ? charge.CHRG_CUST_ID : '';
    document.getElementById('EDIT_CUST_NAME').value = charge.CHRG_CUST_FK ? charge.CHRG_CUST_FK : '';
    document.getElementById('EDIT_CHRG_PRICE').value = charge.CHRG_PRICE ? charge.CHRG_PRICE : '';
    document.getElementById('EDIT_CHRG_APP_DIVISION').value = charge.CHRG_APP_DIVISION ? charge.CHRG_APP_DIVISION : '';
    document.getElementById('EDIT_CHRG_APP_START_DATE_DATA').value = charge.CHRG_APP_START_DATE ? charge.CHRG_APP_START_DATE : '';
    document.getElementById('EDIT_CHRG_APP_END_DATE_DATA').value = charge.CHRG_APP_END_DATE ? charge.CHRG_APP_END_DATE : '';
    
	var ccn = document.getElementById('EDIT_CHRG_CHARGE_NO').value;
	
	chargeObject.CHRG_CHARGE_NO  = pad(ccn, 6);
	
	getCustomers();
    
    var splitStartDate = charge.CHRG_APP_START_DATE.split("-");
    var splitEndDate = charge.CHRG_APP_END_DATE.split("-");
    
    chargeStartDate.dispose();
    chargeStartDate = new wijmo.input.InputDate('#EDIT_CHRG_APP_START_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date(splitStartDate[0], splitStartDate[1] - 1, splitStartDate[2]),
        onValueChanged: function () {
            document.getElementById('EDIT_CHRG_APP_START_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });    
    
    chargeEndDate.dispose();
    chargeEndDate = new wijmo.input.InputDate('#EDIT_CHRG_APP_END_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date(splitEndDate[0], splitEndDate[1] - 1, splitEndDate[2]),
        onValueChanged: function () {
            document.getElementById('EDIT_CHRG_APP_END_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
 	});  
 }
    
// ==================
// Add Button Clicked
// ==================   
function cmdChargeAdd_OnClick() {	
	$('#ChargeEdit').modal({
		show : true,
		backdrop : 'static'
	});

	var currentDate = new Date();
	document.getElementById('EDIT_CHRG_ID').value = 0;
	document.getElementById('EDIT_CHRG_CHARGE_NO').value = '';
	document.getElementById('EDIT_CHRG_CUST_ID_DATA').value = '';
	document.getElementById('EDIT_CHRG_PRICE').value = '';
	document.getElementById('EDIT_CHRG_APP_DIVISION').value = '';
	document.getElementById('EDIT_CHRG_APP_START_DATE_DATA').value = currentDate.toString("yyyy-MM-dd");
	document.getElementById('EDIT_CHRG_APP_END_DATE_DATA').value = currentDate.toString("yyyy-MM-dd");

	chargeStartDate.dispose();
	chargeStartDate = new wijmo.input.InputDate('#EDIT_CHRG_APP_START_DATE',{
				format : 'MM/dd/yyyy',
				value : currentDate,
				onValueChanged : function() {
					document.getElementById('EDIT_CHRG_APP_START_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
				}
			});
	
	chargeEndDate.dispose();
	chargeEndDate = new wijmo.input.InputDate('#EDIT_CHRG_APP_END_DATE',{
				format : 'MM/dd/yyyy',
				value : currentDate,
				onValueChanged : function() {
					document.getElementById('EDIT_CHRG_APP_END_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
				}
			});	
	
	getCustomers();
}

// =====================
// Delete Button Clicked 
// =====================   
function cmdChargeDelete_OnClick() {	
	charges.editItem(charges.currentItem);
	
	var id = charges.currentEditItem.CHRG_ID;
	var chargeNo = charges.currentEditItem.CHRG_CHARGE_NO;
	
    alertify.confirm("<span class='glyphicon glyphicon-trash'></span> Are you sure you want to delete Charge No. " + chargeNo + "?", function (e) {
	if (e) {
		$.ajax({
			type : "DELETE",
			url : '${pageContext.request.contextPath}/api/charge/delete/'
					+ id,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			statusCode : {
				200 : function() {
					toastr.success('Successfully Deleted!');
					window.setTimeout(function() {
						location.reload()
					}, 1000);
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
	});
}

// =================================
// Edit Detail Cancel Button Clicked 
// =================================     
function cmdChargeEditCancel_OnClick() {	
	$('#ChargeEdit').modal('hide');	
}
	
		
// =============================
// Edit Detail OK Button Clicked 
// =============================     
function cmdChargeEditOk_OnClick() {	
	var chargeObject = new Object();
	chargeObject.CHRG_ID = parseInt(document.getElementById('EDIT_CHRG_ID').value);
	chargeObject.CHRG_CHARGE_NO = document.getElementById('EDIT_CHRG_CHARGE_NO').value;
	chargeObject.CHRG_CUST_ID =  parseInt(document.getElementById('EDIT_CHRG_CUST_ID_DATA').value);
	chargeObject.CHRG_PRICE =  parseInt(document.getElementById('EDIT_CHRG_PRICE').value);
	chargeObject.CHRG_APP_DIVISION = document.getElementById('EDIT_CHRG_APP_DIVISION').value;
	
	var splitStartDate = document.getElementById('EDIT_CHRG_APP_START_DATE_DATA').value.split("-");
	var splitEndDate = document.getElementById('EDIT_CHRG_APP_END_DATE_DATA').value.split("-");

	chargeObject.CHRG_APP_START_DATE = new Date(splitStartDate[0],splitStartDate[1] - 1, splitStartDate[2]);
	chargeObject.CHRG_APP_END_DATE = new Date(splitEndDate[0],splitEndDate[1] - 1, splitEndDate[2]);

	
	
	var data = JSON.stringify(chargeObject);

	$.ajax({
		type : "POST",
		url : '${pageContext.request.contextPath}/api/charge/update',
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		data : data,
		success : function(data) {
			if (data.CHRG_ID > 0) {
				toastr.success('Successfully Added!');
				window.setTimeout(function() {
					location.reload()
				}, 1000);
			} else {
				toastr.error("Not added!");
			}
		}
	});
}

// ================
// Get Charges Data 
// ================   
function getCharges() {	
	var charges = new wijmo.collections.ObservableArray();	
	$('#loading').modal('show');
	$.ajax({
				url : '${pageContext.request.contextPath}/api/charge/list',
				cache : false,
				type : 'GET',
				contentType : 'application/json; charset=utf-8',
				data : {},
				success : function(Results) {
					$('#loading').modal('hide');
					if (Results.length > 0) {
						for (i = 0; i < Results.length; i++) {
							charges
									.push({
										EditId : "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditCharge' onclick='cmdChargeEdit_OnClick()'>Edit</button>",
										DeleteId : "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteCharge' onclick='cmdChargeDelete_OnClick()'>Delete</button>",
										CHRG_ID : Results[i]["chrg_ID"],
										CHRG_CUST_ID : Results[i]["chrg_CUST_ID"],
										CHRG_CUST_FK : Results[i].CHRG_CUST_FK.CUST_NAME,
										CHRG_CHARGE_NO : Results[i]["chrg_CHARGE_NO"],
										CHRG_PRICE : Results[i]["chrg_PRICE"],
										CHRG_APP_DIVISION : Results[i]["chrg_APP_DIVISION"],
										CHRG_APP_START_DATE : Results[i]["chrg_APP_START_DATE"],
										CHRG_APP_END_DATE : Results[i]["chrg_APP_END_DATE"],
										
										CREATED_DATE: Results[i]["created_DATE"],
				                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
				                        UPDATED_DATE: Results[i]["updated_DATE"],
				                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
				                        ISDELETED: Results[i]["isdeleted"],
				                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
				                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
				                        CHRG_CREATED_BY_USER_FK: Results[i]["CHRG_CREATED_BY_USER_FK"],
				                        CHRG_UPDATED_BY_USER_FK: Results[i]["CHRG_UPDATED_BY_USER_FK"]
									});
						}
					} else {
					/* 	alert("No data."); */
					}
				}
			}).fail(function(xhr, textStatus, err) {
				alert(err);
			});
	
	return charges;	
}

//==================
//Navigation Buttons
//==================   
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

//===================
//FlexGrid Selection
//=================== 
function updateDetails() {	
	var item = charges.currentItem;
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.CHRG_CREATED_BY_USER_FK.USER_LOGIN;;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.CHRG_UPDATED_BY_USER_FK.USER_LOGIN;;
	document.getElementById('EDIT_UPDATE_DATE').innerHTML = item.UPDATED_DATE;	
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
$(document).ready(function(){
	// Date Control Initialization
	chargeStartDate = new wijmo.input.InputDate(
			'#EDIT_CHRG_APP_START_DATE', {
				format : 'MM/dd/yyyy',
				value : new Date()
			});
	chargeEndDate = new wijmo.input.InputDate(
			'#EDIT_CHRG_APP_END_DATE', {
				format : 'MM/dd/yyyy',
				value : new Date()
			});

	//validation
	$('#CmdChargeEditOk').click(function() {
		if (FormValidate() == true) {
			cmdChargeEditOkFunction();
			$('#ChargeEdit').modal('hide');
		} else {
			toastr.error("Fill the required field!");
		}
	});

	$('#CmdChargeEditCancel, .close').click(function() {
		$("form input").removeClass("errorHighlight");
		$('form')[0].reset();
		$('#ChargeEdit').modal('hide');
	});
	
	$('.close-btn').hide();

	// Collection View
	charges = new wijmo.collections.CollectionView(getCharges());
	charges.canFilter = true;
	charges.pageSize = 15;

    var filterText = '';
    
	$('#InputFilter').keyup(function () {
	    filterText = this.value.toLowerCase();
	    charges.refresh();
	});
	charges.filter = function (item) {
	    return !filterText || (item.CHRG_CHARGE_NO.toLowerCase().indexOf(filterText) > -1);
	}
	
	/* charges.collectionChanged.addHandler(function (sender, args) {
    	updateNavigateButtonsCalendarActivitiy();
    }); */
	
	charges.currentChanged.addHandler(function (sender, args) {
	    updateDetails();
	});

	cboCustomer = new wijmo.input.AutoComplete('#EDIT_CHRG_CUST_ID');

	
	// Flex Grid
	chargeGrid = new wijmo.grid.FlexGrid('#ChargeGrid');
	chargeGrid.initialize({
		columns : [
	           		{
						"header" : "Edit",
						"binding" : "EditId",
						"width" : 60,
						"allowSorting" : false,
						"isContentHtml" : true
					},
					{
						"header" : "Delete",
						"binding" : "DeleteId",
						"width" : 60,
						"allowSorting" : false,
						"isContentHtml" : true
					},
					{
						"header" : "Charge No",
						"binding" : "CHRG_CHARGE_NO",
						"allowSorting" : true,
						"width" : "6*"
					},
					{
						"header" : "Customer",
						"binding" : "CHRG_CUST_FK",
						"allowSorting" : true,
						"width" : "6*"
					},
					{
						"header" : "Price",
						"binding" : "CHRG_PRICE",
						"allowSorting" : true,
						"width" : "6*"
					},
					{
						"header" : "App Division",
						"binding" : "CHRG_APP_DIVISION",
						"allowSorting" : true,
						"width" : "6*"
					}, 
					{
						"header" : "Start Date",
						"binding" : "CHRG_APP_START_DATE",
						"allowSorting" : true,
						"width" : "6*"
					}, 
					{
						"header" : "End Date",
						"binding" : "CHRG_APP_END_DATE",
						"allowSorting" : true,
						"width" : "6*"
					}
			],
		autoGenerateColumns : false,
		itemsSource : charges,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Row
	});

	chargeGrid.trackChanges = true;

	// Navigation button
	btnFirstPageGrid = document.getElementById('btnMoveToFirstPageGrid');
	btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
	btnNextPageGrid = document.getElementById('btnMove ToNextPageGrid');
	btnLastPageGrid = document.getElementById('btnMoveToLastPageGrid');
	btnCurrentPageGrid = document.getElementById('btnCurrentPageGrid');

	updateNavigateButtonsCharge();

	btnFirstPageGrid.addEventListener('click', function() {
		charges.moveToFirstPage();
		updateNavigateButtonsCharge();
	});
	btnPreviousPageGrid.addEventListener('click', function() {
		charges.moveToPreviousPage();
		updateNavigateButtonsCharge();
	});
	btnNextPageGrid.addEventListener('click', function() {
		charges.moveToNextPage();
		updateNavigateButtonsCharge();
	});
	btnLastPageGrid.addEventListener('click', function() {
		charges.moveToLastPage();
		updateNavigateButtonsCharge();
	});
});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>