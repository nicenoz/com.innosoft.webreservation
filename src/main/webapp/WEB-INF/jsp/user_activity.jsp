<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - Activity</title>

<!-- Calendar Activity List -->
<div class="container">
	<section id="calendarActivityList">
		<div class="row">
			<div class="col-lg-12">
				<h4>Calendar Activity List</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default border-custom" type="button" readonly>
							<i class="fa fa-search"></i>
						</button>
					</span> <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search">
				</div>
			</div>
			<div class="col-lg-8">
				<button id="cmdAddCalendarActivity" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdCalendarActivityAdd_OnClick()">Add</button>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-lg-12">
				<div id="calendarActivityGrid" class="grid border-custom"></div>
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

<!-- Calendar Edit Detail -->
<div class="modal fade" id="CalendarActivityEdit">
	<div class="modal-dialog">
		<div class="modal-content border-custom">
			<div class="modal-header">
				<button type="button" class="close" aria-hidden="true">&times;</button>
				<h4 class="modal-title">Calendar Activity Edit</h4>
			</div>
			<div class="modal-body">
				<form id="calendarActivityForm">
					<dl class="dl-horizontal">
						<dt>Calendar:</dt>
						<dd>
							<input id="EDIT_CACT_ID" type="hidden" />

							<div id="EDIT_CACT_CLDR_ID_DATE" class="autocomplete-wide"></div>
							<input id="EDIT_CACT_CLDR_ID_DATE_DATA" name="EDIT_CACT_CLDR_ID_DATE_DATA" type="hidden" required />
							<input id="EDIT_CACT_DATE" name="EDIT_CACT_DATE" type="hidden" required />
						</dd>
						<dt>Customer:</dt>
						<dd>
							<div id="EDIT_CACT_CUST_ID" class="autocomplete-wide"></div>
							<input id="EDIT_CACT_CUST_ID_DATA" name="EDIT_CACT_CUST_ID_DATA" type="hidden" required /> <input id="EDIT_CUST_NAME" name="EDIT_CUST_NAME" type="hidden" required />
						</dd>
						<dt>Details No:</dt>
						<dd>
							<div id="EDIT_CACT_DETAILS_NO" class="autocomplete-wide"></div>
						</dd>
						<dt>Activity Classification:</dt>
						<dd>
							<input class="form-control border-custom" id="EDIT_CACT_ACTIVITY_CLASSIFICATION" name="EDIT_CACT_ACTIVITY_CLASSIFICATION" type="text" required />
						</dd>
						<dt>Activity Contents:</dt>
						<dd>
							<input class="form-control border-custom" id="EDIT_CACT_ACTIVITY_CONTENTS" name="EDIT_CACT_ACTIVITY_CONTENTS" type="text" required />
						</dd>
						<dt>Start Time ID:</dt>
						<dd>
							<div id="EDIT_CACT_START_TIME" class="autocomplete-wide"></div>
							<input id="EDIT_CACT_START_TIME_ID" name="EDIT_CACT_START_TIME_ID" type="hidden" required /> 
							<input id="EDIT_CACT_START_TIME_ID_DATA" name="EDIT_CACT_START_TIME_ID_DATA" type="hidden" required />
						</dd>
						<dt>End Time ID:</dt>
						<dd>
							<div id="EDIT_CACT_END_TIME" class="autocomplete-wide"></div>
							<input id="EDIT_CACT_END_TIME_ID" name="EDIT_CACT_END_TIME_ID" type="hidden" required /> 
							<input id="EDIT_CACT_END_TIME_ID_DATA" name="EDIT_CACT_END_TIME_ID_DATA" type="hidden" required />
						</dd>
						<dt>Operation Flag:</dt>
						<dd>
							<select class="form-control border-custom" id="EDIT_CACT_OPERATION_FLAG" name="EDIT_CACT_OPERATION_FLAG" required>
								<option value="1">Yes</option>
								<option value="0">No</option>
							</select>
						</dd>
					</dl>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary border-custom" id="cmdCalendarActivityEditOk" onclick="cmdCalendarActivityEditOk_OnClick()">Ok</button>
				<button type="button" class="btn btn-danger border-custom" id="cmdCalendarActivityEditCancel" onclick="cmdCalendarActivityEditCancel_OnClick()">Cancel</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// ================
// Global variables
// ================
var calendarActivities;
var calendarActivityGrid;

var cboCustomer;
var cboCalendarDate;
var cboCustomerStartTimeId;
var cboCustomerEndTimeId;
var cboCalendarActivityDetailsNo;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

var calendarActivityDetailsNo;


// ====================================
// Get Customer, Calendar Date and Time
// ====================================	
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

function getCalendarDate() {
	 var calendarDates = new wijmo.collections.ObservableArray();
	 $.ajax({
	     url: '${pageContext.request.contextPath}/api/calendar/list',
	     cache: false,
	     type: 'GET',
	     contentType: 'application/json; charset=utf-8',
	     data: {},
	     success: function (results) {
	         if (results.length > 0) {
	             for (i = 0; i < results.length; i++) {
	            	 calendarDates.push({
	                     calendarId: results[i]["CLDR_ID"],
	                     calendarDate: results[i]["cldr_DATE"]
	                 });
	             }
	             createCboCalendarDate(calendarDates);
	         }
	     }
	 }).fail(
	     function (xhr, textStatus, err) {
	         alert(err);
	     }
	 );
}

function getCustomerTime(customerId) {
	var customerId = document.getElementById('EDIT_CACT_CUST_ID_DATA').value;
    var customerTimes = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/customerTime/listByCustomer',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId" : customerId},
        success: function (results) {
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	customerTimes.push({
                        customerTimeId: results[i]["CTIM_ID"],
                        customerDetails: results[i]["CTIM_DETAILS_NO"]
                    });
                }
                createCustomerTimeId(customerTimes);
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );	
}


// ===========
// Combo Boxes
// ===========
function createCboCustomer(customers) {
	customerCollection = new wijmo.collections.CollectionView(customers);
 
 var customerList = new Array();
 for (var i = 0; i < customerCollection.items.length; i++) {
 	customerList.push(customerCollection.items[i].customerName);
 }
	
 cboCustomer.dispose();
	cboCustomer = new wijmo.input.ComboBox('#EDIT_CACT_CUST_ID', {
     itemsSource: customerList,
     placeholder: 'select a customer',
     isEditable: false,
     selectedValue: document.getElementById('EDIT_CUST_NAME').value.toString(),
     onSelectedIndexChanged: function () {
         $("#EDIT_CACT_CUST_ID_DATA").val(customerCollection.items[this.selectedIndex].customerId);
         getCustomerTime(customerCollection.items[this.selectedIndex].customerId)
     }
 });	
}

function createCboCalendarDate(calendarDates) {
	calendarDateCollection = new wijmo.collections.CollectionView(calendarDates);
 
 var calendarDateList = new Array();
 for (var i = 0; i < calendarDateCollection.items.length; i++) {
	 calendarDateList.push(calendarDateCollection.items[i].calendarDate);
 }
	
 	 cboCalendarDate.dispose();
 	 cboCalendarDate = new wijmo.input.ComboBox('#EDIT_CACT_CLDR_ID_DATE', {
	     itemsSource: calendarDateList,
	     placeholder: 'select a Calendar Date',
	     isEditable: false,
	     selectedValue: document.getElementById('EDIT_CACT_DATE').value.toString(),
	     onSelectedIndexChanged: function () {
	         $("#EDIT_CACT_CLDR_ID_DATE_DATA").val(calendarDateCollection.items[this.selectedIndex].calendarId);
	     }
 	 });	
}

function createCustomerTimeId(customerTimes) {
 customerTimeCollection = new wijmo.collections.CollectionView(customerTimes);
 
 var customerTimeList = new Array();
 for (var i = 0; i < customerTimeCollection.items.length; i++) {
	 customerTimeList.push(customerTimeCollection.items[i].customerDetails);
 }
	
     cboCustomerStartTimeId.dispose();
     cboCustomerStartTimeId = new wijmo.input.ComboBox('#EDIT_CACT_START_TIME', {
     itemsSource: customerTimeList,
     placeholder: 'select customer Start time Id',
     isEditable: false,
	 selectedValue: document.getElementById('EDIT_CACT_START_TIME_ID_DATA').value,
     onSelectedIndexChanged: function () {
         $("#EDIT_CACT_START_TIME_ID").val(customerTimeCollection.items[this.selectedIndex].customerTimeId);
	     }
	 });	
 
     cboCustomerEndTimeId.dispose();
     cboCustomerEndTimeId = new wijmo.input.ComboBox('#EDIT_CACT_END_TIME', {
     itemsSource: customerTimeList,
     placeholder: 'select customer End time Id',
     isEditable: false,
	 selectedValue: document.getElementById('EDIT_CACT_END_TIME_ID_DATA').value,
     onSelectedIndexChanged: function () {
         $("#EDIT_CACT_END_TIME_ID").val(customerTimeCollection.items[this.selectedIndex].customerTimeId);
	     }
	 });	
}

// ===================
// Edit Button Clicked
// ===================
function cmdCalendarActivityEdit_OnClick() {
	calendarActivities.editItem(calendarActivities.currentItem);

    $('#CalendarActivityEdit').modal({
        show: true,
        backdrop: 'static'
    });
    
    calendarActivityDetailsNo = new Array();
	for (var i = 1; i <= 20; i++) {
		calendarActivityDetailsNo.push(i);
	}
	cboCalendarActivityDetailsNo.dispose();
	cboCalendarActivityDetailsNo = new wijmo.input.ComboBox('#EDIT_CACT_DETAILS_NO', {
		placeholder: 'select details no',
	     itemsSource: calendarActivityDetailsNo,
	     isEditable: false
	});

    var calendarActivity = calendarActivities.currentEditItem;
    
    document.getElementById('EDIT_CACT_ID').value = calendarActivity.CACT_ID !== null && typeof (calendarActivity.CACT_ID) != 'undefined' ? wijmo.Globalize.format(calendarActivity.CACT_ID) : 0;
    document.getElementById('EDIT_CACT_CLDR_ID_DATE_DATA').value = calendarActivity.CACT_CLDR_ID ? calendarActivity.CACT_CLDR_ID : '';
    document.getElementById('EDIT_CACT_CUST_ID_DATA').value = calendarActivity.CACT_CUST_ID ? calendarActivity.CACT_CUST_ID : '';
    document.getElementById('EDIT_CACT_DATE').value = calendarActivity.CACT_CLDR_FK ? calendarActivity.CACT_CLDR_FK : '';
    document.getElementById('EDIT_CUST_NAME').value = calendarActivity.CACT_CUST_FK ? calendarActivity.CACT_CUST_FK : '';
    /* document.getElementById('EDIT_CACT_DETAILS_NO').value = calendarActivity.CACT_DETAILS_NO ? calendarActivity.CACT_DETAILS_NO : ''; */
    console.log(calendarActivity.CACT_DETAILS_NO);
    cboCalendarActivityDetailsNo.selectedIndex = calendarActivity.CACT_DETAILS_NO ? calendarActivity.CACT_DETAILS_NO - 1: 0;
    document.getElementById('EDIT_CACT_ACTIVITY_CLASSIFICATION').value = calendarActivity.CACT_ACTIVITY_CLASSIFICATION ? calendarActivity.CACT_ACTIVITY_CLASSIFICATION : '';
    document.getElementById('EDIT_CACT_ACTIVITY_CONTENTS').value = calendarActivity.CACT_ACTIVITY_CONTENTS ? calendarActivity.CACT_ACTIVITY_CONTENTS : '';
    document.getElementById('EDIT_CACT_START_TIME_ID').value = calendarActivity.CACT_START_TIME_ID ? calendarActivity.CACT_START_TIME_ID : '';
    document.getElementById('EDIT_CACT_END_TIME_ID').value = calendarActivity.CACT_END_TIME_ID ? calendarActivity.CACT_END_TIME_ID : '';
    document.getElementById('EDIT_CACT_START_TIME_ID_DATA').value = calendarActivity.CACT_START_TIME_FK ? calendarActivity.CACT_START_TIME_FK : '';
    document.getElementById('EDIT_CACT_END_TIME_ID_DATA').value = calendarActivity.CACT_END_TIME_FK ? calendarActivity.CACT_END_TIME_FK : '';
    document.getElementById('EDIT_CACT_OPERATION_FLAG').value = calendarActivity.CACT_OPERATION_FLAG;
    
	getCustomers();
	getCalendarDate();
	getCustomerTime();
}

// ==================
// Add Button Clicked
// ==================   
function cmdCalendarActivityAdd_OnClick() {
    $('#CalendarActivityEdit').modal({
        show: true,
        backdrop: 'static'
    });
        
    document.getElementById('EDIT_CACT_ID').value = 0;
    document.getElementById('EDIT_CACT_CLDR_ID_DATE_DATA').value = '';
    document.getElementById('EDIT_CACT_CUST_ID_DATA').value = '';
    /* document.getElementById('EDIT_CACT_DETAILS_NO').value =  */
    cboCalendarActivityDetailsNo.selectedIndex = 0;
    document.getElementById('EDIT_CACT_ACTIVITY_CLASSIFICATION').value = '';
    document.getElementById('EDIT_CACT_ACTIVITY_CONTENTS').value = '';
    document.getElementById('EDIT_CACT_START_TIME_ID').value = '';
    document.getElementById('EDIT_CACT_END_TIME_ID').value = '';
    document.getElementById('EDIT_CACT_OPERATION_FLAG').value = '';
    
 	getCalendarDate();
 	getCustomers();
 	
}

// =====================
// Delete Button Clicked
// =====================   
function cmdCalendarActivityDelete_OnClick() {
	calendarActivities.editItem(calendarActivities.currentItem);
    
    var id = calendarActivities.currentEditItem.CACT_ID;
    var calendarId = calendarActivities.currentEditItem.CACT_CLDR_ID;

    alertify.confirm("<span class='glyphicon glyphicon-trash'></span> " + getMessage("P0001"), function (e) {
    if (e) {
        $.ajax({
            type: "DELETE",
            url: '${pageContext.request.contextPath}/api/calendarActivity/delete/' + id,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            statusCode: {
                200: function () {
                    toastr.success(getMessage("S0001"));
                    window.setTimeout(function () { location.reload() }, 1000);
                },
                404: function () {
                    toastr.error(getMessage("E0004"));
                },
                400: function () {
                    toastr.error(getMessage("E0003"));
                }
            }
        });
    	}
    });
}

// =================================
// Edit Detail Cancel Button Clicked
// =================================     
function cmdCalendarActivityEditCancel_OnClick() {
	$('#CalendarActivityEdit').modal('hide');    	
}

// =============================
// Edit Detail OK Button Clicked
// =============================     
function cmdCalendarActivityEditOk_OnClick() {
	var calendarActivityObject = new Object();

	calendarActivityObject.CACT_ID = parseInt(document.getElementById('EDIT_CACT_ID').value);
	calendarActivityObject.CACT_CLDR_ID = document.getElementById('EDIT_CACT_CLDR_ID_DATE_DATA').value;
	calendarActivityObject.CACT_CUST_ID = document.getElementById('EDIT_CACT_CUST_ID_DATA').value;
	calendarActivityObject.CACT_DETAILS_NO = cboCalendarActivityDetailsNo.selectedItem; /* document.getElementById('EDIT_CACT_DETAILS_NO').value; */
	calendarActivityObject.CACT_ACTIVITY_CLASSIFICATION = document.getElementById('EDIT_CACT_ACTIVITY_CLASSIFICATION').value;
	calendarActivityObject.CACT_ACTIVITY_CONTENTS = document.getElementById('EDIT_CACT_ACTIVITY_CONTENTS').value;
	calendarActivityObject.CACT_START_TIME_ID = document.getElementById('EDIT_CACT_START_TIME_ID').value;
	calendarActivityObject.CACT_END_TIME_ID = document.getElementById('EDIT_CACT_END_TIME_ID').value;
	calendarActivityObject.CACT_OPERATION_FLAG = document.getElementById('EDIT_CACT_OPERATION_FLAG').options[document.getElementById("EDIT_CACT_OPERATION_FLAG").selectedIndex].value;	
	
	var data = JSON.stringify(calendarActivityObject);
	
	$.ajax({
	    type: "POST",
	    url: '${pageContext.request.contextPath}/api/calendarActivity/update',
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    data: data,
	    success: function (data) {
	        if (data.CACT_ID > 0) {
	        	 toastr.success(getMessage("S0002"));
                 window.setTimeout(function () { location.reload() }, 1000);
	        } else {
	            toastr.error(getMessage("E0006"));
	        }
	    }
	});
}

// =================
// Get Calendar Activities Data
// =================   
function getCalendarActivities() {
    var calendarActivities = new wijmo.collections.ObservableArray();
    $('#loading').modal('show');
    $.ajax({
        url: '${pageContext.request.contextPath}/api/calendarActivity/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (Results) {
            $('#loading').modal('hide');
            if (Results.length > 0) {
                for (i = 0; i < Results.length; i++) {
                	calendarActivities.push({
                        EditId: "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditMessage' onclick='cmdCalendarActivityEdit_OnClick()'>Edit</button>",
                        DeleteId: "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteMessage' onclick='cmdCalendarActivityDelete_OnClick()'>Delete</button>",
                        CACT_ID: Results[i]["cact_ID"],
                        CACT_CLDR_ID: Results[i]["cact_CLDR_ID"],
                        CACT_CLDR_FK: Results[i].CACT_CLDR_FK.cldr_DATE,
                        CACT_CUST_ID: Results[i]["cact_CUST_ID"],
                        CACT_CUST_FK: Results[i].CACT_CUST_FK.cust_NAME,
                        CACT_DATE: Results[i]["cact_DATE"],
                        CACT_DETAILS_NO: Results[i]["cact_DETAILS_NO"],
                        CACT_ACTIVITY_CLASSIFICATION: Results[i]["cact_ACTIVITY_CLASSIFICATION"],
                        CACT_ACTIVITY_CONTENTS: Results[i]["cact_ACTIVITY_CONTENTS"],
                        CACT_START_TIME_ID: Results[i]["CACT_END_TIME_ID"],
                        CACT_END_TIME_ID: Results[i]["CACT_END_TIME_ID"],
                        CACT_START_TIME_FK: Results[i].CACT_START_TIME_FK.ctim_DETAILS_NO,
                        CACT_END_TIME_FK: Results[i].CACT_END_TIME_FK.ctim_DETAILS_NO,
                        CACT_OPERATION_FLAG: Results[i]["cact_OPERATION_FLAG"],
           
                        CREATED_DATE: Results[i]["created_DATE"],
                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
                        UPDATED_DATE: Results[i]["updated_DATE"],
                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
                        ISDELETED: Results[i]["isdeleted"],
                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
                        CACT_CREATED_BY_USER_FK: Results[i]["CACT_CREATED_BY_USER_FK"],
                        CACT_UPDATED_BY_USER_FK: Results[i]["CACT_UPDATED_BY_USER_FK"]
                    });
                }
            } else {
              /*   alert("No data."); */
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );
	return calendarActivities;
}

// ==================
// Navigation Buttons
// ==================   
function updateNavigateButtonsCalendarActivitiy() {
    if (calendarActivities.pageSize <= 0) {
        document.getElementById('naviagtionPageGrid').style.display = 'none';
        return;
    }
    document.getElementById('naviagtionPageGrid').style.display = 'block';
    if (calendarActivities.pageIndex === 0) {
        btnFirstPageGrid.setAttribute('disabled', 'disabled');
        btnPreviousPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    else if (calendarActivities.pageIndex === (calendarActivities.pageCount - 1)) {
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
    btnCurrentPageGrid.innerHTML = (calendarActivities.pageIndex + 1) + ' / ' + calendarActivities.pageCount;
}

//===================
//FlexGrid Selection
//=================== 
function updateDetails() {	
	var item = calendarActivities.currentItem;

	document.getElementById('EDIT_CREATED_BY').innerHTML = item.CACT_CREATED_BY_USER_FK.USER_LOGIN;;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.CACT_UPDATED_BY_USER_FK.USER_LOGIN;;
	document.getElementById('EDIT_UPDATE_DATE').innerHTML = item.UPDATED_DATE;	
}

// =====================
// Detail Edit Validator
// =====================     
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

// ==============================
// Detail Edit Validator Defaults
// ==============================    
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

// ============
// On Page Load
// ============
$(document).ready(function () {
		
	$("#EDIT_CACT_DETAILS_NO").keydown(function(event) {
		// Allow only backspace and delete
		if ( event.keyCode == 46 || event.keyCode == 8 ) {
			// let it happen, don't do anything
		}
		else {
			// Ensure that it is a number and stop the keypress
			if (event.keyCode < 48 || event.keyCode > 57 ) {
				event.preventDefault();	
			}	
		}
	});
	
    // Validation
    $('#cmdCalendarActivityEditOk').click(function () {
        if (FormValidate() != true) {
            toastr.error(getMessage("E0005"));
        }
    });
    $('#cmdCalendarActivityEditCancel, .close').click(function () {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#CalendarActivityEdit').modal('hide');
    });
    $('.close-btn').hide();

    // Collection View
    calendarActivities = new wijmo.collections.CollectionView(getCalendarActivities());
    calendarActivities.canFilter = true;
    calendarActivities.pageSize  = 10;
    
    var filterText = '';
    $('#InputFilter').keyup(function () {
        filterText = this.value.toLowerCase();
        calendarActivities.refresh();
    });
    calendarActivities.filter = function (item) {
        return !filterText || (item.CalendarId.toLowerCase().indexOf(filterText) > -1);
    }
    calendarActivities.collectionChanged.addHandler(function (sender, args) {
    	updateNavigateButtonsCalendarActivitiy();
    });
    
    calendarActivities.currentChanged.addHandler(function (sender, args) {
	    updateDetails();
	});
    
    cboCustomer = new wijmo.input.AutoComplete('#EDIT_CACT_CUST_ID');
	cboCalendarDate = new wijmo.input.AutoComplete('#EDIT_CACT_CLDR_ID_DATE');
	cboCustomerStartTimeId = new wijmo.input.AutoComplete('#EDIT_CACT_START_TIME');
	cboCustomerEndTimeId = new wijmo.input.AutoComplete('#EDIT_CACT_END_TIME');
	
	calendarActivityDetailsNo = new Array();
	for (var i = 1; i <= 20; i++) {
		calendarActivityDetailsNo.push(i);
	}
	cboCalendarActivityDetailsNo = new wijmo.input.AutoComplete('#EDIT_CACT_DETAILS_NO', {
	     itemsSource: calendarActivityDetailsNo,
	 });	
 
    // Flex Grid
    calendarActivityGrid = new wijmo.grid.FlexGrid('#calendarActivityGrid');
    calendarActivityGrid.initialize({
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
                        "header": "Calendar",
                        "binding": "CACT_CLDR_FK",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Customer",
                        "binding": "CACT_CUST_FK",
                        "allowSorting": true,
                        "width": "2*"
                    },                 
                    {
                        "header": "Details No",
                        "binding": "CACT_DETAILS_NO",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Activity Classfication",
                        "binding": "CACT_ACTIVITY_CLASSIFICATION",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Activity Contents",
                        "binding": "CACT_ACTIVITY_CONTENTS",
                        "allowSorting": true,
                        "width": "2*"
                    }   
        ],
        autoGenerateColumns: false,
        itemsSource: calendarActivities,
        isReadOnly: true,
        selectionMode: wijmo.grid.SelectionMode.Row
    });
    calendarActivityGrid.trackChanges = true;

    // Navigation button
    btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
    btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
    btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
    btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
    btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

    updateNavigateButtonsCalendarActivitiy();

    btnFirstPageGrid.addEventListener('click', function () {
    	calendarActivities.moveToFirstPage();
    	updateNavigateButtonsCalendarActivitiy();
    });
    btnPreviousPageGrid.addEventListener('click', function () {
    	calendarActivities.moveToPreviousPage();
    	updateNavigateButtonsCalendarActivitiy();
    });
    btnNextPageGrid.addEventListener('click', function () {
    	calendarActivities.moveToNextPage();
    	updateNavigateButtonsCalendarActivitiy();
    });
    btnLastPageGrid.addEventListener('click', function () {
    	calendarActivities.moveToLastPage();
    	updateNavigateButtonsCalendarActivitiy();
    });
});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>
