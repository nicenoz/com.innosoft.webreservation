<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - Charging Report</title>

<!-- User List -->
<div class="container">
	<section id="list">
		<div class="row">
			<div class="col-lg-12">
				<h4>Charging Report</h4>
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
    
    reportGrid.dispose();
    reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.initialize({
		columns : [{
			"header" : "Time Stamp",
			"binding" : "CUNT_TIMESTAMP",
			"allowSorting" : true,
			"width" : "2*"
		},  {
			"header" : "Customer",
			"binding" : "CUNT_CUSTOMER_NAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "User",
			"binding" : "CUNT_MEMBER_NAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "E-mail",
			"binding" : "CUNT_EMAIL",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Deleted",
			"binding" : "CUNT_ISDELETED",
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
function getReport() {
 var reports = new wijmo.collections.ObservableArray();
 $('#loading').modal('show');
 $.ajax({
     url: '${pageContext.request.contextPath}/api/chargeCount/report',
     cache: false,
     type: 'GET',
     data:{"from":reportSearchDateFrom.value.toString("dd-MM-yyyy"),
    	   "to":reportSearchDateTo.value.toString("dd-MM-yyyy")
     },
     contentType: 'application/json; charset=utf-8',
     success: function (Results) {
    	 ScreenerSaveData = Results;
         $('#loading').modal('hide');
         if (Results.length > 0) {
             document.getElementById("cmdSaveReport").style.display='block';
             for (i = 0; i < Results.length; i++) {
                 reports.push({
                     CUNT_TIMESTAMP : Results[i]["cunt_TIME_STAMP"],
                     CUNT_CUSTOMER_NAME: Results[i]["CUNT_CUST_FK"]["cust_NAME"],
                     CUNT_MEMBER_NAME: Results[i]["CUNT_MEBR_FK"]["MEBR_LAST_NAME"] + ", " +Results[i]["CUNT_MEBR_FK"]["MEBR_FIRST_NAME"],
                     CUNT_EMAIL : Results[i]["cunt_EMAIL_ADDRESS"],
                     CUNT_ISDELETED : Results[i]["isdeleted"] == 0 ? "No":"Yes",

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
             document.getElementById("cmdSaveReport").style.display='none';
      /*   	 alertify.alert("No data."); */
         }
     }
 }).fail(
     function (xhr, textStatus, err) {
/*     	 alertify.alert(err); */
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
			"header" : "Time Stamp",
			"binding" : "CUNT_TIMESTAMP",
			"allowSorting" : true,
			"width" : "2*"
		},  {
			"header" : "Customer",
			"binding" : "CUNT_CUSTOMER_NAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "User",
			"binding" : "CUNT_MEMBER_NAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "E-mail",
			"binding" : "CUNT_EMAIL",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Deleted",
			"binding" : "CUNT_ISDELETED",
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
111


//----------------------
function CmdSaveXLS_OnClick() {
    var CSV = '';
    var screener = [];

    for (i = 0; i < ScreenerSaveData.length; i++) {
        screener.push({
        	TimeStamp : Results[i]["cunt_TIME_STAMP"],
            CustomerName: Results[i]["CUNT_CUST_FK"]["cust_NAME"],
            CustomerMemberName: Results[i]["CUNT_MEBR_FK"]["MEBR_LAST_NAME"] + ", " +Results[i]["CUNT_MEBR_FK"]["MEBR_FIRST_NAME"],
            MemberEmail : Results[i]["cunt_EMAIL_ADDRESS"],
            IsDeleted : Results[i]["isdeleted"] == 0 ? "No":"Yes",

            CreatedDate: Results[i]["CREATED_DATE"],
            CreatedByUser: Results[i]["CREATED_BY_USER_ID"],
            UpdatedDate: Results[i]["UPDATED_DATE"],
            UpdatedByUser: Results[i]["UPDATED_BY_USER_ID"],
            ISDELETED: Results[i]["ISDELETED"],
            ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
            ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"]
            
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
      /*   alert("No data"); */
        return;
    }

    // Create filename
    var fileName = 'CustomerMemberReportFrom' + reportSearchDateFrom.value.toString("dd-MMM-yyyy") +
    'to' + reportSearchDateTo.value.toString("dd-MMM-yyyy") + '.CSV';
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