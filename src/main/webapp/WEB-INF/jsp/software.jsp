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
                <button id="cmdGetSchedule" type="submit" class="btn btn-primary border-custom btn-block pull-right" onclick="cmdGetSchedule_OnClick()">Get</button>
            </div>
            <div class="col-lg-2 pull-right">
                <button id="cmdCreateReservation" type="submit" class="btn btn-success border-custom btn-block" onclick="cmdAddReservation_OnClick()">Add</button>
            </div>
        </div>
        <br />
        <div class="row">
	    	<div class="col-lg-12">
	        	<div id="scheduleGrid" class="grid border-custom" style="height:63vh"></div>
	        </div>
        </div>
        </br>
        <div class="row">
	    	<div class="col-lg-12">
	        	<button class='btn btn-success btn-xs border-custom'>x</button> - Your Reservations
	        	&nbsp &nbsp &nbsp &nbsp &nbsp
	        	<button class='btn btn-primary btn-xs border-custom'>x</button> - Taken Reservations
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
	                    <dd>
	                         <input type="text" id="AE_RESV_ID" class="hidden" readonly>
	                         <input type="text" id="AE_MEBR_ID" class="hidden" readonly>
	                         <!-- backend increment? -->
	                         <input type="text" id="AE_UNIT_NO" class="hidden" readonly> 
	                    </dd>
                        <dt>Customer: </dt>
                        <dd>
                            <input type="text" id="AE_CUST_ID" class="hidden" readonly>
                        	<input type="text" class="form-control autocomplete-wide" id="AE_CUST_NAME" readonly>
                        </dd>
                        <dt>Calendar Date: </dt>
                        <dd>
                        	<input type="text" id="AE_CACT_ID" class="hidden" readonly>
                            <div id="AE_CALENDAR_DATE" class="autocomplete-wide"></div>
                        </dd>
                        <dt>Parts no: </dt>
                        <dd>
                            <input type="text" id="AE_PARTS_NO" class="hidden" readonly>
                            <div id="AE_PARTS" class="autocomplete-wide"></div>
                        </dd>
                        
                        <dt>Start Time: </dt>
                        <dd>
                        	<input type="text" id="AE_START_TIME_ID" class="hidden" readonly>
                            <div id="AE_START_TIME" class="autocomplete-wide"></div>
                        </dd>
                        
                        <dt>End Time: </dt>
                        <dd>
                        	<input type="text" id="AE_END_TIME_ID" class="hidden" readonly>
                            <div id="AE_END_TIME" class="autocomplete-wide"></div>
                        </dd>
                        
                        <dt>Reservation Note: </dt>
                        <dd>
                            <textarea cols="*" rows="3" id="AE_RESV_NOTES" name="AE_RESV_NOTES" class="form-control border-custom textbox-size" required ></textarea>
                        </dd>
                                           
                    </dl>
                </form>
            </div>
            
            <div class="modal-footer">
				<button type="button" class="btn btn-danger border-custom pull-left" id="CmdDelete" onclick="cmdDelete_OnClick()">
	            	Delete
	            </button>
                <button type="button" class="btn btn-primary border-custom"  id="CmdAddEditOk" onclick="cmdAddEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger border-custom" id="CmdAddEditCancel">
                    <!-- Cancel -->
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
var currentLookup;
var ceilParts = 0;
var loggedInCustomerId;
var isScheduleUpdated;

var cboCustomer;
var cboCalendarActivityStart;
var cboCalendarActivityEnd;

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
var cboAECalenderDate;
var cboAEPartsNo;
var cboAEStartTime;
var cboAEEndTime;

var scheduleGrid;

// ======
// Events
// ======
	
function updateTable(){
	calendarActivities = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/calendarActivity/listByCustomer',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":customerList[cboCustomer.selectedIndex].id},
        success: function (results) {
        	reservationsList = new Array();
            if (results.length > 0) {
                results.forEach(function(result){
                	calendarActivities.push({
                        id: result.CACT_ID,
                        dayCode: result.CACT_CLDR_FK.CLDR_DAYCODE,
                    });
                });
                
            }

			console.log("update");
            $.ajax({
                url: '${pageContext.request.contextPath}/api/reservation/listByCustomer',
                cache: false,
                type: 'GET',
                contentType: 'application/json; charset=utf-8',
                data: {"customerId":customerId},
                success: function (results) {
                	//GET ALL RESERVATIONS
                	results.forEach(function (reservation){
                		reservationsList.push({
                			RESV_ID: reservation.RESV_ID,
                			RESV_CUST_ID: reservation.RESV_CUST_ID,
                			RESV_CACT_ID: reservation.RESV_CACT_ID,
                			RESV_MEBR_ID: reservation.RESV_MEBR_FK["MEBR_ID"],
                			RESV_UNIT_NO: reservation.RESV_UNIT_NO,
                			RESV_PARTS_NO: reservation.RESV_PARTS_NO,
                			RESV_START_TIME_ID: reservation.RESV_START_TIME_ID,
                			RESV_END_TIME_ID: reservation.RESV_END_TIME_ID,
                			RESV_NOTE: reservation.RESV_NOTE,
                			
                			RESV_MEBR_NAME: reservation.RESV_MEBR_FK["MEBR_LAST_NAME"] + ", " + reservation.RESV_MEBR_FK["MEBR_FIRST_NAME"]
                	    });
            			console.log(reservation.RESV_ID);
                	});
                	
                	cmdGetSchedule_OnClick();
                }
            }).fail(
                function (xhr, textStatus, err) {
                    alert(err);
                }
            );	
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );	
}

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
                		id: results[i]["CTIM_ID"],
                		time: results[i]["CTIM_DETAILS_NO"].toString(), 
                	});
                	
                	if(results[i]["CTIM_MAX_PARTS_NO"] > ceilParts)
               		{
                		ceilParts = results[i]["CTIM_MAX_PARTS_NO"];
               		}
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
                				//CHECK IF RESERVATION IS FOR THIS CUSTOMER
                				if(reservationsList[a].RESV_CUST_ID == customerId){
                					//CHECK IF RESERVATION IS FOR THIS DAY
	                				if(calendarActivities[k].id == reservationsList[a].RESV_CACT_ID){
	                					//CHECK IF RESERVATION IS FOR THIS TIME
	                					if((results[i]["CTIM_ID"] >= reservationsList[a]["RESV_START_TIME_ID"]) && ((results[i]["CTIM_ID"] <= reservationsList[a]["RESV_END_TIME_ID"]))){
			                				//CHECK IF RESERVATION IS FOR THIS PART
			                				if(reservationsList[a]["RESV_PARTS_NO"] == (p + 1)){
		                						//ADD BUTTON THAT SHOWS WHO RESERVED THE TIME
		                						if(reservationsList[a]["RESV_MEBR_ID"] == loggedInCustomerId){
			                						//CAN EDIT IF RESERVED BY CUSTOMER
		                							slotHolder = slotHolder + 
				                					"<button class='btn btn-success btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", true)'>x</button> ";
		                						}else{
		                							//VIEW ONLY IF NOT
				                					slotHolder = slotHolder + 
				                					"<button class='btn btn-primary btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", false)'>x</button> ";
		                						}
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
            		selectionMode : wijmo.grid.SelectionMode.Cell,
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

function cmdAddEditOk_OnClick() {
 	var reservation = new Object();

 	reservation.RESV_ID      = parseInt(document.getElementById('AE_RESV_ID').value);
 	reservation.RESV_CUST_ID = parseInt(document.getElementById('AE_CUST_ID').value);
 	reservation.RESV_MEBR_ID = parseInt(document.getElementById('AE_MEBR_ID').value);
 	reservation.RESV_CACT_ID = parseInt(document.getElementById('AE_CACT_ID').value);
 	reservation.RESV_UNIT_NO = /* parseInt(document.getElementById('AE_UNIT_NO').value) */ 1;
 	reservation.RESV_PARTS_NO = parseInt(document.getElementById('AE_PARTS_NO').value);
 	reservation.RESV_START_TIME_ID = parseInt(document.getElementById('AE_START_TIME_ID').value);
 	reservation.RESV_END_TIME_ID = document.getElementById('AE_END_TIME_ID').value;
 	reservation.RESV_NOTE = document.getElementById('AE_RESV_NOTES').value;
 	
 	var data = JSON.stringify(reservation);

    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/api/reservation/update',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: function (data) {
            if (data.RESV_ID > 0) {
                toastr.success('Successfully updated.');
                window.setTimeout(function () { 
                	updateTable();
                	closeWindow();
                }, 1000);
            } else {
                toastr.error("Not updated.");
            }
        }
    }); 
}

function cmdDelete_OnClick(){
    alertify.confirm("Are you sure you want to cancel this reservation? <span class='glyphicon glyphicon-trash'></span>", function (e) {
    if (e) {
        $.ajax({
            type: "DELETE",
            url: '${pageContext.request.contextPath}/api/reservation/delete/' + currentLookup,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            statusCode: {
                200: function () {
                    toastr.success('Successfully Deleted.');
                    window.setTimeout(function () { 
                    	updateTable();
                    	closeWindow();
                    }, 1000);
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
    });
}

function cmdAddReservation_OnClick() {
	if(isScheduleUpdated){
	    $('#ReservationAddEdit').modal({
	        show: true,
	        backdrop: false
	    });

	    var customerTimeList = new Array();
	    for (var i = 0; i < customerTimeFlat.length; i++) {
	    	customerTimeList.push(customerTimeFlat[i].time);
	    }
	    
	    var partsList = new Array();
	    for (var i = 1; i <= ceilParts; i++) {
	    	partsList.push(i);
	    }
	    
	    document.getElementById("AE_RESV_ID").value = 0;
	    document.getElementById("AE_MEBR_ID").value = loggedInCustomerId;
	    document.getElementById("AE_CUST_ID").value = customerList[cboCustomer.selectedIndex].id;
	    document.getElementById("AE_CUST_NAME").value = customerList[cboCustomer.selectedIndex].customerName;
	    
	    
	    document.getElementById("AE_CACT_ID").value = calendarActivities[0].id;
	    cboAECalenderDate.dispose();
	    cboAECalenderDate = new wijmo.input.AutoComplete('#AE_CALENDAR_DATE', {
	        itemsSource: calendarActivityList.slice(startDateIndex, endDateIndex + 1),
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_CACT_ID").value = calendarActivities[cboAECalenderDate.selectedIndex + startDateIndex].id;
	        }
	    });

    	document.getElementById("AE_PARTS_NO").value = partsList[0];
	    cboAEPartsNo.dispose();
	    cboAEPartsNo = new wijmo.input.AutoComplete('#AE_PARTS', {
	        itemsSource: partsList,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_PARTS_NO").value = partsList[cboAEPartsNo.selectedIndex];
	        }
	    });	
	    
	    document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[0].id;
	    cboAEStartTime.dispose();
	    cboAEStartTime = new wijmo.input.AutoComplete('#AE_START_TIME', {
	        itemsSource: customerTimeList,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[cboAEStartTime.selectedIndex].id;
	        }
	    });	
	    
	    document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[0].id;
	    cboAEEndTime.dispose();
	    cboAEEndTime = new wijmo.input.AutoComplete('#AE_END_TIME', {
	        itemsSource: customerTimeList,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[cboAEEndTime.selectedIndex].id;
	        }
	    });
	    
	    document.getElementById("AE_RESV_NOTES").disabled = false;
    	document.getElementById("CmdDelete").style.visibility = "hidden";
    	document.getElementById("CmdAddEditOk").style.visibility = "visible";

	}else{
		alertify.alert("Update Schedules first.")
	}
}

function cmdEditReservation_OnClick(customerId, isUser) {
	var reservation = reservationsList[customerId];

	if(isScheduleUpdated){
	    $('#ReservationAddEdit').modal({
	        show: true,
	        backdrop: false
	    });

	    var customerTimeList = new Array();
	    for (var i = 0; i < customerTimeFlat.length; i++) {
	    	customerTimeList.push(customerTimeFlat[i].time);
	    }
	    
	    var partsList = new Array();
	    for (var i = 1; i <= ceilParts; i++) {
	    	partsList.push(i);
	    }
	    
	    currentLookup = reservation.RESV_ID;
	    
	    document.getElementById("AE_RESV_ID").value = reservation.RESV_ID;
	    document.getElementById("AE_MEBR_ID").value = reservation.RESV_MEBR_ID;
	    document.getElementById("AE_CUST_ID").value = customerList[cboCustomer.selectedIndex].id;
	    document.getElementById("AE_CUST_NAME").value = customerList[cboCustomer.selectedIndex].customerName;
	    
		/* reservation.RESV_CACT_ID */
		var calendarDateIndex = 0;
		//INDEXOF DOES NOT WORK, USING FOR LOOPS FOR NOW (DAFUQ)
		for(a = 0; a < calendarActivities.slice(startDateIndex, endDateIndex + 1).length; a++)
		{
			console.log(calendarActivities.slice(startDateIndex, endDateIndex + 1)[a].id + " " + reservation.RESV_CACT_ID)
			if(calendarActivities.slice(startDateIndex, endDateIndex + 1)[a].id == reservation.RESV_CACT_ID){
				calendarDateIndex = a;
			}
		}
	    document.getElementById("AE_CACT_ID").value = calendarActivities[calendarDateIndex].id;
	    cboAECalenderDate.dispose();
	    cboAECalenderDate = new wijmo.input.AutoComplete('#AE_CALENDAR_DATE', {
	        itemsSource: calendarActivityList.slice(startDateIndex, endDateIndex + 1),
	        disabled: !isUser,
	        selectedIndex: calendarDateIndex,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_CACT_ID").value = calendarActivities[cboAECalenderDate.selectedIndex + startDateIndex].id;
	        }
	    });
	    
    	document.getElementById("AE_PARTS_NO").value = partsList[reservation.RESV_PARTS_NO - 1];
	    cboAEPartsNo.dispose();
	    cboAEPartsNo = new wijmo.input.AutoComplete('#AE_PARTS', {
	        itemsSource: partsList,
	        disabled: !isUser,
	        selectedIndex: reservation.RESV_PARTS_NO - 1,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_PARTS_NO").value = partsList[cboAEPartsNo.selectedIndex];
	        }
	    });	
	    
	    startTimeIndex = 0;
		for(b = 0; b < customerTimeFlat.length; b++)
		{
			if(customerTimeFlat[b].id == reservation.RESV_START_TIME_ID){
				startTimeIndex = b;
				break;
			}
		}
		
	    document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[startTimeIndex].id;
	    cboAEStartTime.dispose();
	    cboAEStartTime = new wijmo.input.AutoComplete('#AE_START_TIME', {
	        itemsSource: customerTimeList,
	        disabled: !isUser,
	        selectedIndex: startTimeIndex,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[cboAEStartTime.selectedIndex].id;
	        }
	    });	

	    endTimeIndex = 0;
		for(c = 0; c < customerTimeFlat.length; c++)
		{
			if(customerTimeFlat[c].id == reservation.RESV_END_TIME_ID){
				endTimeIndex = c;
				break;
			}
		}
		
	    document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[endTimeIndex].id;
	    cboAEEndTime.dispose();
	    cboAEEndTime = new wijmo.input.AutoComplete('#AE_END_TIME', {
	        itemsSource: customerTimeList,
	        disabled: !isUser,
	        selectedIndex: endTimeIndex,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[cboAEEndTime.selectedIndex].id;
	        }
	    });
	    
	    document.getElementById("AE_RESV_NOTES").value = reservation.RESV_NOTE;
	    document.getElementById("AE_RESV_NOTES").disabled = !isUser;
	    
	    if(!isUser){
	    	document.getElementById("CmdDelete").style.visibility = "hidden";
	    	document.getElementById("CmdAddEditOk").style.visibility = "hidden";
	    }else{
	    	document.getElementById("CmdDelete").style.visibility = "visible";
	    	document.getElementById("CmdAddEditOk").style.visibility = "visible";
	    }
	    
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
            $.ajax({
                url: '${pageContext.request.contextPath}/api/reservation/listByCustomer',
                cache: false,
                type: 'GET',
                contentType: 'application/json; charset=utf-8',
                data: {"customerId":customerId},
                success: function (results) {
                	//GET ALL RESERVATIONS
                	results.forEach(function (reservation){
                		reservationsList.push({
                			RESV_ID: reservation.RESV_ID,
                			RESV_CUST_ID: reservation.RESV_CUST_ID,
                			RESV_CACT_ID: reservation.RESV_CACT_ID,
                			RESV_MEBR_ID: reservation.RESV_MEBR_FK["MEBR_ID"],
                			RESV_UNIT_NO: reservation.RESV_UNIT_NO,
                			RESV_PARTS_NO: reservation.RESV_PARTS_NO,
                			RESV_START_TIME_ID: reservation.RESV_START_TIME_ID,
                			RESV_END_TIME_ID: reservation.RESV_END_TIME_ID,
                			RESV_NOTE: reservation.RESV_NOTE,
                			RESV_MEBR_NAME: reservation.RESV_MEBR_FK["MEBR_LAST_NAME"] + ", " + reservation.RESV_MEBR_FK["MEBR_FIRST_NAME"]
                	    });
                	});
                	
                	cmdGetSchedule_OnClick();
                }
            }).fail(
                function (xhr, textStatus, err) {
                    alert(err);
                }
            );	
            
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );	
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
function closeWindow() {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#ReservationAddEdit').modal('hide');
}
    
$(document).ready(function () {
	isScheduleUpdated = false;
	//CHANGE!
	$.ajax({
        type: "GET",
        url: '${pageContext.request.contextPath}/api/customerMember/getloggedinmember',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
        	loggedInCustomerId = data[0]["MEBR_ID"];
        }
    });
	
	$('#CmdAddEditCancel, .close').click(function() {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#ReservationAddEdit').modal('hide');
    });
	
	cboCustomer = new wijmo.input.AutoComplete('#cboCustomer');
	cboCalendarActivityStart = new wijmo.input.AutoComplete('#cboCalendarActivityStart');
	cboCalendarActivityEnd = new wijmo.input.AutoComplete('#cboCalendarActivityEnd');

	cboAECalenderDate = new wijmo.input.AutoComplete('#AE_CALENDAR_DATE');
	cboAEPartsNo = new wijmo.input.AutoComplete('#AE_PARTS');
	cboAEStartTime = new wijmo.input.AutoComplete('#AE_START_TIME');
	cboAEEndTime = new wijmo.input.AutoComplete('#AE_END_TIME');
	
	getCustomers();
	
	scheduleGrid = new wijmo.grid.FlexGrid('#scheduleGrid');
});

</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>