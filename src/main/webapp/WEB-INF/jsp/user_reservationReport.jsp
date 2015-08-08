<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - User Report</title>

<!-- Reservation List -->
<div class="container">
	<section id="list">
		<div class="row">
			<div class="col-lg-12">
				<h4>User Report</h4>
			</div>
		</div>
		<div class="row">

			<!-- Search Calendar -->
			<div class="col-lg-3">
			<div class="input-group">
			  <span class="input-group-addon border-custom" id="sizing-addon3">From</span>
			  <div id="SEARCH_REPORT_FROM_DATE" class="border-custom"></div>
			</div>
			</div>
			
			<div class="col-lg-3">
			<div class="input-group">
			  <span class="input-group-addon border-custom" id="sizing-addon3"> To </span>
			  <div id="SEARCH_REPORT_TO_DATE" class="border-custom"></div>
			</div>
			</div>
	
			<div class="col-lg-6">
				<button id="cmdSaveReport" type="submit" class="btn btn-success border-custom hidden modal fade" onclick="cmdSaveReport_OnClick()">Save</button>
				<button id="cmdGenerateReport" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdGenerateReport_OnClick()">Generate</button>
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

var reportSearchDateFrom;
var reportSearchDateTo;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;
	

function cmdGenerateReport(){
	// Collection View
    reports = new wijmo.collections.CollectionView(getReport());
    reports.canFilter = true;
    reports.pageSize  = 15;
    
    reportGrid.dispose();
    reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.initialize({
		columns : [{
			"header" : "Member name",
			"binding" : "RESV_MEMBERNAME",
			"allowSorting" : true,
			"width" : "2*"
		},  {
			"header" : "Parts name",
			"binding" : "RESV_PARTSNAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Start time",
			"binding" : "RESV_STARTTIME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "End time",
			"binding" : "RESV_ENDTIME",
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

//==================
//   Get Report
//==================   
function getReport() {
 var reports = new wijmo.collections.ObservableArray();
 $('#loading').modal('show');
 $.ajax({
     url: '${pageContext.request.contextPath}/api/reservation/report',
     cache: false,
     type: 'GET',
     contentType: 'application/json; charset=utf-8',
     data: {"from" : reportSearchDateFrom.value.toString("dd-MMM-yyyy"),
    	    "to" : reportSearchDateTo.value.toString("dd-MMM-yyyy")},
     success: function (Results) {
         $('#loading').modal('hide');
		 $('#cmdSaveReport').modal('show');
         if (Results.length > 0) {
             for (i = 0; i < Results.length; i++) {
                 reports.push({
                	 RESV_MEMBERNAME: Results[i]["resv_MEBR_ID"] + ", " + Results[i]["resv_MEBR_ID"],
                     RESV_PARTSNAME: Results[i]["resv_PARTS_NAME"],
                     RESV_STARTTIME: Results[i]["resv_START_TIME_ID"],
                     RESV_ENDTIME: Results[i]["resv_END_TIME_ID"],
                     
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
             alertify.alert("No data.");
         }
     }
 }).fail(
     function (xhr, textStatus, err) {
         alert(err);
     }
 );
 return reports;
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
	
	reportSearchDateFromData = new Date();
	
	// Date Control Initialization
	reportSearchDateFrom = new wijmo.input.InputDate(
			'#SEARCH_REPORT_FROM_DATE', {
				format : 'MM/dd/yyyy',
				value : new Date(),
				max: new Date(),
		        onValueChanged: function () {
		        	reportSearchDateTo.min = this.value;
		        }
			});
	
	reportSearchDateTo = new wijmo.input.InputDate(
			'#SEARCH_REPORT_TO_DATE', {
				format : 'MM/dd/yyyy',
				value : new Date(),
				min: new Date(),
				onValueChanged: function () {
					reportSearchDateFrom.max = this.value;
		        }
			});
	
	// Flex Grid
	reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.initialize({
		columns : [{
			"header" : "Member name",
			"binding" : "RESV_MEMBERNAME",
			"allowSorting" : true,
			"width" : "2*"
		},  {
			"header" : "Parts name",
			"binding" : "RESV_PARTSNAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Start time",
			"binding" : "RESV_STARTTIME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "End time",
			"binding" : "RESV_ENDTIME",
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

</script>
<!-- footer -->
<%@include file="include_secure_footer.jsp"%>