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
	            </span>
	            <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search...">
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

<!-- Calendar Edit Detail -->
<div class="modal fade" id="CalendarActivityEdit">
    <div class="modal-dialog">
        <div class="modal-content border-custom">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Calendar Activity Edit</h4>
            </div>
            <div class="modal-body">
                <form id="calendarActivityForm">
                    <dl class="dl-horizontal">
                        <dt>Customer: </dt>
                        <dd>
                          	<div id="cbo_EDIT_CACT_CUST_ID" class="form-control border-custom"></div>
                            <input id="EDIT_CACT_CUST_ID" name="EDIT_CACT_CUST_ID" type="hidden" required />
                        </dd>
                        <dt>Date: </dt>
                        <dd>
                        	<div id="EDIT_CACT_DATE" class="form-control border-custom"></div>
                            <input id="EDIT_CACT_DATE_DATA" name="EDIT_CACT_DATE_DATA" type="hidden" required/>    
                        </dd>                        
                        <dt>Details No: </dt>
                        <dd>
                        	<input class="form-control border-custom" id="EDIT_CACT_DETAILS_NO" name="EDIT_CACT_DETAILS_NO" type="text" required />
                        </dd>
                        <dt>Activity Classification: </dt>
                        <dd>
                        	<input class="form-control border-custom" id="EDIT_CACT_ACTIVITY_CLASSIFICATION" name="EDIT_CACT_ACTIVITY_CLASSIFICATION" type="text" required />                          
                        </dd>   
                        <dt>Activity Contents: </dt>
                        <dd>
							<input class="form-control border-custom" id="EDIT_CACT_ACTIVITY_CONTENTS" name="EDIT_CACT_ACTIVITY_CONTENTS" type="text" required />                           
                        </dd>   
                        <dt>Start Time ID: </dt>
                        <dd>
							<input class="form-control border-custom" id="EDIT_CACT_START_TIME_ID" name="EDIT_CACT_START_TIME_ID" type="text" required />                           
                        </dd>    
                        <dt>End Time ID: </dt>
                        <dd>
							<input class="form-control border-custom" id="EDIT_CACT_END_TIME_ID" name="EDIT_CACT_END_TIME_ID" type="text" required />                            
                        </dd> 
                        <dt>Operation Flag: </dt>
                        <dd>
							<input class="form-control border-custom" id="EDIT_CACT_OPERATION_FLAG" name="EDIT_CACT_OPERATION_FLAG" type="text" required />                            
                        </dd>                        
                    </dl>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary border-custom"  id="cmdCalendarActivityEditOk" onclick="cmdCalendarActivityEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger border-custom" id="cmdCalendarActivityEditCancel" onclick="cmdCalendarActivityEditCancel_OnClick()">
                    Cancel
                </button>
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

var calendarActivityDate;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

//=================
//Getting the Data
//=================   
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

//========
//Comboxes
//======== 
function createCboCustomer(customers) {
customerCollection = new wijmo.collections.CollectionView(customers);

var customerList = new Array();
for (var i = 0; i < customerCollection.items.length; i++) {
	customerList.push(customerCollection.items[i].customerName);
}
	
cboCustomer.dispose();
	cboCustomer = new wijmo.input.AutoComplete('#cbo_EDIT_CACT_CUST_ID', {
    itemsSource: customerList,
    onSelectedIndexChanged: function () {
        $("#EDIT_CACT_CUST_ID").val(customerCollection.items[this.selectedIndex].id);
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
        backdrop: false
    });

    var calendarActivity = calendarActivities.currentEditItem;
    
    document.getElementById('EDIT_CACT_ID').value = calendarActivity.CACT_ID !== null && typeof (calendarActivity.CACT_ID) != 'undefined' ? wijmo.Globalize.format(calendarActivity.CACT_ID) : 0;
    document.getElementById('EDIT_CACT_CLDR_ID').value = calendarActivity.CACT_CLDR_ID ? calendarActivity.CACT_CLDR_ID : '';
    document.getElementById('EDIT_CACT_CUST_ID').value = calendarActivity.CACT_CUST_ID ? calendarActivity.CACT_CUST_ID : '';
    document.getElementById('EDIT_CACT_DATE_DATA').value = calendarActivity.CACT_DATE ? calendarActivity.CACT_DATE : '';
    document.getElementById('EDIT_CACT_DETAILS_NO').value = calendarActivity.CACT_DETAILS_NO ? calendarActivity.CACT_DETAILS_NO : '';
    document.getElementById('EDIT_CACT_ACTIVITY_CLASSIFICATION').value = calendarActivity.CACT_ACTIVITY_CLASSIFICATION ? calendarActivity.CACT_ACTIVITY_CLASSIFICATION : '';
    document.getElementById('EDIT_CACT_ACTIVITY_CONTENTS').value = calendarActivity.CACT_ACTIVITY_CONTENTS ? calendarActivity.CACT_ACTIVITY_CONTENTS : '';
    document.getElementById('EDIT_CACT_START_TIME_ID').value = calendarActivity.CACT_START_TIME_ID ? calendarActivity.CACT_START_TIME_ID : '';
    document.getElementById('EDIT_CACT_END_TIME_ID').value = calendarActivity.CACT_END_TIME_ID ? calendarActivity.CACT_END_TIME_ID : '';
    document.getElementById('EDIT_CACT_OPERATION_FLAG').value = calendarActivity.CACT_OPERATION_FLAG ? calendarActivity.CACT_OPERATION_FLAG : '';
    
    var splitDate = calendarActivity.EDIT_CACT_DATE.split("-");
    
    calendarActivityDate.dispose();
    calendarActivityDate = new wijmo.input.InputDate('#EDIT_CACT_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date(splitDate[0], splitDate[1] - 1, splitDate[2]),
        onValueChanged: function () {
            document.getElementById('EDIT_CACT_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });  
}

// ==================
// Add Button Clicked
// ==================   
function cmdCalendarActivityAdd_OnClick() {
    $('#CalendarActivityEdit').modal({
        show: true,
        backdrop: false
    });
    
    var currentDate = new Date();
    
    document.getElementById('EDIT_CACT_ID').value = 0;
    document.getElementById('EDIT_CACT_CLDR_ID').value = '';
    document.getElementById('EDIT_CACT_CUST_ID').value = '';
    document.getElementById('EDIT_CACT_DATE_DATA').value = currentDate.toString("yyyy-MM-dd");
    document.getElementById('EDIT_CACT_DETAILS_NO').value = '';
    document.getElementById('EDIT_CACT_ACTIVITY_CLASSIFICATION').value = '';
    document.getElementById('EDIT_CACT_ACTIVITY_CONTENTS').value = '';
    document.getElementById('EDIT_CACT_START_TIME_ID').value = '';
    document.getElementById('EDIT_CACT_END_TIME_ID').value = '';
    document.getElementById('EDIT_CACT_OPERATION_FLAG').value = '';
    
    calendarActivityDate.dispose();
    calendarActivityDate = new wijmo.input.InputDate('#EDIT_CACT_DATE', {
        format: 'MM/dd/yyyy',
        value: currentDate,
        onValueChanged: function () {
            document.getElementById('EDIT_CACT_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });         
}

// =====================
// Delete Button Clicked
// =====================   
function cmdCalendarActivityDelete_OnClick() {
	calendarActivities.editItem(calendarActivities.currentItem);
    
    var id = calendarActivities.currentEditItem.CACT_ID;
    var calendarId = calendarActivities.currentEditItem.CACT_CLDR_ID;

    alertify.confirm("<span class='glyphicon glyphicon-trash'></span> Are you sure you want to delete Calendar ID " + calendarId + "?", function (e) {
    if (e) {
        $.ajax({
            type: "DELETE",
            url: '${pageContext.request.contextPath}/api/calendarActivity/delete/' + id,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            statusCode: {
                200: function () {
                    toastr.success('Successfully Deleted.');
                    window.setTimeout(function () { location.reload() }, 1000);
                },
                404: function () {
                    toastr.error("Not found.");
                },
                400: function () {
                    toastr.error("Bad request.");
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
	calendarActivityObject.CACT_CLDR_ID = document.getElementById('EDIT_CACT_CLDR_ID').value;
	calendarActivityObject.CACT_CUST_ID = document.getElementById('EDIT_CACT_CUST_ID').value;
	calendarActivityObject.CACT_DETAILS_NO = document.getElementById('EDIT_CACT_DETAILS_NO').value;
	calendarActivityObject.CACT_ACTIVITY_CLASSIFICATION = document.getElementById('EDIT_CACT_ACTIVITY_CLASSIFICATION').value;
	calendarActivityObject.CACT_ACTIVITY_CONTENTS = document.getElementById('EDIT_CACT_ACTIVITY_CONTENTS').value;
	calendarActivityObject.CACT_START_TIME_ID = document.getElementById('EDIT_CACT_START_TIME_ID').value;
	calendarActivityObject.CACT_END_TIME_ID = document.getElementById('EDIT_CACT_END_TIME_ID').value;
	calendarActivityObject.CACT_OPERATION_FLAG = document.getElementById('EDIT_CACT_OPERATION_FLAG').value;	
	
	
	var splitDate = document.getElementById('EDIT_CACT_DATE_DATA').value.split("-");
	
	calendarActivityObject.CACT_DATE = new Date(splitDate[0],splitDate[1] - 1, splitDate[2]);
	
	var data = JSON.stringify(calendarActivityObject);
	
	$.ajax({
	    type: "POST",
	    url: '${pageContext.request.contextPath}/api/calendarActivity/update',
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    data: data,
	    success: function (data) {
	        if (data.CACT_ID > 0) {
	            toastr.success('Successfully updated.');
	            window.setTimeout(function () { location.reload() }, 1000);
	        } else {
	            toastr.error("Not updated.");
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
                        CACT_CUST_FK_NAME: Results[i].CACT_CUST_FK.CUST_NAME,
                        CACT_DATE: Results[i]["cact_DATE"],
                        CACT_DETAILS_NO: Results[i]["cact_DETAILS_NO"],
                        CACT_ACTIVITY_CLASSIFICATION: Results[i]["cact_ACTIVITY_CLASSIFICATION"],
                        CACT_ACTIVITY_CONTENTS: Results[i]["cact_ACTIVITY_CONTENTS"],
                        CACT_START_TIME_ID: Results[i]["cact_START_TIME_ID"],
                        CACT_END_TIME_ID: Results[i]["cact_END_TIME_ID"],
                        CACT_OPERATION_FLAG: Results[i]["cact_OPERATION_FLAG"],
                        CACT_CLDR_FK: Results[i].CACT_CLDR_FK.cldr_DATE,

                        
                        CREATED_DATE: Results[i]["created_DATE"],
                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
                        UPDATED_DATE: Results[i]["updated_DATE"],
                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
                        ISDELETED: Results[i]["isdeleted"],
                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
                        CACT_CREATED_BY_USER_FK: Results[i].CACT_CREATED_BY_USER_FK.USER_LOGIN,
                        CACT_UPDATED_BY_USER_FK: Results[i].CACT_UPDATED_BY_USER_FK.USER_LOGIN
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
    else if (calendarActivities.pageIndex === (CalendarActivities.pageCount - 1)) {
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
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.CACT_CREATED_BY_USER_FK;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.CACT_CREATED_BY_USER_FK;
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
	
	 // Date Control Initialization
    calendarActivityDate = new wijmo.input.InputDate('#EDIT_CACT_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date()
    });  	
	
    // Validation
    $('#cmdCalendarActivityEditOk').click(function () {
        if (FormValidate() == true) {
        	cmdCalendarActivityEditOkFunction();
            $('#CalendarActivityEdit').modal('hide');
        }
        else {
            toastr.error("Fill the required field!");
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
    calendarActivities.pageSize  = 15;
    
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
    
    cboCustomer = new wijmo.input.AutoComplete('#cbo_EDIT_CACT_CUST_ID');
	getCustomers();
    
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
                        "header": "Calendar ID",
                        "binding": "CACT_CLDR_ID",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Customer Name",
                        "binding": "CACT_CUST_FK_NAME",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Date",
                        "binding": "CACT_CLDR_FK",
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