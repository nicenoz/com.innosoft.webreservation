<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>Software</title>

<!-- Message List -->
<div class="container"> 
<section>	
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
	            <div id="cboCustomer" class="full-width"></div>
	            <input class="form-control" id="customerId" type="hidden"/>
            </div>
            <div class="col-lg-2">
	            <div id="cboCalendarActivityStart" class="full-width"></div>
	            <input class="form-control" id="calendarActivityStartId" type="hidden"/>
            </div>
            <div class="col-lg-2">
	            <div id="cboCalendarActivityEnd" class="full-width"></div>
	            <input class="form-control" id="calendarActivityEndId" type="hidden"/>
            </div>            
            <div class="col-lg-2">
                <button id="cmdGetSchedule" type="submit" class="btn btn-primary border-custom btn-block pull-right" onclick="cmdGetSchedule_OnClick()">Get Schedule</button>
            </div>
        </div>
        <br />
        <div class="row">
	    	<div class="col-lg-12">
	        	<div id="scheduleGrid" class="grid border-custom" style="height:70vh"></div>
	        </div>
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
//===========================
//Schedule - Global Variables
//===========================	
var cboCustomer;
var cboCalendarActivityStart;
var cboCalendarActivityEnd;
var scheduleGrid;

var customerCollection;
var calendarActivityCollection;
var scheduleCollection;

var calendarActivityList;

// ======
// Events
// ======   
function cmdGetSchedule_OnClick() {
	var customerId = document.getElementById('customerId').value;
    var customerTime = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/customerTime/listByCustomer',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":customerId},
        success: function (results) {
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	for(p = 0; p < results[i]["CTIM_MAX_PARTS_NO"]; p++) {
                    	customerTime.push({
                            time: results[i]["CTIM_DETAILS_NO"].toString(),
                            parts: p + 1,
                            noOfParts: results[i]["CTIM_MAX_PARTS_NO"]
                        });                		
                	}
                }
                scheduleCollection = new wijmo.collections.CollectionView(customerTime);
                scheduleCollection.canFilter = true;   
                
                scheduleGrid.dispose();
                
                var gridColumns = [];
                gridColumns.push({
                	"header" : "Time",
            		"binding" : "time",
            		"allowSorting" : false,
            		"allowMerging" : true,
            		"width" : 200
                });   
                gridColumns.push({
                	"header" : "Parts",
            		"binding" : "parts",
            		"allowSorting" : false,
            		"allowMerging" : false,
            		"width" : 200
                });    
                
                var startDateIndex = cboCalendarActivityStart.selectedIndex;
                var endDateIndex = cboCalendarActivityEnd.selectedIndex;
                
                for (var i = startDateIndex; i <= endDateIndex; i++) {
        	    	gridColumns.push({
        	        	"header" : calendarActivityList[i],
        	    		"allowSorting" : true,
        	    		"width" : 100
        	        });	
        	    }                
                
                scheduleGrid = new wijmo.grid.FlexGrid('#scheduleGrid');
                scheduleGrid.frozenColumns = 2;
                scheduleGrid.initialize({
            		columns : gridColumns,
            		autoGenerateColumns : false,
            		itemsSource : scheduleCollection,
            		isReadOnly : true,
            		selectionMode : wijmo.grid.SelectionMode.Row,
            		allowMerging : "All"
            	});
                scheduleGrid.trackChanges = true;                
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );	
}

//=================
// Getting the Data
//=================   
function getReservation(customerId, calendarActivityStartId, calendarActivityEndId) {

}
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
function getCalendarActivities(customerId) {
    var calendarActivities = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/calendarActivity/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":customerId},
        success: function (results) {
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	calendarActivities.push({
                        id: results[i]["CACT_ID"],
                        dayCode: results[i]["CACT_CLDR"]["CLDR_DAYCODE"],
                        reservation: results[i]["CACT_CLDR"]["CLDR_DAYCODE"],
                    });
                }
                createCboCalendarActivity(calendarActivities);
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );	
}

//==============
// Schedule Grid
//==============  
function makeScheduledGrid(Month, Year) {
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
	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer', {
        itemsSource: customerList,
        onSelectedIndexChanged: function () {
            $("#customerId").val(customerCollection.items[this.selectedIndex].id);
            getCalendarActivities(customerCollection.items[this.selectedIndex].id)
        }
    });	
}
function createCboCalendarActivity(calendarActivities) {
	calendarActivityCollection = new wijmo.collections.CollectionView(calendarActivities);
    
    calendarActivityList = new Array();
    for (var i = 0; i < calendarActivityCollection.items.length; i++) {
    	calendarActivityList.push(calendarActivityCollection.items[i].dayCode);
    }
	
    cboCalendarActivityStart.dispose();
    cboCalendarActivityStart = new wijmo.input.AutoComplete('#cboCalendarActivityStart', {
        itemsSource: calendarActivityList,
        onSelectedIndexChanged: function () {
            $("#calendarActivityStartId").val(calendarActivityCollection.items[this.selectedIndex].id);
        }
    });		
    
    cboCalendarActivityEnd.dispose();
    cboCalendarActivityEnd = new wijmo.input.AutoComplete('#cboCalendarActivityEnd', {
        itemsSource: calendarActivityList,
        onSelectedIndexChanged: function () {
            $("#calendarActivityEndId").val(calendarActivityCollection.items[this.selectedIndex].id);
        }
    });	    
}

//=========
//Page Load
//========= 
$(document).ready(function () {
	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer');
	cboCalendarActivityStart = new wijmo.input.AutoComplete('#cboCalendarActivityStart');
	cboCalendarActivityEnd = new wijmo.input.AutoComplete('#cboCalendarActivityEnd');
	getCustomers();
	
	scheduleGrid = new wijmo.grid.FlexGrid('#scheduleGrid');
	scheduleGrid.frozenColumns = 2;
	scheduleGrid.initialize({
		columns : [{
			"header" : "Time",
			"binding" : "time",
			"allowSorting" : true,
			"width" : 200
		},  {
			"header" : "Parts",
			"binding" : "parts",
			"allowSorting" : true,
			"width" : 200
		}],
		autoGenerateColumns : false,
		itemsSource : reports,
		isReadOnly : true,
		selectionMode : wijmo.grid.SelectionMode.Row
	});
	scheduleGrid.trackChanges = true;	
});

</script>

<!-- footer -->
<%@include file="include_secure_copyright_footer.jsp"%>