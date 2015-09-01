<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - User Report</title>

<!-- User List -->
<div class="container">
	<section id="list">
		<div class="row">
			<div class="col-lg-12">
				<h4>User Report</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
		        <div class="input-group">
		            <!-- <span class="input-group-btn">
		                <button class="btn btn-default border-custom" type="button" readonly>
		                <i class="fa fa-search"></i>
		                </button>
		            </span> -->
		            <!-- <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search"> -->
		            <div id="cboCustomer"></div>
		        </div>
	    	</div>
			
			<div class="col-lg-8 btn-group">
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

<script type="text/javascript">

//================
// Global variables
// ================
var reports;
var reportGrid;

var cboCustomer;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

var ScreenerSaveData;

var customerList;

function generateTable(){
    reportGrid = new wijmo.grid.FlexGrid('#reportGrid');
	reportGrid.allowMerging = "Cells"
	reportGrid.initialize({
		columns : [{
			"header" : "No.",
			"binding" : "MEBR_NO",
			"allowSorting" : true,
			"width" : "1*"
		},  {
			"header" : "Customer",
			"binding" : "MEBR_CUSTOMER",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "User",
			"binding" : "MEBR_USER_ID",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Full Name",
			"binding" : "MEBR_FULLNAME",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Phone",
			"binding" : "MEBR_CONTACT",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Address",
			"binding" : "MEBR_ADDRESS",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Zip",
			"binding" : "MEBR_ZIP",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Email",
			"binding" : "MEBR_EMAIL",
			"allowSorting" : true,
			"width" : "2*"
		}, {
			"header" : "Birthdate",
			"binding" : "MEBR_BDAY",
			"allowSorting" : true,
			"width" : "2*"
		}],
		
		autoGenerateColumns : false,
		itemsSource : reports,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Row
	});
}

function getCustomers(){
	customerList = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/customer/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        success: function (results) {
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	customerList.push({
                        id: results[i]["CUST_ID"],
                        customerName: results[i]["CUST_NAME"]
                    });
                	
                	cboCustomer.dispose();
                	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer', {
                        itemsSource: customerList,
                        displayMemberPath: "customerName",
                        onSelectedIndexChanged: function () {}
                    });	
                }
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            /* alert(err); */
            console.log("error")
        }
    );
    
}

function cmdGenerateReport(){
	// Collection View
    reports = new wijmo.collections.CollectionView(getReport());
    reports.canFilter = true;
    reports.pageSize  = 15;

	reportGrid.dispose();
    generateTable();
	
	var filterText = '';
	$('#InputFilter').keyup(function () {
	    filterText = this.value.toLowerCase();
	    reports.refresh();
	});
	reports.filter = function (item) {
	    return !filterText || (item.MEBR_CUSTOMER.toLowerCase().indexOf(filterText) > -1);
	}

	reportGrid.trackChanges = true;
	
	reports.collectionChanged.addHandler(function (sender, args) {
		updateNavigateButtonsReport();
    });
	
	// Navigation button
    btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
    btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
    btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
    btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
    btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

    updateNavigateButtonsReport();

    btnFirstPageGrid.addEventListener('click', function () {
    	reports.moveToFirstPage();
        updateNavigateButtonsReport();
    });
    btnPreviousPageGrid.addEventListener('click', function () {
    	reports.moveToPreviousPage();
        updateNavigateButtonsReport();
    });
    btnNextPageGrid.addEventListener('click', function () {
    	reports.moveToNextPage();
        updateNavigateButtonsReport();
    });
    btnLastPageGrid.addEventListener('click', function () {
    	reports.moveToLastPage();
        updateNavigateButtonsReport();
    });
	
	
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
 /* EDIT LATER */
 $('#loading').modal('show');
 $.ajax({
	 url: '${pageContext.request.contextPath}/api/customerMember/report',
 	 cache: false,
 	 type: 'GET',     
 	 data: {"customerId" : cboCustomer.selectedValue.id},
 	 contentType: 'application/json; charset=utf-8',
 	 success: function (Results) {
    	 ScreenerSaveData = Results;
         $('#loading').modal('hide');
         if (Results.length > 0) {
             document.getElementById("cmdSaveReport").style.display='block';
             for (i = 0; i < Results.length; i++) {
                 reports.push({
                	 MEBR_NO: Results[i]["mebr_CUSTOMER_MEMBER_NO"],
                	 MEBR_CUSTOMER: Results[i]["MEBR_CUST_FK"]["cust_NAME"],
                	 MEBR_USER_ID: Results[i]["mebr_USER_ID"],
                	 MEBR_FULLNAME: Results[i]["mebr_LAST_NAME"] + ", " + Results[i]["mebr_FIRST_NAME"],
                     MEBR_CONTACT: Results[i]["mebr_TEL_NO"],
                     MEBR_ADDRESS: Results[i]["mebr_ADDRESS1"],
                     MEBR_ZIP: Results[i]["mebr_ZIP_CODE"],
                     MEBR_EMAIL: Results[i]["mebr_EMAIL_ADDRESS"],
                     MEBR_BDAY: Results[i]["mebr_DATE_OF_BIRTH"],
                     
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
        	/*  alertify.alert("No data."); */
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
	// Flex Grid
	generateTable();
    
	reportGrid.trackChanges = true;
	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer');
	getCustomers();
});

//----------------------
function CmdSaveXLS_OnClick() {
    var CSV = '';
    var screener = [];

    for (i = 0; i < ScreenerSaveData.length; i++) {
        screener.push({
            LastName: ScreenerSaveData[i]["mebr_LAST_NAME"],
            FirstName: ScreenerSaveData[i]["mebr_FIRST_NAME"],
            Email: ScreenerSaveData[i]["mebr_EMAIL_ADDRESS"],
            ContactNumber: ScreenerSaveData[i]["mebr_TEL_NO"],
            DateOfBirth: ScreenerSaveData[i]["mebr_DATE_OF_BIRTH"],
            ZipCode: ScreenerSaveData[i]["mebr_ZIP_CODE"],
            Address1: ScreenerSaveData[i]["mebr_ADDRESS1"],
            Address2: ScreenerSaveData[i]["mebr_ADDRESS2"],
            Address3: ScreenerSaveData[i]["mebr_ADDRESS3"],
            Point: ScreenerSaveData[i]["mebr_POINT"],
            
            CreatedDate: ScreenerSaveData[i]["CREATED_DATE"],
            CreatedByUser: ScreenerSaveData[i]["CREATED_BY_USER_ID"],
            UpdatedDate: ScreenerSaveData[i]["UPDATED_DATE"],
            UpdatedByUser: ScreenerSaveData[i]["UPDATED_BY_USER_ID"],
            IsDeleted: ScreenerSaveData[i]["ISDELETED"],
            DeletedDate: ScreenerSaveData[i]["ISDELETED_DATE"],
            DeletedByUser: ScreenerSaveData[i]["ISDELETED_BY_USER_ID"]
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
     var today = new Date();
    var fileName = 'CustomerMemberReportAsOf-' +today.toString("dd-MMM-yyyy") + '.CSV';
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