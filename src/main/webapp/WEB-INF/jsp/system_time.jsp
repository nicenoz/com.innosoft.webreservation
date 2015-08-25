<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Time</title>

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
					<button class="btn btn-default border-custom" type="button" readonly>
						<i class="fa fa-search"></i>
					</button>
				</span>
				 <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search">
			</div>
		</div>
		<div class="col-lg-8">
			<button id="cmdCustomerTimeAdd" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdCustomerTimeAdd_OnClick()">Add</button>
		</div>
	</div>
	<br />
	<div class="row">
		<div class="col-lg-12">
			<div id="CustomerTimeGrid" class="grid border-custom"></div>
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
			<button type="button" class="btn btn-default border-custom" disabled style="width: 100px" id="btnCurrentPageGrid"></button>
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
<div class="modal fade" id="loading" tabindex="-1" role="dialog"
	aria-labelledby="Loading..." aria-hidden="true">
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
	
<!-- Time Edit Detail -->
<div class="modal fade" id="CustomerTimeEdit">
	<div class="modal-dialog">
		<div class="modal-content border-custom">
			<div class="modal-header">
				<button type="button" class="close" aria-hidden="true">
					&times;</button>
				<h4 class="modal-title">Customer Time Edit</h4>
			</div>
			<div class="modal-body">
				<form id="chargeForm">
					<dl class="dl-horizontal">
			
						<dt>Customer: </dt>
						<dd>						
							<input id="EDIT_CTIM_ID" type="hidden" />
							
							<div id="EDIT_CTIM_CUST_ID"  class="form-control border-custom"></div>
							<input id="EDIT_CTIM_CUST_ID_DATA" name="EDIT_CTIM_CUST_ID_DATA" type="hidden" required />
							<input id="EDIT_CUST_NAME" name="EDIT_CUST_NAME" type="hidden" required />
						</dd>
				
						<dt>Details No: </dt>
						<dd>
							<input class="form-control border-custom" id="EDIT_CTIM_DETAILS_NO"	name="EDIT_CTIM_DETAILS_NO" type="text" required />
						</dd>
						<dt>Interval of Times: </dt>
						<dd>
							<input class="form-control border-custom" id="EDIT_CTIM_INTERVAL_OF_TIMES" name="EDIT_CTIM_INTERVAL_OF_TIMES" type="text" required />
						</dd>
						<dt>Max Unit No: </dt>
						<dd>
							<select class="form-control border-custom" id="EDIT_CTIM_MAX_UNIT_NO" name="EDIT_CTIM_MAX_UNIT_NO" required >
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
							</select>
						</dd>
						<dt>Max Parts No: </dt>
						<dd>
							<select class="form-control border-custom" id="EDIT_CTIM_MAX_PARTS_NO" name="EDIT_CTIM_MAX_PARTS_NO" required >
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="3">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
							</select>
						</dd>
					</dl>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary border-custom" id="cmdCustomerTimeEditOk" onclick="cmdCustomerTimeEditOk_OnClick()">Ok</button>
				<button type="button" class="btn btn-danger border-custom" id="cmdCustomerTimeEditCancel" onclick="cmdCustomerTimeEditCancel_OnClick()">Cancel</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// ================	
// Global Variables
// ================	
var customerTimes;
var customerGrid;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;


//===================
//Get Customer
//===================
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
                     id: results[i]["CUST_ID"],
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

//===================
//Combo Box
//===================
function createCboCustomer(customers) {
	customerCollection = new wijmo.collections.CollectionView(customers);
 
 var customerList = new Array();
 for (var i = 0; i < customerCollection.items.length; i++) {
 	customerList.push(customerCollection.items[i].customerName);
 }
	
cboCustomer.dispose();
cboCustomer = new wijmo.input.AutoComplete('#EDIT_CTIM_CUST_ID', {
     itemsSource: customerList,
     placeholder: 'select a customer',
     selectedValue: document.getElementById('EDIT_CUST_NAME').value.toString(),
     onSelectedIndexChanged: function () {
         $("#EDIT_CTIM_CUST_ID_DATA").val(customerCollection.items[this.selectedIndex].id);
     }
 });	
}


// ===================
// Edit Button Clicked
// ===================
function cmdCustomerTimeEdit_OnClick() {
	customerTimes.editItem(customerTimes.currentItem);

    $('#CustomerTimeEdit').modal({
        show: true,
        backdrop: false
    });

    var customerTime = customerTimes.currentEditItem;   
    document.getElementById('EDIT_CTIM_ID').value = customerTime.CTIM_ID !== null && typeof (customerTime.CTIM_ID) != 'undefined' ? wijmo.Globalize.format(customerTime.CTIM_ID) : '';
    document.getElementById('EDIT_CTIM_CUST_ID_DATA').value = customerTime.CTIM_CUST_ID ? customerTime.CTIM_CUST_ID : '';
    document.getElementById('EDIT_CUST_NAME').value = customerTime.CTIM_CUST_FK ? customerTime.CTIM_CUST_FK : '';
    document.getElementById('EDIT_CTIM_DETAILS_NO').value = customerTime.CTIM_DETAILS_NO ? customerTime.CTIM_DETAILS_NO : '';
    document.getElementById('EDIT_CTIM_INTERVAL_OF_TIMES').value = customerTime.CTIM_INTERVAL_OF_TIMES ? customerTime.CTIM_INTERVAL_OF_TIMES : '';
    document.getElementById('EDIT_CTIM_MAX_UNIT_NO').value = customerTime.CTIM_MAX_UNIT_NO ? customerTime.CTIM_MAX_UNIT_NO : '';
    document.getElementById('EDIT_CTIM_MAX_PARTS_NO').value = customerTime.CTIM_MAX_PARTS_NO ? customerTime.CTIM_MAX_PARTS_NO : '';
    
	getCustomers(); 
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
	document.getElementById('EDIT_CTIM_CUST_ID_DATA').value = "0.0";
	document.getElementById('EDIT_CTIM_DETAILS_NO').value = "0.0";
	document.getElementById('EDIT_CTIM_INTERVAL_OF_TIMES').value = "0.0";
	document.getElementById('EDIT_CTIM_MAX_UNIT_NO').value = "0.0";
	document.getElementById('EDIT_CTIM_MAX_PARTS_NO').value = "0.0";
	
	getCustomers(); 
}

// =====================
// Delete Button Clicked
// =====================   
function cmdCustomerTimeDelete_OnClick() {	
	customerTimes.editItem(customerTimes.currentItem);
	
	var id = customerTimes.currentEditItem.CTIM_ID;
	var detailNo = customerTimes.currentEditItem.CTIM_DETAILS_NO;

	
	
	alertify.confirm("Are you sure you want to delete Details No. " + detailNo + "? <span class='glyphicon glyphicon-trash'></span>", function (e) {
	if (e) {
		$.ajax({
			type : "DELETE",
			url : '${pageContext.request.contextPath}/api/customerTime/delete/' + id,
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
function cmdCustomerTimeEditCancel_OnClick() {
	$('#CustomerTimeEdit').modal('hide');
}

// =============================
// Edit Detail OK Button Clicked
// =============================   
function cmdCustomerTimeEditOk_OnClick() {
	var chargeObject = new Object();
	chargeObject.CTIM_ID =  parseInt(document.getElementById('EDIT_CTIM_ID').value);
	chargeObject.CTIM_CUST_ID =  parseInt(document.getElementById('EDIT_CTIM_CUST_ID_DATA').value);
	chargeObject.CTIM_DETAILS_NO =  parseInt(document.getElementById('EDIT_CTIM_DETAILS_NO').value);
	chargeObject.CTIM_INTERVAL_OF_TIMES =  parseInt(document.getElementById('EDIT_CTIM_INTERVAL_OF_TIMES').value);
	chargeObject.CTIM_MAX_UNIT_NO =  document.getElementById('EDIT_CTIM_MAX_UNIT_NO').options[document.getElementById("EDIT_CTIM_MAX_UNIT_NO").selectedIndex].value;
	chargeObject.CTIM_MAX_PARTS_NO =  document.getElementById('EDIT_CTIM_MAX_PARTS_NO').options[document.getElementById("EDIT_CTIM_MAX_PARTS_NO").selectedIndex].value;
	
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
				}, 1000);
			} else {
				toastr.error("Not added!");
			}
		}
	});

}

// =================
// Get Charges Data
// =================   
function getCustomerTimes() {
	var customerTimes = new wijmo.collections.ObservableArray();
	$('#loading').modal('show');
	$.ajax({
				url : '${pageContext.request.contextPath}/api/customerTime/list',
				cache : false,
				type : 'GET',
				contentType : 'application/json; charset=utf-8',
				data : {},
				success : function(Results) {
					$('#loading').modal('hide');
					if (Results.length > 0) {
						for (i = 0; i < Results.length; i++) {
							customerTimes.push({
								EditId : "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditCharge' onclick='cmdCustomerTimeEdit_OnClick()'>Edit</button>",
								DeleteId : "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteCharge' onclick='cmdCustomerTimeDelete_OnClick()'>Delete</button>",
								CTIM_ID : Results[i]["ctim_ID"],
								CTIM_CUST_FK : Results[i].CTIM_CUST_FK.CUST_NAME,
								CTIM_CUST_ID : Results[i]["ctim_CUST_ID"],
								CTIM_DETAILS_NO : Results[i]["ctim_DETAILS_NO"],
								CTIM_INTERVAL_OF_TIMES : Results[i]["ctim_INTERVAL_OF_TIMES"],
								CTIM_MAX_UNIT_NO : Results[i]["ctim_MAX_UNIT_NO"],
								CTIM_MAX_PARTS_NO : Results[i]["ctim_MAX_PARTS_NO"],
								
								CREATED_DATE: Results[i]["created_DATE"],
		                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
		                        UPDATED_DATE: Results[i]["updated_DATE"],
		                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
		                        ISDELETED: Results[i]["isdeleted"],
		                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
		                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
		                        CTIM_CREATED_BY_USER_FK: Results[i]["CTIM_CREATED_BY_USER_FK"],
		                        CTIM_UPDATED_BY_USER_FK: Results[i]["CTIM_UPDATED_BY_USER_FK"]
							});
						}
					} else {
					/* 	alert("No data."); */
					}
				}
			}).fail(function(xhr, textStatus, err) {
					alert(err);
			});
	return customerTimes;
}

// ==================
// Navigation Buttons 
// ==================   
function updateNavigateButtonsCustomerTime() {
	if (customerTimes.pageSize <= 0) {
		document.getElementById('naviagtionPageGrid').style.display = 'none';
		return;
	}
	document.getElementById('naviagtionPageGrid').style.display = 'block';
	if (customerTimes.pageIndex === 0) {
		btnFirstPageGrid.setAttribute('disabled', 'disabled');
		btnPreviousPageGrid.setAttribute('disabled', 'disabled');
		btnNextPageGrid.removeAttribute('disabled');
		btnLastPageGrid.removeAttribute('disabled');
	} else if (customerTimes.pageIndex === (customerTimes.pageCount - 1)) {
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
	btnCurrentPageGrid.innerHTML = (customerTimes.pageIndex + 1) + ' / '
			+ customerTimes.pageCount;
}

//===================
//FlexGrid Selection
//=================== 
function updateDetails() {
	var item = customerTimes.currentItem;
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.CTIM_CREATED_BY_USER_FK.USER_LOGIN;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.CTIM_UPDATED_BY_USER_FK.USER_LOGIN;
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
    //validation
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

	// Collection View
	customerTimes = new wijmo.collections.CollectionView(getCustomerTimes());
	customerTimes.canFilter = true;
	customerTimes.pageSize = 15;

    var filterText = '';
	$('#InputFilter').keyup(function () {
	    filterText = this.value.toLowerCase();
	    customerTimes.refresh();
	});
	customerTimes.filter = function (item) {
        return !filterText || (item.CTIM_CUST_ID.toLowerCase().indexOf(filterText) > -1);
    }
	customerTimes.collectionChanged.addHandler(function (sender, args) {
	    updateNavigateButtonsCustomerTime();
	});
	
	customerTimes.currentChanged.addHandler(function (sender, args) {
	    updateDetails();
	});

	cboCustomer = new wijmo.input.AutoComplete('#EDIT_CTIM_CUST_ID');

	
	// Flex Grid
	customerGrid = new wijmo.grid.FlexGrid('#CustomerTimeGrid');
	customerGrid.initialize({
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
						"header" : "Customer",
						"binding" : "CTIM_CUST_FK",
						"allowSorting" : true,
						"width" : "6*"
					}, 
					{
						"header" : "Details No",
						"binding" : "CTIM_DETAILS_NO",
						"allowSorting" : true,
						"width" : "6*"
					}, 
					{
						"header" : "Interval of Times",
						"binding" : "CTIM_INTERVAL_OF_TIMES",
						"allowSorting" : true,
						"width" : "6*"
					}, 
					{
						"header" : "Max Unit No",
						"binding" : "CTIM_MAX_UNIT_NO",
						"allowSorting" : true,
						"width" : "6*"
					}, 
					{
						"header" : "Max Part No",
						"binding" : "CTIM_MAX_PARTS_NO",
						"allowSorting" : true,
						"width" : "6*"
					} 	
			],
		autoGenerateColumns : false,
		itemsSource : customerTimes,
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

	updateNavigateButtonsCustomerTime();

	btnFirstPageGrid.addEventListener('click', function() {
		customerTimes.moveToFirstPage();
		updateNavigateButtonsCustomerTime();
	});
	btnPreviousPageGrid.addEventListener('click', function() {
		customerTimes.moveToPreviousPage();
		updateNavigateButtonsCustomerTime();
	});
	btnNextPageGrid.addEventListener('click', function() {
		customerTimes.moveToNextPage();
		updateNavigateButtonsCustomerTime();
	});
	btnLastPageGrid.addEventListener('click', function() {
		customerTimes.moveToLastPage();
		updateNavigateButtonsCustomerTime();
	});

});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>