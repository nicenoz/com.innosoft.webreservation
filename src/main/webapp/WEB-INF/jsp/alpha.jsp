<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - Reservation Report</title>

<!-- Reservation List -->
<div class="container">
	<section id="list">
		<div class="row">
		
			<div class="col-lg-3">
			  <div id="CustomerList"></div>
			</div>

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
			
			<div class="col-lg-3 btn-group">
				<button id="cmdCreateReservation" type="submit" class="btn btn-success  border-custom pull-right" onclick="">Create Reservation</button>	
			</div>
		</div>
		<br />
		
		<!-- Table -->
		<div class="row">
			<div class="col-lg-12">
				<wj-flex-grid id="reportGrid" control="flex" allow-merging="Cells" style="height:65vh;"></wj-flex-grid>
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

function generateSchedule(){
	// Collection View
    reports = new wijmo.collections.CollectionView(getReport());
    reports.canFilter = true;
    
    var timeDiff = Math.abs(new Date(reportSearchDateFrom.value.toString("MM/dd/yyyy")) - new Date(reportSearchDateTo.value.toString("MM/dd/yyyy")));
    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 

    
    var gridColumns = [];
    gridColumns.push({
    	"header" : "Time",
		"binding" : "RESV_MEMBERNAME",
		"allowMerging" : true,
		"allowSorting" : false,
		"align" : "center",
		"width" : 200
    });
    
    gridColumns.push({
    	"header" : "Parts name",
		"binding" : "RESV_PARTSNAME",
		"allowSorting" : false,
		"align" : "center",
		"width" : 200
    });
    
    gridColumns.push({
    	"header" : reportSearchDateFrom.value.toString("dd MMM yyyy"),
		"binding" : "RESV_SLOTS",
		"allowSorting" : false,
        "isContentHtml": true,
		"align" : "center",
		"width" : "*"
    });


  	var headerDate = new Date(reportSearchDateFrom.value.toString("MM/dd/yyyy"));
	if(diffDays <= 6){
		for (var i = 1; i <= diffDays; i++) {
			headerDate.setDate(headerDate.getDate() + 1);
	    	gridColumns.push({
	        	"header" : headerDate.toString("dd MMM yyyy"),
	    		"binding" : "RESV_SLOTS",
	    		"allowSorting" : false,
                "isContentHtml": true,
        		"align" : "center",
	    		"width" : "*"
	        });
	    }
    }else{
	    for (var i = 1; i <= diffDays; i++) {
	    	headerDate.setDate(headerDate.getDate() + 1);
	    	gridColumns.push({
	        	"header" : headerDate.toString("dd MMM yyyy"),
	        	"binding" : "RESV_SLOTS",
	    		"allowSorting" : false,
                "isContentHtml": true,
        		"align" : "center"
	        });
	    }
    }

    
    reportGrid.dispose();
    reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
    
	reportGrid.frozenColumns = 2;
	reportGrid.initialize({
		columns : gridColumns,
		autoGenerateColumns : false,
		itemsSource : reports,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Cell,
		allowMerging : wijmo.grid.AllowMerging.All
	});
	
	//Implement or not? Place a month on top
	/* var hr = new wijmo.grid.Row();

    reportGrid.columnHeaders.rows.push(hr);	
	
    reportGrid.columnHeaders.setCellData(0, 0, "Time");
    reportGrid.columnHeaders.setCellData(0, 1, "Parts name");
    for(x = 2; x <= (diffDays + 2);x++){
		reportGrid.columnHeaders.setCellData(0, x , ""  + headerDate.toString("MMMM"));
		console.log("" + x);
    } */
	
	reportGrid.trackChanges = true;
}



//==================
//Generate Button Clicked
//==================   
function cmdGenerateReport_OnClick(){
	generateSchedule();
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
        	 
        	 var slotHolder = "";
        	 for(x = 0; x<3; x++){
        		 slotHolder = slotHolder + " <button class='btn btn-primary btn-xs border-custom'>x</button> ";
             }
        	 
      		  
             for (i = 0; i < Results.length; i++) {
            	 
                 reports.push({
                	 RESV_SLOTS: slotHolder,
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
         /*     alertify.alert("No data."); */
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
	// Date Control Initialization
	 var cbs = new wijmo.input.AutoComplete('#CustomerList', {
	        itemsSource: getCustomers(),
	        placeholder: 'Select Salon'
	    });
	
	reportSearchDateFrom = new wijmo.input.InputDate(
			'#SEARCH_REPORT_FROM_DATE', {
				format : 'dd MMMM yyyy',
				value : new Date(),
				min : new Date(),
				max: new Date(),
		        onValueChanged: function () {
		        	reportSearchDateTo.min = this.value;
		            generateSchedule();
		        }
			});
	
	reportSearchDateTo = new wijmo.input.InputDate(
			'#SEARCH_REPORT_TO_DATE', {
				format : 'dd MMMM yyyy',
				value : new Date(),
				min: new Date(),
				onValueChanged: function () {
					reportSearchDateFrom.max = this.value;
					generateSchedule();
		        }
			});

	//Initialized to be destroyed. lol
    reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
    generateSchedule();
});





function getCustomers() {
    return [
	'Salon de Rose SM',
	'Salon de Rose Colon',
	'Salon de Rose Mandaue',
	'Salon de Rose Ayala',
	'Kilid Kilid Salon',
	'Mama Salon',
	'Pet Salon',
	'Pagwapa Salon',
	'Salon Pas',
	'Salon Salon',
	'Salon Carenderia',
	'Salon de Lebron'];
}
</script>
<!-- footer -->
<%@include file="include_secure_footer.jsp"%>