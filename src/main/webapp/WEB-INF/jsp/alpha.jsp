<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - Reservation Report</title>

<!-- Reservation List -->
<div class="container">
	<section id="list">
		<div class="row">
			<div class="col-lg-12">
				<h4>Welcome to Salon de Rose Group of Companies blabla</h4>
			</div>
		</div>
		<div class="row" style="margin-bottom:15px;margin-top:10px;">
		<!-- ADD THIS DYNAMICALLY -->
			<div class="col-lg-3">
	                <select id="CustomerList" class="form-control border-custom">
	                    <option value="0">Salon de Rose SM</option>
	                    <option value="1">Salon de Rose Colon</option>
	                    <option value="2">Salon de Rose Mandaue</option>
	                    <option value="3">Salon de Rose Ayala</option>
	                    <option value="4">Kilid Kilid Salon</option>
	                    <option value="5">Mama Salon</option>
	                    <option value="6">Pet Salon</option>
	                    <option value="7">Pagwapa Salon</option>
	                    <option value="8">Salon Pas</option>
	                    <option value="9">Salon Salon</option>
	                    <option value="10">Salon Carenderia</option>
	                    <option value="11">Salon de Lebron</option>
	                </select>
	        </div>
        </div>
		<div class="row">
			<!-- Search Calendar -->
			<div class="col-lg-3">
			<div class="input-group">
			  <span class="input-group-addon border-custom" id="sizing-addon3">From</span>
			  <div id="SEARCH_REPORT_FROM_DATE" class="border-custom btn-block"></div>
			</div>
			</div>
			
			<div class="col-lg-3">
			<div class="input-group">
			  <span class="input-group-addon border-custom" id="sizing-addon3"> To </span>
			  <div id="SEARCH_REPORT_TO_DATE" class="border-custom btn-block"></div>
			</div>
			</div>
			
			<div class="col-lg-6 btn-group">
				<button id="cmdCreateReservation" type="submit" class="btn btn-success  border-custom pull-right" onclick="cmdGenerateReport_OnClick()">Create Reservation</button>	
			</div>
		</div>
		<br />
		
		<!-- Table -->
		<div class="row">
			<div class="col-lg-12">
				<wj-flex-grid id="reportGrid" control="flex" allow-merging="Cells"></wj-flex-grid>
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

var ScreenerSaveData;

function cmdGenerateReport(){
	// Collection View
    reports = new wijmo.collections.CollectionView(getReport());
    reports.canFilter = true;
    reports.pageSize  = 15;
    
    var timeDiff = Math.abs(new Date(reportSearchDateFrom.value.toString("MM/dd/yyyy")) - new Date(reportSearchDateTo.value.toString("MM/dd/yyyy")));
    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
 
    reportGrid.dispose();
    var gridColumns = [];
    gridColumns.push({
    	"header" : "Time",
		"binding" : "RESV_MEMBERNAME",
		"allowSorting" : true,
		"allowMerging" : true,
		"width" : 200
    });
    
    gridColumns.push({
    	"header" : "Parts name",
		"binding" : "RESV_PARTSNAME",
		"allowSorting" : true,
		"width" : 200
    });
    
    gridColumns.push({
    	"header" : reportSearchDateFrom.value.toString("dd MMM yyyy"),
		"binding" : "RESV_ENDTIME" + i,
		"allowSorting" : true,
		"width" : "*"
    });

  	var headerDate = new Date(reportSearchDateFrom.value.toString("MM/dd/yyyy"));
  	
	if(diffDays <= 6){
		for (var i = 1; i <= diffDays; i++) {
			headerDate.setDate(headerDate.getDate() + 1);
	    	gridColumns.push({
	        	"header" : headerDate.toString("dd MMM yyyy"),
	    		"binding" : "RESV_ENDTIME" + i,
	    		"allowSorting" : true,
	    		"width" : "*"
	        });
	    }
    }else{
	    for (var i = 1; i <= diffDays; i++) {
	    	headerDate.setDate(headerDate.getDate() + 1);
	    	gridColumns.push({
	        	"header" : headerDate.toString("dd MMM yyyy"),
	        	"binding" : "RESV_ENDTIME" + i,
	    		"allowSorting" : true,
	        });
	    }
    }

    
    reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.frozenColumns = 2;
	reportGrid.initialize({
		columns : gridColumns,
		autoGenerateColumns : false,
		itemsSource : reports,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Row,
		allowMerging : "All"
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
     url: '${pageContext.request.contextPath}/api/reservation/list',
     cache: false,
     type: 'GET',
     contentType: 'application/json; charset=utf-8',
/*      data: {"from" : reportSearchDateFrom.value.toString("dd-MMM-yyyy"),
    	    "to" : reportSearchDateTo.value.toString("dd-MMM-yyyy")}, */
     success: function (Results) {
    	 ScreenerSaveData = Results;
         $('#loading').modal('hide');
         if (Results.length > 0) {
             for (i = 0; i < Results.length; i++) {
                 reports.push({
                	 RESV_MEMBERNAME: Results[i]["RESV_MEMBER"]["MEBR_LAST_NAME"] + ", " + Results[i]["RESV_MEMBER"]["MEBR_FIRST_NAME"],
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
    	 alertify.alert(err);
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
				format : 'dd MMMM yyyy',
				value : new Date(),
				max: new Date(),
		        onValueChanged: function () {
		        	reportSearchDateTo.min = this.value;
		        }
			});
	
	reportSearchDateTo = new wijmo.input.InputDate(
			'#SEARCH_REPORT_TO_DATE', {
				format : 'dd MMMM yyyy',
				value : new Date(),
				min: new Date(),
				onValueChanged: function () {
					reportSearchDateFrom.max = this.value;
		        }
			});
	
	// Flex Grid
	reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.frozenColumns = 2;
	reportGrid.initialize({
		columns : [{
			"header" : "Time",
			"binding" : "RESV_MEMBERNAME",
			"allowSorting" : true,
			"width" : 200
		},  {
			"header" : "Parts name",
			"binding" : "RESV_PARTSNAME",
			"allowSorting" : true,
			"width" : 200
		}, {
			"header" : reportSearchDateFrom.value.toString("dd MMM yyyy"),
			"binding" : "RESV_STARTTIME",
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