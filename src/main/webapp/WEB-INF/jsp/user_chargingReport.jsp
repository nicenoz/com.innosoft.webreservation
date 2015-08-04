<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - Charging Report</title>

<!-- Reservation List -->
<div class="container">
	<section id="reservationList">
		<div class="row">
			<div class="col-lg-12">
				<h4>Charging Reports</h4>
			</div>
		</div>
		<div class="row">

			<!-- Search Calendar -->
			<div class="col-lg-3">
			<div class="input-group">
			  <span class="input-group-addon" id="sizing-addon3">From</span>
			  <div id="SEARCH_REPORT_FROM_DATE" class="modal-custom-input"></div>
			  <input class="form-control" id="SEARCH_REPORT_FROM_DATE_DATA" type="hidden" />
			</div>
			</div>
			
			<div class="col-lg-3">
			<div class="input-group">
			  <span class="input-group-addon" id="sizing-addon3"> To </span>
			  <div id="SEARCH_REPORT_TO_DATE" class="modal-custom-input"></div>
				<input class="form-control" id="SEARCH_REPORT_TO_DATE_DATA" type="hidden" />
			</div>
			</div>
			
					
			<div class="col-lg-6">
				<button id="cmdAddReport" type="submit" class="btn btn-primary pull-right btn-form-custom btn-form-custom-2" onclick="cmdChargeAdd_OnClick()">Add</button>
			</div>
		</div>
		<br />
		
		<!-- Table -->
		<div class="row table-form-custom">
			<div class="col-lg-12 table-form-custom">
				<div id="ReportGrid" class="grid table-form-custom"></div>
			</div>
		</div>

		<br />
	
		<!-- Table Navigation -->
		<div class="row">
			<div class="btn-group col-md-7" id="naviagtionPageGrid">
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToFirstPageGrid">
					<span class="glyphicon glyphicon-fast-backward"></span>
				</button>
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToPreviousPageGrid">
					<span class="glyphicon glyphicon-step-backward"></span>
				</button>
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" disabled style="width: 100px" id="btnCurrentPageGrid"></button>
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

<!-- Report Edit Detail 
//===================
//==EDIT THIS LATER==
//===================
-->

<div class="modal fade" id="CalendarEdit">
    <div class="modal-dialog">
        <div class="modal-content  modal-custom">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Calendar Edit</h4>
            </div>
            <div class="modal-body">
                <form id="messageForm" class="modal-form-custom">
                    <dl class="dl-horizontal">
                        <dt>Calendar Date</dt>
                        <dd>
                        	<input class="form-control" id="EDIT_CLDR_ID" type="hidden" />
                        	<div id="EDIT_CLDR_DATE" class="form-control modal-custom-input"></div>
                            <input class="form-control" id="EDIT_CLDR_DATE_DATA" type="hidden" />  
                        </dd>
                        <dt>Calendar Daycode</dt>
                        <dd>
                            <input class="form-control modal-custom-input" id="EDIT_CLDR_DAYCODE" name="EDIT_CLDR_DAYCODE" type="text" required />
                        </dd>
                        <dt>Calendar Note</dt>
                        <dd>
                            <input class="form-control modal-custom-input" id="EDIT_CLDR_NOTE" name="EDIT_CLDR_NOTE" type="text" required />
                        </dd>                      
                    </dl>
                </form>
            </div>
            <div class="modal-footer modal-footer-custom">
                <button type="button" class="btn btn-primary btn-form-custom btn-form-custom-2"  id="CmdCalendarEditOk" onclick="cmdCalendarEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger btn-form-custom btn-form-custom-2" id="CmdCalendarEditCancel" onclick="cmdCalendarEditCancel_OnClick()">
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
var reports;
var reportGrid;

var reportSearchDateFrom;
var reportSearchDateTo;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;
	
	
//===================
//Edit Button Clicked
//===================
function cmdReportEdit_OnClick() {
	reports.editItem(reports.currentItem);

 $('#ReportEdit').modal({
     show: true,
     backdrop: false
 });

 var report = reports.currentEditItem;
 
//===================
//==EDIT THIS LATER==
//===================
 document.getElementById('EDIT_CLDR_ID').value = report.CLDR_ID !== null && typeof (report.CLDR_ID) != 'undefined' ? wijmo.Globalize.format(report.CLDR_ID) : 0;
 document.getElementById('EDIT_CLDR_DATE_DATA').value = report.CLDR_DATE ? report.CLDR_DATE : '';
 document.getElementById('EDIT_CLDR_DAYCODE').value = report.CLDR_DAYCODE ? report.CLDR_DAYCODE : '';
 document.getElementById('EDIT_CLDR_NOTE').value = report.CLDR_NOTE ? report.CLDR_NOTE : '';

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
 
//==================
//Add Button Clicked
//==================   
function cmdCalendarAdd_OnClick() {
 $('#CalendarEdit').modal({
     show: true,
     backdrop: false
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
 
//=====================
//Delete Button Clicked
//=====================   
function cmdCalendarDelete_OnClick() {
 calendars.editItem(calendars.currentItem);
 
 var id = calendars.currentEditItem.CLDR_ID;
 var calendarDayCode = calendars.currentEditItem.CLDR_DAYCODE;

 if (confirm("Delete " + calendarDayCode + "?") == true) {
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
}
 
//=================================
//Edit Detail Cancel Button Clicked
//=================================     
function cmdCalendarEditCancel_OnClick() {
	$('#CalendarEdit').modal('hide');    	
}
 
//=============================
//Edit Detail OK Button Clicked
//=============================     
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
	
//==================
//Get Calendars Data
//==================   
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
                     EditId: "<button class='btn btn-primary btn-xs btn-form-custom' data-toggle='modal' id='cmdEditCalendar' onclick='cmdCalendarEdit_OnClick()'>Edit</button>",
                     DeleteId: "<button class='btn btn-danger btn-xs btn-form-custom' data-toggle='modal' id='cmdDeleteCalendar' onclick='cmdCalendarDelete_OnClick()'>Delete</button>",
                     CLDR_ID: Results[i]["cldr_ID"],
                     CLDR_DATE: Results[i]["cldr_DATE"],
                     CLDR_DAYCODE: Results[i]["cldr_DAYCODE"],
                     CLDR_NOTE: Results[i]["cldr_NOTE"],
                     
                     CREATED_DATE: Results[i]["CREATED_DATE"],
                     CREATED_BY_USER_ID: Results[i]["CREATED_BY_USER_ID"],
                     UPDATED_DATE: Results[i]["UPDATED_DATE"],
                     UPDATED_BY_USER_ID: Results[i]["UPDATED_BY_USER_ID"],
                     ISDELETED: Results[i]["ISDELETED"],
                     ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
                     ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"]
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
 return calendars;
}

//==================
//Navigation Buttons
//==================   
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
 
//=====================
//Detail Edit Validator
//=====================     
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
 
//==============================
//Detail Edit Validator Defaults
//==============================    
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
$(document).ready(function(){
	// Date Control Initialization
	
	reportSearchDateFrom = new wijmo.input.InputDate(
			'#SEARCH_REPORT_FROM_DATE', {
				format : 'MM/dd/yyyy',
				value : new Date()
			});
	
	reportSearchDateTo = new wijmo.input.InputDate(
			'#SEARCH_REPORT_TO_DATE', {
				format : 'MM/dd/yyyy',
				value : new Date()
			});
	
	// Flex Grid
	reportGrid = new wijmo.grid.FlexGrid('#ReportGrid');
	reportGrid.initialize({
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
			"header" : "Report no.",
			"binding" : "CHRG_CHARGE_NO",
			"allowSorting" : true,
			"width" : "6*"
		}, {
			"header" : "Customer",
			"binding" : "CHRG_CUST_ID",
			"allowSorting" : true,
			"width" : "6*"
		},  {
			"header" : "Report",
			"binding" : "CHRG_PRICE",
			"allowSorting" : true,
			"width" : "6*"
		}, {
			"header" : "Date",
			"binding" : "CHRG_APP_START_DATE",
			"allowSorting" : true,
			"width" : "6*"
		}],
		
		autoGenerateColumns : false,
		itemsSource : charges,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Row
	});

	reportGrid.trackChanges = true;
	
});

</script>
<!-- footer -->
<%@include file="include_secure_footer.jsp"%>