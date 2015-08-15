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
var reservationsList;
var customerList;

// ======
// Events
// ======   
function cmdGetSchedule_OnClick() {
	var customerId = customerList[cboCustomer.selectedIndex].id;
    var customerTime = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/customerTime/listByCustomer',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":customerId},
        success: function (results) {

        	// --- CREATE COLUMNS --------------------------------------
            var gridColumns = [];
            gridColumns.push({
            	"header" : "Time",
        		"binding" : "time",
        		"allowSorting" : false,
        		"allowMerging" : true,
        		"align" : "center",
        		"width" : 100
            });   
            gridColumns.push({
            	"header" : "Parts",
        		"binding" : "parts",
        		"allowSorting" : false,
        		"allowMerging" : false,
        		"align" : "center",
        		"width" : 200
            });    

            var startDateIndex = cboCalendarActivityStart.selectedIndex;
            var endDateIndex = cboCalendarActivityEnd.selectedIndex;
            
            for (var k = startDateIndex; k <= endDateIndex; k++) {
    	    	gridColumns.push({
    	        	"header" : calendarActivityList[k],
    	    		"allowSorting" : true,
    	    		"binding": calendarActivityList[k],
    	            "isContentHtml": true,
            		"align" : "center",
    	    		"width" : 100
    	        });	
    	    }     
        	
            // --- END CREATE COLUMNS ----------------------------------
            
            // --- CREATE DATA -----------------------------------------
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	// --- CREATE PARTS ROWS --------------------------------------
                	for(p = 0; p < results[i]["CTIM_MAX_PARTS_NO"]; p++) {
                		var newObj = {
                				time: results[i]["CTIM_DETAILS_NO"].toString(), 
                				parts: p + 1,
                				/* noOfParts: results[i]["CTIM_MAX_PARTS_NO"] */
                		};
                		
                		// --- CREATE BUTTONS --------------------------------------
                		
                		console.log("New Date");
                		for (k = startDateIndex; k <= endDateIndex; k++) {
                			var slotHolder = "";
                			for(a = 0; a < reservationsList.length; a++){
                				if(reservationsList[a].RESV_CUST_ID == customerId){
                					console.log("1");
	                				if(calendarActivityList[k] == reservationsList[a].RESV_DAY_CODE){
	                					
	                					console.log("2");
		                				var id = reservationsList[a]["RESV_START_TIME_ID"];
	                					console.log(id + " " + results[i]["CTIM_ID"]);
	                					
		                				if(id == results[i]["CTIM_ID"]){
		                					console.log("3");
			                				if(reservationsList[a]["RESV_PARTS_NO"] == (p + 1)){
			                					console.log("4");
			                					slotHolder = slotHolder + " <button class='btn btn-primary btn-xs border-custom'>x</button> ";
			                				}
		                				}
	                				}
                				}
                			}
                			console.log("Slot: " + slotHolder);
                			newObj[calendarActivityList[k]] = slotHolder;
                 	    }  
                    	customerTime.push(newObj);                		
                	}
                }
                scheduleCollection = new wijmo.collections.CollectionView(customerTime);
                scheduleCollection.canFilter = true;   
                
                scheduleGrid.dispose();
                           
                
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
	customerList = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/customer/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (results) {
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	customerList.push({
                        id: results[i]["CUST_ID"],
                        customerName: results[i]["CUST_NAME"]
                    });
                }
                createCboCustomer(customerList);
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
              
                	//GET ALL RESERVATIONS
                	result.RESV_CACT.forEach(function (reservation){
	                	var startTimeName = reservation["RESV_START_TIME_FK"];
	                	var endTimeName = reservation["RESV_END_TIME_FK"];
	                	reservationsList.push({
	                		RESV_CUST_ID: result.CACT_CUST_ID,
	                		RESV_PARTS_NO: reservation.RESV_PARTS_NO,
	                		RESV_DAY_CODE: result.CACT_CLDR_FK.CLDR_DAYCODE,
	                		RESV_START_TIME_ID: reservation.RESV_START_TIME_ID,
	                		RESV_END_TIME_ID: reservation.RESV_PARTS_NO,
	                		RESV_NOTE: reservation.RESV_PARTS_NO,
	                		/* MEBR_NAME: results[i].RESV_CACT[j].RESV_MEBR_FK"][MEBR_FIRST_NAME] + " " + results[i]["RESV_CACT"]["RESV_MEBR_FK"][MEBR_FIRST_NAME], */
	                    });
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
            getCalendarActivities(customerCollection.items[this.selectedIndex].id)
        }
    });	
	

    getCalendarActivities(customerCollection.items[0].id)
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
});

</script>

<!-- footer -->
<%@include file="include_secure_copyright_footer.jsp"%>