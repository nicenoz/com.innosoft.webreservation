<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>Software</title>

<div class="container"> 
<section>	
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
	            <div id="cboCustomer"></div>
            </div>
            <div class="col-lg-2">
	            <div id="cboCalendarActivityStart"></div>
            </div>
            <div class="col-lg-2">
	            <div id="cboCalendarActivityEnd"></div>
            </div>            
            <div class="col-lg-2">
                <button id="cmdGetSchedule" type="submit" class="btn btn-primary border-custom btn-block pull-right" onclick="cmdGetSchedule_OnClick()">Get Schedules</button>
            </div>
            <div class="col-lg-2 pull-right">
                <button id="cmdCreateReservation" type="submit" class="btn btn-success border-custom btn-block" onclick="cmdAddReservation_OnClick()">Create Reservation</button>
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

<!-- Reservation Add/Edit Window -->
<div class="modal fade" id="ReservationAddEdit">
    <div class="modal-dialog">
        <div class="modal-content border-custom">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Reservation Details</h4>
            </div>
            <div class="modal-body">
                <form id="messageForm">
                    <dl class="dl-horizontal">
                    
	                <!--  
	                	  RESV_ID int NOT NULL,  (NOT SHOWN)
						  RESV_MEBR_ID int NOT NULL,  (NOT SHOWN)
						  RESV_UNIT_NO int NOT NULL,  (AUTO INCREMENT, NOT SHOWN)
						  
						  RESV_CUST_ID int NOT NULL,  (DROPDOWN)
						  RESV_CACT_ID int NOT NULL,  (DEPENDS ON SELECTED DATE INDEXES, DROPDOWN)
						  RESV_PARTS_NO int NOT NULL, (DROPDOWN)
						  RESV_START_TIME_ID int NOT NULL,  (DROPDOWN)
						  RESV_END_TIME_ID int NOT NULL,  (DROPDOWN)
						  RESV_NOTE VARCHAR(255) NULL,  (TEXTBOX)
				     -->
						  
						  
                        <dt>Customer: </dt>
                        <dd>
                        	<!-- <div id="cboAECustomerName"></div> -->
                        	<input type="text" id="cboAECustomerName" readonly>
                        </dd>
                        <dt>Calendar Date: </dt>
                        <dd>
                            <div id="cboAECalenderDate"></div>
                        </dd>
                        <dt>Parts no: </dt>
                        <dd>
                            <div id="cboAEPartsNo"></div>
                        </dd>
                        
                        <dt>Start Time: </dt>
                        <dd>
                            <div id="cboAEStartTime"></div>
                        </dd>
                        
                        <dt>End Time: </dt>
                        <dd>
                            <div id="cboAEEndTime"></div>
                        </dd>
                        
                        <dt>Reservation Note: </dt>
                        <dd>
                            <input class="form-control border-custom" id="etAEResvNote" name="etAEResvNote" type="text" required />
                        </dd>
                                           
                    </dl>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary border-custom"  id="CmdAddEditOk" onclick="cmdAddEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger border-custom" id="CmdAddEditCancel">
                    Cancel
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
//===========================
//Schedule - Global Variables
//===========================
var isScheduleUpdated;

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
var customerTime;
var customerTimeFlat;

var startDateIndex;
var endDateIndex;

//EDIT ELEMENTS
/* var cboAECustomerName; */
var cboAECalenderDate;
var cboAEPartsNo;
var cboAEStartTime;
var cboAEEndTime;

// ======
// Events
// ======   
function cmdGetSchedule_OnClick() {
	isScheduleUpdated = true;
	
	var customerId = customerList[cboCustomer.selectedIndex].id;
    customerTime = new wijmo.collections.ObservableArray();
    customerTimeFlat = new wijmo.collections.ObservableArray();
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

            startDateIndex = cboCalendarActivityStart.selectedIndex;
            endDateIndex = cboCalendarActivityEnd.selectedIndex;
            
            for (var k = startDateIndex; k <= endDateIndex; k++) {
    	    	gridColumns.push({
    	        	"header" : calendarActivityList[k],
    	    		"allowSorting" : false,
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
                	customerTimeFlat.push({
                		time: results[i]["CTIM_DETAILS_NO"].toString(), 
                	});
                	for(p = 0; p < results[i]["CTIM_MAX_PARTS_NO"]; p++) {
                		var newObj = {
                				time: results[i]["CTIM_DETAILS_NO"].toString(), 
                				parts: p + 1
                		};
                		
                		// --- CREATE BUTTONS --------------------------------------
                		//TRAVERSE FROM SELECTED FROM DATE TO SELECTED TO DATE
                		for (k = startDateIndex; k <= endDateIndex; k++) {
                			var slotHolder = "";
                			//TRAVERSE FROM ALL RESERVATIONS (to be improved, query)
                			for(a = 0; a < reservationsList.length; a++){
                				//CHECK IF RESERVATION IS FOR THIS CUSTOMER (to be improved, query)
                				if(reservationsList[a].RESV_CUST_ID == customerId){
                					//CHECK IF RESERVATION IS FOR THIS DAY
	                				if(calendarActivityList[k] == reservationsList[a].RESV_DAY_CODE){
	                					//CHECK IF RESERVATION IS FOR THIS TIME
	                					if((results[i]["CTIM_ID"] >= reservationsList[a]["RESV_START_TIME_ID"]) && ((results[i]["CTIM_ID"] <= reservationsList[a]["RESV_END_TIME_ID"]))){
			                				//CHECK IF RESERVATION IS FOR THIS PART
		                					if(reservationsList[a]["RESV_PARTS_NO"] == (p + 1)){
		                						//ADD BUTTON THAT SHOWS WHO RESERVED THE TIME
			                					slotHolder = slotHolder + 
			                					"<button class='btn btn-primary btn-xs border-custom' onclick='cmdGetUser_OnClick(\""+ a +"\")'>x</button> ";
			                				}
		                				}
	                				}
                				}
                			}
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


//TO FINISH, HOW TO FIND CUSTOMER-USER ID TO ADD
function cmdAddEditOk_OnClick() {
 	var reservationObject = new Object();
 	 /* RESV_ID int NOT NULL,  (NOT SHOWN)
	    RESV_MEBR_ID int NOT NULL,  (NOT SHOWN)
	    RESV_UNIT_NO int NOT NULL,  (AUTO INCREMENT, NOT SHOWN)
	  
	    RESV_CUST_ID int NOT NULL,  (DROPDOWN)
	    RESV_CACT_ID int NOT NULL,  (DEPENDS ON SELECTED DATE INDEXES, DROPDOWN)
	    RESV_PARTS_NO int NOT NULL, (DROPDOWN)
	    RESV_START_TIME_ID int NOT NULL,  (DROPDOWN)
	    RESV_END_TIME_ID int NOT NULL,  (DROPDOWN)
	    RESV_NOTE VARCHAR(255) NULL,  (TEXTBOX) */

 	reservationObject.RESV_ID      = parseInt(document.getElementById('EDIT_CLDR_ID').value);
 	reservationObject.RESV_MEBR_ID = parseInt(document.getElementById('EDIT_CLDR_ID').value);
 	reservationObject.RESV_UNIT_NO = parseInt(document.getElementById('EDIT_CLDR_ID').value);
 	reservationObject.RESV_CUST_ID = parseInt(document.getElementById('EDIT_CLDR_ID').value);
 	reservationObject.RESV_CACT_ID = parseInt(document.getElementById('EDIT_CLDR_ID').value);
 	reservationObject.RESV_START_TIME_ID = parseInt(document.getElementById('EDIT_CLDR_ID').value);
 	reservationObject.RESV_END_TIME_ID = document.getElementById('EDIT_CLDR_DAYCODE').value;
 	reservationObject.RESV_NOTE = document.getElementById('EDIT_CLDR_NOTE').value;
 
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

function cmdGetUser_OnClick(customerName){
	alertify.alert("Reserved by: " + reservationsList[customerName]["RESV_MEBR_NAME"]);
	
}



function cmdAddReservation_OnClick() {
	
	if(isScheduleUpdated){
	    $('#ReservationAddEdit').modal({
	        show: true,
	        backdrop: false
	    });
	    
	    /* var customersList = new Array();
	    for (var i = 0; i < customerList.length; i++) {
	    	customersList.push(customerList[i].customerName);
	    } */
	    
	    var customerTimeList = new Array();
	    for (var i = 0; i < customerTimeFlat.length; i++) {
	    	customerTimeList.push(customerTimeFlat[i].time);
	    }
	    
	    var partsList = new Array();
	    for (var i = 1; i <= 3; i++) {
	    	partsList.push(i);
	    }
	    	
	    
	    //INITIALIZE DETAILS
	    /* cboAECustomerName.dispose();
	    cboAECustomerName = new wijmo.input.AutoComplete('#cboAECustomerName', {
	        itemsSource: customersList,
	        onSelectedIndexChanged: function () {
	            getCalendarActivities(customerCollection.items[cboAECustomerName.selectedIndex].id)
	            
	            cboAECalenderDate.dispose();
	            cboAECalenderDate = new wijmo.input.AutoComplete('#cboAECalenderDate', {
	                itemsSource: calendarActivityList,
	            });	
	        }
	    });	 */
	    
	    var customerName = document.getElementById("cboAECustomerName");
	    customerName.value = customerList[cboCustomer.selectedIndex].customerName;
	    
	    cboAECalenderDate.dispose();
	    cboAECalenderDate = new wijmo.input.AutoComplete('#cboAECalenderDate', {
	        itemsSource: calendarActivityList.slice(startDateIndex, endDateIndex + 1),
	    });	
	    
	    cboAEPartsNo.dispose();
	    cboAEPartsNo = new wijmo.input.AutoComplete('#cboAEPartsNo', {
	        itemsSource: partsList,
	        onSelectedIndexChanged: function () {
	        }
	    });	
	    
	    cboAEStartTime.dispose();
	    cboAEStartTime = new wijmo.input.AutoComplete('#cboAEStartTime', {
	        itemsSource: customerTimeList,
	        onSelectedIndexChanged: function () {
	        }
	    });	
	    
	    cboAEEndTime.dispose();
	    cboAEEndTime = new wijmo.input.AutoComplete('#cboAEEndTime', {
	        itemsSource: customerTimeList,
	        onSelectedIndexChanged: function () {
	        }
	    });
	}else{
		alertify.alert("Update Schedules first.")
	}
}

//=================
// Getting the Data
//=================   
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
              
                	//GET ALL RESERVATIONS - (Improve: Query only Customer Reservations for this date.)
                	result.RESV_CACT.forEach(function (reservation){
	                	var startTimeName = reservation["RESV_START_TIME_FK"];
	                	var endTimeName = reservation["RESV_END_TIME_FK"];
	                	reservationsList.push({
	                		RESV_CUST_ID: result.CACT_CUST_ID,
	                		RESV_PARTS_NO: reservation.RESV_PARTS_NO,
	                		RESV_DAY_CODE: result.CACT_CLDR_FK.CLDR_DAYCODE,
	                		RESV_START_TIME_ID: reservation.RESV_START_TIME_ID,
	                		RESV_END_TIME_ID: reservation.RESV_END_TIME_ID,
	                		RESV_NOTE: reservation.RESV_PARTS_NO,
	                		RESV_MEBR_NAME: reservation.RESV_MEBR_FK["MEBR_LAST_NAME"] + ", " + reservation.RESV_MEBR_FK["MEBR_FIRST_NAME"]
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
            getCalendarActivities(customerCollection.items[this.selectedIndex].id);
            isScheduleUpdated = false;
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
    });		
    
    cboCalendarActivityEnd.dispose();
    cboCalendarActivityEnd = new wijmo.input.AutoComplete('#cboCalendarActivityEnd', {
        itemsSource: calendarActivityList,
    });	    
}

//=========
//Page Load
//========= 
$(document).ready(function () {
	isScheduleUpdated = false;
	
	$('#CmdAddEditCancel, .close').click(function () {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#ReservationAddEdit').modal('hide');
    });
	
	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer');
	
	/* cboAECustomerName = new wijmo.input.AutoComplete('#cboAECustomerName'); */
	cboAECalenderDate = new wijmo.input.AutoComplete('#cboAECalenderDate');
	cboAEPartsNo = new wijmo.input.AutoComplete('#cboAEPartsNo');
	cboAEStartTime = new wijmo.input.AutoComplete('#cboAEStartTime');
	cboAEEndTime = new wijmo.input.AutoComplete('#cboAEEndTime');
	
	cboCalendarActivityStart = new wijmo.input.AutoComplete('#cboCalendarActivityStart');
	cboCalendarActivityEnd = new wijmo.input.AutoComplete('#cboCalendarActivityEnd');
	getCustomers();
	
	scheduleGrid = new wijmo.grid.FlexGrid('#scheduleGrid');
});

</script>

<!-- footer -->
<%@include file="include_secure_copyright_footer.jsp"%>