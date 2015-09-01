<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - Reservation Report</title>

<!-- Reservation List -->
<div class="container">
	<section id="list">
		<div class="row">
			<div class="col-lg-12">
				<h4>Reservation Report</h4>
			</div>
		</div>
		<div class="row">

			<!-- Search Calendar -->
			 <div class="col-lg-2">
	            <div id="cboCustomer"></div>
            </div>
            <div class="col-lg-2">
	            <div id="cboCalendarActivityStart"></div>
            </div>
            <div class="col-lg-2">
	            <div id="cboCalendarActivityEnd"></div>
            </div>            
			
			<div class="col-lg-6 btn-group">
				<button id="cmdGenerateReport" type="submit" class="btn btn-primary  border-custom pull-right" onclick="cmdGenerateReport_OnClick()">Generate</button>
				<button id="cmdSaveReport" type="submit" class="btn btn-success border-custom pull-right" style="display:none; margin-right:12px" onclick="cmdSaveReport_OnClick()">Save</button>
				
			</div>
		</div>
		<br />
		
		<!-- Table -->
		<div class="row">
			<div class="col-lg-12">
				<div id="reportGrid" class="grid border-custom"></div>
			</div>
		</div>

		<br />
	
		<!-- Table Navigation -->
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

<script type="text/javascript">

//================
// Global variables
// ================
var reports;
var reportGrid;

var cboCustomer;
var cboCalendarActivityStart;
var cboCalendarActivityEnd;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

var calendarActivities;
var ScreenerSaveData;

function cmdGenerateReport(){
	// Collection View
    reports = new wijmo.collections.CollectionView(getReport());
    reports.canFilter = true;
    reports.pageSize  = 15;
    
    reportGrid.dispose();
    reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.initialize({
		columns : [{
			"header" : "Customer",
			"binding" : "RESV_CUSTOMER",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Date",
			"binding" : "RESV_DAY_CODE",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Parts No.",
			"binding" : "RESV_PARTSNAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Start Time",
			"binding" : "RESV_STARTTIME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "End Time",
			"binding" : "RESV_ENDTIME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Note",
			"binding" : "RESV_NOTE",
			"allowSorting" : true,
			"width" : "2*"
		}],
		
		autoGenerateColumns : false,
		itemsSource : reports,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Row
	});

	reportGrid.trackChanges = true;
}

//==================
//Generate Button Clicked
//==================   
function cmdGenerateReport_OnClick(){
	cmdGenerateReport();
}

function cmdSaveReport_OnClick(){
	CmdSaveXLS_OnClick();
}

//==================
//   Get Report
//==================   
function getCustomers() {
	 var customers = new wijmo.collections.ObservableArray();
	 $('#loading').modal('show');
	 $.ajax({
	     url: '${pageContext.request.contextPath}/api/customer/list',
	     cache: false,
	     type: 'GET',
	     contentType: 'application/json; charset=utf-8',
	     success: function (results) {
			ScreenerSaveData = results;
			   $('#loading').modal('hide');
			   if (results.length > 0) {
			       for (i = 0; i < results.length; i++) {
			      	 customers.push({
			          	 CUST_ID: results[i]["cust_ID"],
			             CUST_NAME: results[i]["cust_NAME"]
			           });
			       	 
			       }
			   } else {
			   /*     alertify.alert("No data."); */
		       }
	        cboCustomer.dispose();
	     	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer', {
	             itemsSource: customers,
	             displayMemberPath:"CUST_NAME",
	             onSelectedIndexChanged: function () {
	     	     	getCalendarActivities(cboCustomer.selectedValue.CUST_ID); 
	            }
	        });
	     	
	     	getCalendarActivities(cboCustomer.selectedValue.CUST_ID); 
	     }
	 }).fail(
	     function (xhr, textStatus, err) {
	    	 alertify.alert(err);
	     }
	 );
	 return reports;
}

function getCalendarActivities(customerId) {
    calendarActivities = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/calendarActivity/listByCustomer',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":customerId},
        success: function (results) {
        	reservationsList = new Array();
            if (results.length > 0) {
                results.forEach(function(result){
                	calendarActivities.push({
                        id: result.CACT_ID,
                        dayCode: result.CACT_CLDR_FK.CLDR_DAYCODE,
                    });
                });
                createCboCalendarActivity(calendarActivities);
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );	
}

function getReport(){
	var reports = new wijmo.collections.ObservableArray();
	$.ajax({
        url: '${pageContext.request.contextPath}/api/reservation/listByCustomer',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":cboCustomer.selectedValue.CUST_ID},
        success: function (results) {
            $('#loading').modal('hide');
            if (results.length > 0) {
                document.getElementById("cmdSaveReport").style.display='block';
                startDateIndex = cboCalendarActivityStart.selectedIndex;
                endDateIndex = cboCalendarActivityEnd.selectedIndex;

                for (i = 0; i < results.length; i++) {
                	for (k = startDateIndex; k <= endDateIndex; k++) {
                  		if(calendarActivities[k].id == results[i].resv_CACT_ID){
                  			reports.push({
                  				RESV_MEMBERNAME: results[i]["RESV_MEBR_FK"]["MEBR_LAST_NAME"] + ", " + results[i]["RESV_MEBR_FK"]["MEBR_FIRST_NAME"],
                              	RESV_CUSTOMER: results[i]["RESV_CUST_FK"]["cust_NAME"],
                                RESV_PARTSNAME: "" + results[i]["resv_PARTS_NO"],
                                RESV_STARTTIME: "" + results[i]["RESV_START_TIME_FK"]["ctim_DETAILS_NO"],
                                RESV_ENDTIME: "" + results[i]["RESV_END_TIME_FK"]["ctim_DETAILS_NO"],
                                RESV_NOTE: "" + results[i]["resv_NOTE"],
                                RESV_DAY_CODE: "" + calendarActivities[k].dayCode,
                                   
                                CREATED_DATE: results[i]["CREATED_DATE"],
                                CREATED_BY_USER_ID: results[i]["CREATED_BY_USER_ID"],
                                UPDATED_DATE: results[i]["UPDATED_DATE"],
                                UPDATED_BY_USER_ID: results[i]["UPDATED_BY_USER_ID"],
                                ISDELETED: results[i]["ISDELETED"],
                                ISDELETED_DATE: results[i]["ISDELETED_DATE"],
                                ISDELETED_BY_USER_ID: results[i]["ISDELETED_BY_USER_ID"]
                            });
                  			break;
                  		}
                	}         
                }
                
                ScreenerSaveData = reports;
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );
	
	return reports;
}

function createCboCalendarActivity(calendarActivities) {
	
    cboCalendarActivityStart.dispose();
    cboCalendarActivityStart = new wijmo.input.AutoComplete('#cboCalendarActivityStart', {
        itemsSource: calendarActivities,
        displayMemberPath: "dayCode",
        onSelectedIndexChanged: function () {
        	if(this.selectedIndex > cboCalendarActivityEnd.selectedIndex){
        		cboCalendarActivityEnd.selectedIndex = this.selectedIndex;
        	}
        }
    });		
    
    cboCalendarActivityEnd.dispose();
    cboCalendarActivityEnd = new wijmo.input.AutoComplete('#cboCalendarActivityEnd', {
        itemsSource: calendarActivities,
        displayMemberPath: "dayCode",
        onSelectedIndexChanged: function () {
        	if(this.selectedIndex < cboCalendarActivityStart.selectedIndex){
        		cboCalendarActivityStart.selectedIndex = this.selectedIndex;
        	}
        }
    });	    
}

//==================
//Navigation Buttons
//==================   
function updateNavigateButtonsReport() {
 if (reports.pageSize <= 0) {
     document.getElementById('naviagtionPageGrid').style.display = 'none';
     return;
 }
 document.getElementById('naviagtionPageGrid').style.display = 'block';
 if (reports.pageIndex === 0) {
     btnFirstPageGrid.setAttribute('disabled', 'disabled');
     btnPreviousPageGrid.setAttribute('disabled', 'disabled');
     btnNextPageGrid.removeAttribute('disabled');
     btnLastPageGrid.removeAttribute('disabled');
 }
 else if (reports.pageIndex === (reports.pageCount - 1)) {
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
 btnCurrentPageGrid.innerHTML = (reports.pageIndex + 1) + ' / ' + reports.pageCount;
}

// ============
// On Page Load
// ============
$(document).ready(function(){
	
	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer');
 	cboCalendarActivityStart = new wijmo.input.AutoComplete('#cboCalendarActivityStart');
	cboCalendarActivityEnd = new wijmo.input.AutoComplete('#cboCalendarActivityEnd'); 
	
	getCustomers();
	// Flex Grid
	reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.initialize({
		columns : [{
			"header" : "Customer",
			"binding" : "RESV_CUSTOMER",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Date",
			"binding" : "RESV_DAY_CODE",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Parts No.",
			"binding" : "RESV_PARTSNAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Start Time",
			"binding" : "RESV_STARTTIME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "End Time",
			"binding" : "RESV_ENDTIME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Note",
			"binding" : "RESV_NOTE",
			"allowSorting" : true,
			"width" : "2*"
		}],
		
		autoGenerateColumns : false,
		itemsSource : reports,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Row
	});

	reportGrid.trackChanges = true;
	
});































































//----------------------
function CmdSaveXLS_OnClick() {
    var CSV = '';
    var screener = [];

    for (i = 0; i < ScreenerSaveData.length; i++) {
        screener.push({     
            Customer: ScreenerSaveData[i]["RESV_CUSTOMER"],
            Member: ScreenerSaveData[i]["RESV_MEMBERNAME"],
            PartsNo: "" + ScreenerSaveData[i]["RESV_PARTSNAME"],
            StartTime: "" + ScreenerSaveData[i]["RESV_STARTTIME"],
            EndTime: "" + ScreenerSaveData[i]["RESV_ENDTIME"],
            Note: "" + ScreenerSaveData[i]["RESV_NOTE"],
            DayCode: "" + ScreenerSaveData[i]["RESV_DAY_CODE"],
            
            CREATED_DATE: ScreenerSaveData[i]["CREATED_DATE"],
            CREATED_BY_USER_ID: ScreenerSaveData[i]["CREATED_BY_USER_ID"],
            UPDATED_DATE: ScreenerSaveData[i]["UPDATED_DATE"],
            UPDATED_BY_USER_ID: ScreenerSaveData[i]["UPDATED_BY_USER_ID"],
            ISDELETED: ScreenerSaveData[i]["ISDELETED"],
            ISDELETED_DATE: ScreenerSaveData[i]["ISDELETED_DATE"],
            ISDELETED_BY_USER_ID: ScreenerSaveData[i]["ISDELETED_BY_USER_ID"]
            
        });
    }

    CSV += 'Screener Data' + '\r\n\n';

    var screenerLabelRow = '';
    for (var s in screener[0]) {
        screenerLabelRow += s + ',';
    }
    screenerLabelRow = screenerLabelRow.slice(0, -1);
    CSV += screenerLabelRow + '\r\n';

    for (var i = 0; i < screener.length; i++) {
        var screenerRow = '';
        for (var s in screener[i]) {
            screenerRow += '"' + screener[i][s] + '",';
        }
        screenerRow.slice(0, screenerRow.length - 1);
        CSV += screenerRow + '\r\n';
    }

    if (CSV == '') {
       /*  alert("No data"); */
        return;
    }

    // Create filename
    var fileName = 'ReservationReportFrom' + cboCalendarActivityStart.selectedValue.dayCode +
    'to' + cboCalendarActivityEnd.selectedValue.dayCode + '.CSV';
    // Download via <a> link

    var link = document.createElement("a");

    if (link.download !== undefined) {
        var blob = new Blob([CSV], { type: 'text/csv;charset=utf-8;' });
        var url = URL.createObjectURL(blob);
        link.setAttribute("href", url);
        link.setAttribute("download", fileName);
        link.style = "visibility:hidden";
    }

    if (navigator.msSaveBlob) {
        link.addEventListener("click", function (event) {
            var blob = new Blob([CSV], {
                "type": "text/csv;charset=utf-8;"
            });
            navigator.msSaveBlob(blob, fileName);
        }, false);
    }

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);

}


</script>
<!-- footer -->
<%@include file="include_secure_footer.jsp"%>