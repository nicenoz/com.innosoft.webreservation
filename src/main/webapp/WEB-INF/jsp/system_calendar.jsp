<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Calendar</title>

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
		                <button class="btn btn-default border-custom" type="button" readonly>
		                	<i class="fa fa-search"></i>
		                </button>
		            </span>
		            <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search">
		        </div>
		    </div>
		    <div class="col-lg-8">
		        <button id="cmdCalendarAdd" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdCalendarAdd_OnClick()">Add</button>
		    </div>
		</div>
		<br />
		<div class="row">
		    <div class="col-lg-12">
		        <div id="calendarGrid" class="grid border-custom"></div>
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
<div class="modal fade" id="CalendarEdit">
    <div class="modal-dialog">
        <div class="modal-content border-custom">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Calendar Edit</h4>
            </div>
            <div class="modal-body">
                <form id="messageForm">
                    <dl class="dl-horizontal">
                        <dt>Date: </dt>
                        <dd>
                        	<input id="EDIT_CLDR_ID" type="hidden" />
                        	<div class="col-md-12" id="EDIT_CLDR_DATE"></div>
                            <input id="EDIT_CLDR_DATE_DATA" type="hidden" />  
                        </dd>
                        <dt>Daycode: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CLDR_DAYCODE" name="EDIT_CLDR_DAYCODE" type="text" required />
                        </dd>
                        <dt>Note: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CLDR_NOTE" name="EDIT_CLDR_NOTE" type="text" required />
                        </dd>                      
                    </dl>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary border-custom"  id="CmdCalendarEditOk" onclick="cmdCalendarEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger border-custom" id="CmdCalendarEditCancel" onclick="cmdCalendarEditCancel_OnClick()">
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
var calendars;
var calendarGrid;

var calendarDate;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;
	
// ===================
// Edit Button Clicked
// ===================
function cmdCalendarEdit_OnClick() {
    calendars.editItem(calendars.currentItem);

    $('#CalendarEdit').modal({
        show: true,
        backdrop: 'static'
    });

    var calendar = calendars.currentEditItem;
    document.getElementById('EDIT_CLDR_ID').value = calendar.CLDR_ID !== null && typeof (calendar.CLDR_ID) != 'undefined' ? wijmo.Globalize.format(calendar.CLDR_ID) : 0;
    document.getElementById('EDIT_CLDR_DATE_DATA').value = calendar.CLDR_DATE ? calendar.CLDR_DATE : '';
    document.getElementById('EDIT_CLDR_DAYCODE').value = calendar.CLDR_DAYCODE ? calendar.CLDR_DAYCODE : '';
    document.getElementById('EDIT_CLDR_NOTE').value = calendar.CLDR_NOTE ? calendar.CLDR_NOTE : '';
 
    var splitDate = calendar.CLDR_DATE.split("-");

    calendarDate.dispose();
    calendarDate = new wijmo.input.InputDate('#EDIT_CLDR_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date(splitDate[0], splitDate[1] - 1, splitDate[2]),
        onValueChanged: function () {
            document.getElementById('EDIT_CLDR_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });         
}
    
// ==================
// Add Button Clicked
// ==================   
function cmdCalendarAdd_OnClick() {
    $('#CalendarEdit').modal({
        show: true,
        backdrop: 'static'
    });
    
    var currentDate = new Date();
    
    document.getElementById('EDIT_CLDR_ID').value = 0;
    document.getElementById('EDIT_CLDR_DATE_DATA').value = currentDate.toString("yyyy-MM-dd");
    document.getElementById('EDIT_CLDR_DAYCODE').value = '';
    document.getElementById('EDIT_CLDR_NOTE').value = '';

    calendarDate.dispose();
    calendarDate = new wijmo.input.InputDate('#EDIT_CLDR_DATE', {
        format: 'MM/dd/yyyy',
        value: currentDate,
        onValueChanged: function () {
            document.getElementById('EDIT_CLDR_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });     
}
    
// =====================
// Delete Button Clicked
// =====================   
function cmdCalendarDelete_OnClick() {
    calendars.editItem(calendars.currentItem);
    
    var id = calendars.currentEditItem.CLDR_ID;
    var calendarDayCode = calendars.currentEditItem.CLDR_DAYCODE;
	
    alertify.confirm("Are you sure you want to delete Calendar Day Code " + calendarDayCode + "? <span class='glyphicon glyphicon-trash'></span>", function (e) {
    if (e) {
        $.ajax({
            type: "DELETE",
            url: '${pageContext.request.contextPath}/api/calendar/delete/' + id,
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
function cmdCalendarEditCancel_OnClick() {
	$('#CalendarEdit').modal('hide');    	
}
    
// =============================
// Edit Detail OK Button Clicked
// =============================     
function cmdCalendarEditOk_OnClick() {
 	var calendarObject = new Object();

 	calendarObject.CLDR_ID = parseInt(document.getElementById('EDIT_CLDR_ID').value);
 	calendarObject.CLDR_DAYCODE = document.getElementById('EDIT_CLDR_DAYCODE').value;
 	calendarObject.CLDR_NOTE = document.getElementById('EDIT_CLDR_NOTE').value;
 
 	var splitDate = document.getElementById('EDIT_CLDR_DATE_DATA').value.split("-");

 	calendarObject.CLDR_DATE = new Date(splitDate[0], splitDate[1] - 1, splitDate[2]);

 	var data = JSON.stringify(calendarObject);

    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/api/calendar/update',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: function (data) {
            if (data.CLDR_ID > 0) {
                toastr.success('Successfully updated.');
                window.setTimeout(function () { location.reload() }, 1000);
            } else {
                toastr.error("Not updated.");
            }
        }
    });
}	
	
// ==================
// Get Calendars Data
// ==================   
function getCalendars() {
    var calendars = new wijmo.collections.ObservableArray();
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
                    calendars.push({
                        EditId: "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditCalendar' onclick='cmdCalendarEdit_OnClick()'>Edit</button>",
                        DeleteId: "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteCalendar' onclick='cmdCalendarDelete_OnClick()'>Delete</button>",
                        CLDR_ID: Results[i]["cldr_ID"],
                        CLDR_DATE: Results[i]["cldr_DATE"],
                        CLDR_DAYCODE: Results[i]["cldr_DAYCODE"],
                        CLDR_NOTE: Results[i]["cldr_NOTE"],
                        
                        CREATED_DATE: Results[i]["created_DATE"],
                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
                        UPDATED_DATE: Results[i]["updated_DATE"],
                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
                        ISDELETED: Results[i]["isdeleted"],
                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
                        CLDR_CREATED_BY_USER_FK: Results[i]["CLDR_CREATED_BY_USER_FK"],
                        CLDR_UPDATED_BY_USER_FK: Results[i]["CLDR_UPDATED_BY_USER_FK"]
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
    return calendars;
}

// ==================
// Navigation Buttons
// ==================   
function updateNavigateButtonsCalendar() {
    if (calendars.pageSize <= 0) {
        document.getElementById('naviagtionPageGrid').style.display = 'none';
        return;
    }
    document.getElementById('naviagtionPageGrid').style.display = 'block';
    if (calendars.pageIndex === 0) {
        btnFirstPageGrid.setAttribute('disabled', 'disabled');
        btnPreviousPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    else if (calendars.pageIndex === (Calendars.pageCount - 1)) {
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
    btnCurrentPageGrid.innerHTML = (calendars.pageIndex + 1) + ' / ' + calendars.pageCount;

}

// ===================
// FlexGrid Selection
// =================== 
function updateDetails() {
	var item = calendars.currentItem;
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.CLDR_CREATED_BY_USER_FK.USER_LOGIN;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.CLDR_UPDATED_BY_USER_FK.USER_LOGIN;
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
    calendarDate = new wijmo.input.InputDate('#EDIT_CLDR_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date()
    });     	
	
  // Validation
    $('#CmdCalendarEditOk').click(function () {
        if (FormValidate() != true) {
            toastr.error("Fill the required field!");
        }
    });

    $('#CmdCalendarEditCancel, .close').click(function () {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#CalendarEdit').modal('hide');
    });

    $('.close-btn').hide();

    // Collection View
    calendars = new wijmo.collections.CollectionView(getCalendars());
    calendars.canFilter = true;
    calendars.pageSize  = 15;
    
    var filterText = '';
    $('#InputFilter').keyup(function () {
        filterText = this.value.toLowerCase();
        calendars.refresh();
    });
    calendars.filter = function (item) {
        return !filterText || (item.CLDR_DAYCODE.toLowerCase().indexOf(filterText) > -1);
    }
        
    calendars.collectionChanged.addHandler(function (sender, args) {
        updateNavigateButtonsCalendar();
    });
    
    calendars.currentChanged.addHandler(function (sender, args) {
	    updateDetails();
	});
    
    // Flex Grid
    calendarGrid = new wijmo.grid.FlexGrid('#calendarGrid');
    calendarGrid.initialize({
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
                        "binding": "CLDR_DATE",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Daycode",
                        "binding": "CLDR_DAYCODE",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Note",
                        "binding": "CLDR_NOTE",
                        "allowSorting": true,
                        "width": "2*"
                    }                   
        ],
        autoGenerateColumns: false,
        itemsSource: calendars,
        isReadOnly: true,
        selectionMode: wijmo.grid.SelectionMode.Row
    });
    calendarGrid.trackChanges = true;

    // Navigation button
    btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
    btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
    btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
    btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
    btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

    updateNavigateButtonsCalendar();

    btnFirstPageGrid.addEventListener('click', function () {
        calendars.moveToFirstPage();
        updateNavigateButtonsCalendar();
    });
    btnPreviousPageGrid.addEventListener('click', function () {
        calendars.moveToPreviousPage();
        updateNavigateButtonsCalendar();
    });
    btnNextPageGrid.addEventListener('click', function () {
        calendars.moveToNextPage();
        updateNavigateButtonsCalendar();
    });
    btnLastPageGrid.addEventListener('click', function () {
        calendars.moveToLastPage();
        updateNavigateButtonsCalendar();
    });
});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>
