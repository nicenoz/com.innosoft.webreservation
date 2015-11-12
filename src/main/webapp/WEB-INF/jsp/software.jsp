<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>Software</title>

<div class="container"> 
<section>	
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
            	<div id='loadingCustomer' class="span-Custom"></div>
	            <div id="cboCustomer" class="border-custom"></div>
            </div>
            <div class="col-lg-2">
            	<div id='loadingCalendarActivityStart' class="span-Custom"></div>
	            <div id="cboCalendarActivityStart" class="border-custom"></div>
            </div>
            <div class="col-lg-2">
           		<div id='loadingCalendarActivityEnd' class="span-Custom"></div>
	            <div id="cboCalendarActivityEnd" class="border-custom"></div>
            </div>            
            <div class="col-lg-2">
                <button id="cmdGetSchedule" type="submit" class="btn btn-primary border-custom btn-block pull-right" onclick="updateTable()">Get</button>
            </div>
            <div class="col-lg-2 pull-right">
                <button id="cmdCreateReservation" type="submit" class="btn btn-success border-custom btn-block" onclick="cmdAddReservation_OnClick()">Add</button>
            </div>
        </div>
        <br />
        <div class="row">
	    	<div class="col-lg-12">
	        	<div id="scheduleGrid" class="grid border-custom" style="height:60vh"></div>
	        </div>
        </div>
        </br>
        <div class="row">
	    	<div class="col-lg-12">
	        	<button class='btn btn-success btn-xs border-custom'>x</button> - Your Reservations
	        	&nbsp &nbsp &nbsp &nbsp &nbsp
	        	<button class='btn btn-warning btn-xs border-custom'>x</button> - Your Waiting Reservations
	        	&nbsp &nbsp &nbsp &nbsp &nbsp
	        	<button class='btn btn-primary btn-xs border-custom'>x</button> - Taken Reservations
	        	&nbsp &nbsp &nbsp &nbsp &nbsp
	        	<button class='btn btn-danger btn-xs border-custom'>x</button> - Waiting Reservations
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
                            <div id="AE_CALENDAR_DATE" class="autocomplete-wide"></div>
                        </dd>
                        <dt>Parts no: </dt>
                        <dd>
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

var hasDeleted = false;
var deleteDate;
var deletePart;
var deleteTime;

var currentLookup;
var loggedInCustomerId;
var isScheduleUpdated;
var loggedInCustomerEmail;
var codeList;

var partNames;

var cboCustomer;
var cboCalendarActivityStart;
var cboCalendarActivityEnd;

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
        url: '${pageContext.request.contextPath}/api/calendarActivity/listByCustomerWithRestrictions',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":cboCustomer.selectedValue.id},
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
            var selectedDates = "";
            for(i = cboCalendarActivityStart.selectedIndex; i <= cboCalendarActivityEnd.selectedIndex; i++){
            	selectedDates = selectedDates + calendarActivityCollection.items[i].id + ",";
            }
            
            $.ajax({
                url: '${pageContext.request.contextPath}/api/reservation/listByDates',
                cache: false,
                type: 'GET',
                contentType: 'application/json; charset=utf-8',
                data: {"customerId":cboCustomer.selectedValue.id,
                	   "calendarActivityIds": selectedDates},
                success: function (results) {
                	//GET ALL RESERVATIONS
                	results.forEach(function (reservation){
                		reservationsList.push({
                			RESV_ID: reservation.RESV_ID,
                			RESV_CUST_ID: reservation.RESV_CUST_ID,
                			RESV_CACT_ID: reservation.RESV_CACT_ID,
                			RESV_MEBR_ID: reservation.RESV_MEBR_FK["MEBR_ID"],
                			RESV_MEBR_EMAIL: reservation.RESV_MEBR_FK["MEBR_EMAIL_ADDRESS"],
                			RESV_UNIT_NO: reservation.RESV_UNIT_NO,
                			RESV_PARTS_NO: reservation.RESV_PARTS_NO,
                			RESV_START_TIME_ID: reservation.RESV_START_TIME_ID,
                			RESV_END_TIME_ID: reservation.RESV_END_TIME_ID,
                			RESV_NOTE: reservation.RESV_NOTE,
                			RESV_ISDELETED: reservation.ISDELETED,
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

function cmdGetSchedule_OnClick() {
	isScheduleUpdated = true;
	
	var customerId = cboCustomer.selectedValue.id;
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
                		time: results[i]["CTIM_DETAILS_NO"].toString()
                	});
                	
                	for(p = 0; p < results[i]["CTIM_MAX_PARTS_NO"] ; p++) {
                		var newObj;
                		
                		if(results[i]["CTIM_MAX_PARTS_NO"] == 1){
	                		newObj = {
	                				time: results[i]["CTIM_DETAILS_NO"].toString(), 
	                				parts: partNames[p].name
	                		};
	                		
	                		// --- CREATE BUTTONS --------------------------------------
	                		//TRAVERSE FROM SELECTED FROM DATE TO SELECTED TO DATE
	                		for (k = startDateIndex; k <= endDateIndex; k++) {
	                			var counter = new Array(results[i]["CTIM_MAX_PARTS_NO"]);
	                			var slotHolder = "";
	                			//TRAVERSE FROM ALL RESERVATIONS (to be improved, query)
	                			for(a = 0; a < reservationsList.length; a++){
	                				//CHECK IF IS DELETED
	                				if(reservationsList[a].RESV_ISDELETED == 0){
		                				//CHECK IF RESERVATION IS FOR THIS DAY
		                				if(calendarActivities[k].id == reservationsList[a].RESV_CACT_ID){
		                					//CHECK IF RESERVATION IS FOR THIS TIME
		                					if((results[i]["CTIM_ID"] >= reservationsList[a]["RESV_START_TIME_ID"]) && ((results[i]["CTIM_ID"] <= reservationsList[a]["RESV_END_TIME_ID"]))){
				                				//CHECK IF RESERVATION IS FOR THIS PART
		                						var y = k - startDateIndex;

			                					if(counter[i] == null){
			                						counter[i] = new Array(endDateIndex - startDateIndex + 1);
			                						counter[i][y] = 1;
			                					}else{
			                						if(counter[i][y] == null){
			                							counter[i][y] = 1;
			                						}else{
			                							counter[i][y]++;
			                						}
			                					}
			                					
				                				if(reservationsList[a]["RESV_PARTS_NO"] == (p + 1)){
				                					if(counter[i][y] <= results[i]["CTIM_MAX_UNIT_NO"]){
			                							//ADD BUTTON THAT SHOWS WHO RESERVED THE TIME
				                						if(reservationsList[a]["RESV_MEBR_ID"] == loggedInCustomerId){
					                						//CAN EDIT IF RESERVED BY CUSTOMER
				                							slotHolder = slotHolder + 
						                					"<button class='btn btn-success btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", true)'>x</button> ";
				                						} else {
				                							//VIEW ONLY IF NOT
						                					slotHolder = slotHolder + 
						                					"<button class='btn btn-primary btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", false)'>x</button> ";
				                						}
			                							
				                						if(hasDeleted){
		            										if(counter[i][y] == results[i]["CTIM_MAX_UNIT_NO"]){
					                							if(deleteDate == reservationsList[a].RESV_CACT_ID){
				                									if(deleteTime == reservationsList[a]["RESV_START_TIME_ID"]){
				                										
				                										hasDeleted = false;
				                										
				                										var emailObject = new Object();
				                										var timeStart;
				                										var timeEnd;
				                										
				                										for(var ab = 0; ab < customerTimeFlat.length; ab++){
				                											if(customerTimeFlat[ab].id == reservationsList[a]["RESV_START_TIME_ID"]){
				                												timeStart = customerTimeFlat[ab].time;
				                												break;
				                											}
				                										}
				                										
				                										for(var ab = 0; ab < customerTimeFlat.length; ab++){
				                											if(customerTimeFlat[ab].id == reservationsList[a]["RESV_END_TIME_ID"]){
				                												timeEnd = customerTimeFlat[ab].time;
				                												break;
				                											}
				                										}
				                										
				                										var message = reservationsList[a]["RESV_NOTE"]?reservationsList[a]["RESV_NOTE"]:" ";
				                										
				                				    	    			emailObject.EMAIL_EMAIL = reservationsList[a]["RESV_MEBR_EMAIL"];
				                				    	    			emailObject.EMAIL_SUBJECT =  cboCustomer.selectedValue.customerName + " Activated Reservation";
				                				    	    			emailObject.EMAIL_MESSAGE = "Your Reservation has been moved from Waiting to Active:\n\nReservation Date: " + calendarActivities[k].dayCode +
				                				    	    				"\nPart No.: " + reservationsList[a]["RESV_PARTS_NO"] + 
				                				    	    				"\nTime Start: "+ timeStart +
				                				    	    				"\nTime End: "+  timeEnd +
				                				    	    				"\nNote: " + message;
				                				    	    				
				                				        				emailObject.EMAIL_RECEIVER_ID =  reservationsList[a]["RESV_MEBR_ID"];
				                				    	    			emailObject.EMAIL_PURPOSE = "Activated Reservation";
				                				    	    				
				                				    	    			var email = JSON.stringify(emailObject);
				                				    	    			$.ajax({
				                				    						type : "POST",
				                				    						url : '${pageContext.request.contextPath}/api/email/send',
				                				    						contentType : "application/json; charset=utf-8",
				                				    						dataType : "json",
				                				    						data : email,
				                				    						statusCode : {
				                				    							200 : function() {
				                				    								$('#loading').modal('hide');
				                				    								toastr.info(getMessage("M0001"));
				                				    							},
				                				    							404 : function() {
				                				    								$('#loading').modal('hide');
				                				    								toastr.info(getMessage("E0010"));
				                				    							},
				                				    							400 : function() {
				                				    								$('#loading').modal('hide');
				                				    								toastr.error(getMessage("E0003"));
				                				    							}
				                				    						}
				                				    	 				});
				                										
				                									}
					                							}
					                						}
				                						}
			                						}else{
			                							if(reservationsList[a]["RESV_MEBR_ID"] == loggedInCustomerId){
					                						//CAN EDIT IF RESERVED BY CUSTOMER
				                							slotHolder = slotHolder + 
						                					"<button class='btn btn-warning btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", true)'>x</button> ";
				                						} else {
				                							//VIEW ONLY IF NOT
						                					slotHolder = slotHolder + 
						                					"<button class='btn btn-danger btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", false)'>x</button> ";
				                						}
			                						}
			                					}
			                				}
		                				}
	                				}
	                			}
	                			newObj[calendarActivityList[k]] = slotHolder;
	                 	    }  
	                		
                		} else {
                			newObj = {
	                				time: results[i]["CTIM_DETAILS_NO"].toString(), 
	                				parts: partNames[p].name
	                		};

                    		// --- CREATE BUTTONS --------------------------------------
                    		//TRAVERSE FROM SELECTED FROM DATE TO SELECTED TO DATE
                    		for (k = startDateIndex; k <= endDateIndex; k++) {
                    			var counter = new Array(results[i]["CTIM_MAX_PARTS_NO"]);
                    			var slotHolder = "";
                    			//TRAVERSE FROM ALL RESERVATIONS (to be improved, query)
                    			for(a = 0; a < reservationsList.length; a++){
                				//CHECK IF IS DELETED
                				if(reservationsList[a].RESV_ISDELETED == 0){
	                				//CHECK IF RESERVATION IS FOR THIS DAY
	                				if(calendarActivities[k].id == reservationsList[a].RESV_CACT_ID){
	                					//CHECK IF RESERVATION IS FOR THIS TIME
	                					if((results[i]["CTIM_ID"] >= reservationsList[a]["RESV_START_TIME_ID"]) && ((results[i]["CTIM_ID"] <= reservationsList[a]["RESV_END_TIME_ID"]))){
			                				//CHECK IF RESERVATION IS FOR THIS PART
			                				if(reservationsList[a]["RESV_PARTS_NO"] == (p + 1)){
		                						var x = reservationsList[a]["RESV_PARTS_NO"] - 1;
		                						var y = k - startDateIndex;
		                						
			                					if(counter[x] == null){
			                						counter[x] = new Array(endDateIndex - startDateIndex + 1);
			                						counter[x][y] = 1;
			                					}else{
			                						if(counter[x][y] == null){
			                							counter[x][y] = 1;
			                						}else{
			                							counter[x][y]++;
			                						}
			                					}
			                					
			                					if(counter[x][y] <= 1){
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
		                						}else{
		                							if(reservationsList[a]["RESV_MEBR_ID"] == loggedInCustomerId){
				                						//CAN EDIT IF RESERVED BY CUSTOMER
			                							slotHolder = slotHolder + 
					                					"<button class='btn btn-warning btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", true)'>x</button> ";
			                						}else{
			                							//VIEW ONLY IF NOT
					                					slotHolder = slotHolder + 
					                					"<button class='btn btn-danger btn-xs border-custom' onclick='cmdEditReservation_OnClick(\""+ a +"\", false)'>x</button> ";
			                						}
		                						}
			                					
		                					}
		                				}
	                				}
                				}
                			}
                    			newObj[calendarActivityList[k]] = slotHolder;
                     	    }  
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
 	reservation.RESV_CACT_ID = parseInt(cboAECalenderDate.selectedValue.id);
 	reservation.RESV_UNIT_NO = 1;
 	reservation.RESV_PARTS_NO = parseInt(cboAEPartsNo.selectedValue.id);
 	reservation.RESV_START_TIME_ID = parseInt(document.getElementById('AE_START_TIME_ID').value);
 	reservation.RESV_END_TIME_ID = parseInt(document.getElementById('AE_END_TIME_ID').value);
 	reservation.RESV_NOTE = document.getElementById('AE_RESV_NOTES').value;
 	
 	var data = JSON.stringify(reservation);

    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/api/reservation/update',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        statusCode: {
            200: function (data) {
            	if (data.RESV_ID > 0) {
                	if(reservation.RESV_ID  == 0){
                	 	document.getElementById("CmdAddEditOk").disabled = true;
                	 	document.getElementById("CmdAddEditCancel").disabled = true;
                		toastr.success(getMessage("S0002"));
    	                
    	                var emailObject = new Object();
    	    			emailObject.EMAIL_EMAIL = loggedInCustomerEmail;
    	    			emailObject.EMAIL_SUBJECT =  cboCustomer.selectedValue.customerName + " Reservation";
    	    			emailObject.EMAIL_MESSAGE = "You have made a reservation in " +cboCustomer.selectedValue.customerName +":\n\nReservation Date: " + cboAECalenderDate.selectedValue.dayCode +
    	    				"\nPart No.: " + parseInt(cboAEPartsNo.selectedValue.id) + 
    	    				"\nTime Start: "+ cboAEStartTime.selectedValue +
    	    				"\nTime End: "+  cboAEEndTime.selectedValue +
    	    				"\nNote: " + document.getElementById('AE_RESV_NOTES').value;
    	    				
        				emailObject.EMAIL_RECEIVER_ID = reservation.RESV_MEBR_ID;
    	    			emailObject.EMAIL_PURPOSE = "Add Reservation";
    	    				
    	    			var email = JSON.stringify(emailObject);
    	    			$.ajax({
    						type : "POST",
    						url : '${pageContext.request.contextPath}/api/email/send',
    						contentType : "application/json; charset=utf-8",
    						dataType : "json",
    						data : email,
    						statusCode : {
    							200 : function() {
    								$('#loading').modal('hide');
    								toastr.info(getMessage("M0001"));
    							},
    							404 : function() {
    								$('#loading').modal('hide');
    								toastr.info(getMessage("E0010"));
    							},
    							400 : function() {
    								$('#loading').modal('hide');
    								toastr.error(getMessage("E0003"));
    							}
    						}
    	 				});
                	}else{
                		toastr.success(getMessage("S0002"));
                	}
                	
                	window.setTimeout(function () { 
                    	updateTable();
                    	closeWindow();
                    	document.getElementById("CmdAddEditOk").disabled = false;
                	 	document.getElementById("CmdAddEditCancel").disabled = false;
                    }, 1000);
                	
                } else {
                	document.getElementById("CmdAddEditOk").disabled = false;
            	 	document.getElementById("CmdAddEditCancel").disabled = false;
                	toastr.error(getMessage("E0006"));
                }
            },
            404: function () {
           		document.getElementById("CmdAddEditOk").disabled = false;
        	 	document.getElementById("CmdAddEditCancel").disabled = false;
           		toastr.success(getMessage("S0002"));
            },
            409: function () {
           		document.getElementById("CmdAddEditOk").disabled = false;
        	 	document.getElementById("CmdAddEditCancel").disabled = false;
           		toastr.error(getMessage("E0006"));
            }
        }
    }); 
}

function cmdDelete_OnClick(){
    alertify.confirm("<span class='glyphicon glyphicon-trash'></span> " + getMessage("P0001"), function (e) {
    if (e) {
    	
    	var reservation = new Object();
     	reservation.RESV_ID = currentLookup;
     	
     	var data = JSON.stringify(reservation);
        $.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/api/reservation/sdelete',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: data,
            statusCode: {
                200: function (result) {
                	toastr.success(getMessage("S0001"));
                    
                    var emailObject = new Object();
	    			emailObject.EMAIL_EMAIL = loggedInCustomerEmail;
	    			emailObject.EMAIL_SUBJECT =  cboCustomer.selectedValue.customerName + " Canceled Reservation";
	    			emailObject.EMAIL_MESSAGE = "You have cancelled this reservation:\n\nReservation Date: " + cboAECalenderDate.selectedValue.dayCode +
	    				"\nPart No.: " + parseInt(cboAEPartsNo.selectedValue.id) + 
	    				"\nTime Start: "+ cboAEStartTime.selectedValue +
	    				"\nTime End: "+  cboAEEndTime.selectedValue +
	    				"\nNote: " + document.getElementById('AE_RESV_NOTES').value +
	    				"\n\nPlease visit the link: http://magentatest.cloudapp.net/webreservation/software/";

	    			emailObject.EMAIL_RECEIVER_ID = loggedInCustomerId;
	    			emailObject.EMAIL_PURPOSE = "Delete Reservation";
	    			
	    			hasDeleted = true;
	    			deleteDate = result.RESV_CACT_ID;
	    			deletePart = result.RESV_UNIT_NO;
	    			deleteTime = result.RESV_START_TIME_ID;
	
	    			var data = JSON.stringify(emailObject);
	    			$.ajax({
						type : "POST",
						url : '${pageContext.request.contextPath}/api/email/send',
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						data : data,
						statusCode : {
							200 : function() {
								toastr.info(getMessage("M0001"));
							},
							404 : function() {
								$('#loading').modal('hide');
								toastr.info(getMessage("E0010"));
							},
							400 : function() {
								$('#loading').modal('hide');
								toastr.error(getMessage("E0003"));		
							}
						}
	 				});
                    
                    window.setTimeout(function () { 
                    	updateTable();
                    	closeWindow();
                    }, 1000);
                },
                404: function () {
                	toastr.error(getMessage("E0003"));	
                },
                400: function () {
                	toastr.error(getMessage("E0003"));	
                }
            }
        });
    	}
    });
}

function cmdAddReservation_OnClick() {
	
	document.getElementById("CmdAddEditOk").disabled = false;
 	document.getElementById("CmdAddEditCancel").disabled = false;
	if(isScheduleUpdated){
		var dates = calendarActivities.slice(startDateIndex, endDateIndex + 1);
	    var newDates = new Array();
	    var currentDate = new Date(new Date().toJSON().slice(0,10));

	    for(a = 0; a < dates.length; a++){
	    	mydate = new Date(dates[a].dayCode);
		    
	    	if(mydate >= currentDate){
		    	newDates.push(dates[a]);
		    }
	    }
	    
	    if(newDates.length != 0){
		    $('#ReservationAddEdit').modal({
		        show: true,
		        backdrop: false
		    });
	
		    var customerTimeList = new Array();
		    for (var i = 0; i < customerTimeFlat.length; i++) {
		    	customerTimeList.push(customerTimeFlat[i].time);
		    }
		    
		    
		    document.getElementById("AE_RESV_ID").value = 0;
		    document.getElementById("AE_MEBR_ID").value = loggedInCustomerId;
		    document.getElementById("AE_CUST_ID").value = cboCustomer.selectedValue.id;
		    document.getElementById("AE_CUST_NAME").value = cboCustomer.selectedValue.customerName;
		    
		    cboAECalenderDate.dispose();
		    cboAECalenderDate = new wijmo.input.ComboBox('#AE_CALENDAR_DATE', {
		        itemsSource: newDates,
		        displayMemberPath:"dayCode",
		        isEditable: false
		    });
		    cboAEPartsNo.dispose();
		    cboAEPartsNo = new wijmo.input.ComboBox('#AE_PARTS', {
		        itemsSource: partNames,
		        isEditable: false,
		        displayMemberPath: "name"
		    });
		    
		    document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[0].id;
		    cboAEStartTime.dispose();
		    cboAEStartTime = new wijmo.input.ComboBox('#AE_START_TIME', {
		        itemsSource: customerTimeList,
		        isEditable: false,
		        onSelectedIndexChanged: function () {
		        	document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[cboAEStartTime.selectedIndex].id;
		        	if(this.selectedIndex > cboAEEndTime.selectedIndex){
		        		cboAEEndTime.selectedIndex = this.selectedIndex;
		        		document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[cboAEEndTime.selectedIndex].id;
		        	}
		        }
		    });	
		    
		    document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[0].id;
		    cboAEEndTime.dispose();
		    cboAEEndTime = new wijmo.input.ComboBox('#AE_END_TIME', {
		        itemsSource: customerTimeList,
		        isEditable: false,
		        onSelectedIndexChanged: function () {
		        	document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[cboAEEndTime.selectedIndex].id;
		        	if(this.selectedIndex < cboAEStartTime.selectedIndex){
		        		cboAEStartTime.selectedIndex = this.selectedIndex;
		        		document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[cboAEStartTime.selectedIndex].id;
		        	}
		        }
		    });
		    
		    document.getElementById("AE_RESV_NOTES").disabled = false;
	    	document.getElementById("CmdDelete").style.visibility = "hidden";
	    	document.getElementById("CmdAddEditOk").style.visibility = "visible";
		}else{
			/* alertify.alert("Update Schedules first.") */
			toastr.error(getMessage("E0005"));
		}
		    
	}else{
		alertify.alert("Update Schedules first.");
	}
}

function cmdEditReservation_OnClick(customerId, isUser) {
	var reservation = reservationsList[customerId];
	
	document.getElementById("CmdAddEditOk").disabled = false;
 	document.getElementById("CmdAddEditCancel").disabled = false;
 	
 	var onDate = false;
 	var regDate;
 	
	for(a = 0; a < calendarActivities.slice(startDateIndex, endDateIndex + 1).length; a++)
	{
		if(calendarActivities.slice(startDateIndex, endDateIndex + 1)[a].id == reservation.RESV_CACT_ID){
			regDate = new Date(calendarActivities.slice(startDateIndex, endDateIndex + 1)[a].dayCode);
		}
	}
	
	var currentDate = new Date(new Date().toJSON().slice(0,10));
	
 	if(regDate >= currentDate){
 		onDate = true;
 	}
	
	if(isScheduleUpdated){
	    $('#ReservationAddEdit').modal({
	        show: true,
	        backdrop: false
	    });

	    var customerTimeList = new Array();
	    for (var i = 0; i < customerTimeFlat.length; i++) {
	    	customerTimeList.push(customerTimeFlat[i].time);
	    }
	    
	    currentLookup = reservation.RESV_ID;
	    
	    document.getElementById("AE_RESV_ID").value = reservation.RESV_ID;
	    document.getElementById("AE_MEBR_ID").value = reservation.RESV_MEBR_ID;
	    document.getElementById("AE_CUST_ID").value = cboCustomer.selectedValue.id;
	    document.getElementById("AE_CUST_NAME").value = cboCustomer.selectedValue.customerName;
	    
	    
	    if(onDate){
		    var dates = calendarActivities.slice(startDateIndex, endDateIndex + 1);
		    var newDates = new Array();
		    var currentDate = new Date(new Date().toJSON().slice(0,10));
		    
		    for(a = 0; a < dates.length; a++){
		    	mydate = new Date(dates[a].dayCode);
			    
		    	if(mydate >= currentDate){
			    	newDates.push(dates[a]);
			    }
		    }
		    
		    var calendarDateIndex = 0;
			//INDEX OF DOES NOT WORK, USING FOR LOOPS FOR NOW (DAFUQ)
			for(a = 0; a < newDates.length; a++)
			{
				if(newDates[a].id == reservation.RESV_CACT_ID){
					calendarDateIndex = a;
				}
			}
			
		    cboAECalenderDate.dispose();
		    cboAECalenderDate = new wijmo.input.ComboBox('#AE_CALENDAR_DATE', {
		        itemsSource: newDates,
		        disabled: !isUser,
		        displayMemberPath:"dayCode",
		        selectedIndex: calendarDateIndex
		    });
	    } else {
	    	var calendarDateIndex = 0;
			//INDEX OF DOES NOT WORK, USING FOR LOOPS FOR NOW (DAFUQ)
			for(a = 0; a < calendarActivities.slice(startDateIndex, endDateIndex + 1).length; a++)
			{
				if(calendarActivities.slice(startDateIndex, endDateIndex + 1)[a].id == reservation.RESV_CACT_ID){
					calendarDateIndex = a;
				}
			}
			
		    cboAECalenderDate.dispose();
		    cboAECalenderDate = new wijmo.input.ComboBox('#AE_CALENDAR_DATE', {
		        itemsSource: calendarActivities.slice(startDateIndex, endDateIndex + 1),
		        disabled: true,
		        displayMemberPath:"dayCode",
		        selectedIndex: calendarDateIndex
		    });
	    }
	    
	    cboAEPartsNo.dispose();
	    cboAEPartsNo = new wijmo.input.ComboBox('#AE_PARTS', {
	        itemsSource: partNames,
	        displayMemberPath: "name",
	        disabled: !(isUser && onDate),
	        selectedIndex: reservation.RESV_PARTS_NO - 1
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
	    cboAEStartTime = new wijmo.input.ComboBox('#AE_START_TIME', {
	        itemsSource: customerTimeList,
	        disabled: !(isUser && onDate),
	        selectedIndex: startTimeIndex,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[cboAEStartTime.selectedIndex].id;
	        	if(this.selectedIndex > cboAEEndTime.selectedIndex){
	        		cboAEEndTime.selectedIndex = this.selectedIndex;
	        		document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[cboAEEndTime.selectedIndex].id;
	        	}
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
	    cboAEEndTime = new wijmo.input.ComboBox('#AE_END_TIME', {
	        itemsSource: customerTimeList,
	        disabled: !(isUser && onDate),
	        selectedIndex: endTimeIndex,
	        onSelectedIndexChanged: function () {
	        	document.getElementById("AE_END_TIME_ID").value = customerTimeFlat[cboAEEndTime.selectedIndex].id;
	        	if(this.selectedIndex < cboAEStartTime.selectedIndex){
	        		cboAEStartTime.selectedIndex = this.selectedIndex;
	        		document.getElementById("AE_START_TIME_ID").value = customerTimeFlat[cboAEStartTime.selectedIndex].id;
	        	}
	        }
	    });
	    
	    document.getElementById("AE_RESV_NOTES").value = reservation.RESV_NOTE;
	    document.getElementById("AE_RESV_NOTES").disabled = !(isUser && onDate);
	    
	    if(isUser && onDate){
	    	document.getElementById("CmdDelete").style.visibility = "visible";
	    	document.getElementById("CmdAddEditOk").style.visibility = "visible";
	    }else{
	    	document.getElementById("CmdDelete").style.visibility = "hidden";
	    	document.getElementById("CmdAddEditOk").style.visibility = "hidden";
	    }
	    
	}else{
		alertify.alert("Update Schedules first.")
	}
}

//=================
// Getting the Data
//=================   
function getCustomers() {
    document.getElementById('loadingCustomer').innerHTML = '<i class="fa fa-spinner fa-spin"></i> Loading...';
	$('#loadingCustomer').show();
	$('#cboCustomer').hide();
	
	document.getElementById('loadingCalendarActivityStart').innerHTML = '<i class="fa fa-spinner fa-spin"></i> Loading...';
	$('#loadingCalendarActivityStart').show();
	$('#cboCalendarActivityStart').hide();
    
	document.getElementById('loadingCalendarActivityEnd').innerHTML = '<i class="fa fa-spinner fa-spin"></i> Loading...';
	$('#loadingCalendarActivityEnd').show();
	$('#cboCalendarActivityEnd').hide();
	
	customerList = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/customer/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        success: function (results) {
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	if(results[i]["CUST_CUSTOMER_NO"] != "000000"){
	                	customerList.push({
	                        id: results[i]["CUST_ID"],
	                        customerNumber: results[i]["CUST_CUSTOMER_NO"],
	                        customerName: results[i]["CUST_NAME"]
	                    });
                	}
                }
                setTimeout(function() {
                	createCboCustomer(customerList);
   	      		}, 1000);      
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );
}

function getCalendarActivities(customerId, customerNumber) {
    calendarActivities = new wijmo.collections.ObservableArray();
    
    $.ajax({
            url: '${pageContext.request.contextPath}/api/calendarActivity/listByCustomerWithRestrictions',
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
		                     date: result.CACT_CLDR_FK.CLDR_DATE,
		                });
		            });
	                
	                $.ajax({
	                    url: '${pageContext.request.contextPath}/api/code/listByKind',
	                    cache: false,
	                    type: 'GET',
	                    contentType: 'application/json; charset=utf-8',
	                    data: {"kind" : "RESV"},
	                    success: function (results) {
	                    	partNames = new Array();
	
	            	        results.forEach(function (part){
	            	        	code = part["CODE_CODE_VALUE"].split("-");
	            	        	if(code[0] == customerNumber)
	            	        		partNames.push({
	            	        			id: code[1],
	            	        			name: part["CODE_TEXT"]
	            	        		});
	            	    	});
	            	        createCboCalendarActivity(calendarActivities);
	                    }
	                }).fail(
	                    function (xhr, textStatus, err) {
	                        alert(err);
	                    }
	                );
               
                }
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
	$('#loadingCustomer').hide();
	$('#cboCustomer').show();
	
    cboCustomer.dispose();
	cboCustomer = new wijmo.input.ComboBox('#cboCustomer', {
        itemsSource: customers,
        displayMemberPath:"customerName",
        isEditable: false,
        onSelectedIndexChanged: function () {
            getCalendarActivities(this.selectedValue.id, this.selectedValue.customerNumber);
            isScheduleUpdated = false;
        }
    });

    getCalendarActivities(customers[0].id, customers[0].customerNumber);
	
}

function createCboCalendarActivity(calendarActivities) {
	calendarActivityCollection = new wijmo.collections.CollectionView(calendarActivities);
    
    calendarActivityList = new Array();
    for (var i = 0; i < calendarActivityCollection.items.length; i++) {
    	calendarActivityList.push(calendarActivityCollection.items[i].dayCode);
    }
    
    var tod = new Date(new Date().toJSON().slice(0,10));
    var tom = new Date(tod.getTime() + 86399999);
    
    var currentDateIndex;
    var advancedDateIndex;
    
    var count = calendarActivities.length;
    
    for(i = 0; i < count; i++){
    	if(calendarActivities[i].date >= tod.getTime() && calendarActivities[i].date <= tom.getTime()){
    		currentDateIndex = i;
    		advancedDateIndex = currentDateIndex + 2;
    		if(advancedDateIndex >= count){
    			advancedDateIndex = count - 1;
    		}
    		break;
    	}
    	
    	if(i == count - 1){
    		currentDateIndex = count - 1;
    		advancedDateIndex = currentDateIndex;
    	}
    } 
    
    $('#loadingCalendarActivityStart').hide();
	$('#cboCalendarActivityStart').show();   
    cboCalendarActivityStart.dispose();
    cboCalendarActivityStart = new wijmo.input.ComboBox('#cboCalendarActivityStart', {
        itemsSource: calendarActivityList,
        isEditable: false,
        selectedIndex: currentDateIndex,
        onSelectedIndexChanged: function () {
        	if(this.selectedIndex > cboCalendarActivityEnd.selectedIndex){
        		cboCalendarActivityEnd.selectedIndex = this.selectedIndex;
        	}
        }
    });		
    
	$('#loadingCalendarActivityEnd').hide();
	$('#cboCalendarActivityEnd').show();
    cboCalendarActivityEnd.dispose();
    cboCalendarActivityEnd = new wijmo.input.ComboBox('#cboCalendarActivityEnd', {
        itemsSource: calendarActivityList,
        isEditable: false,
        selectedIndex: advancedDateIndex,
        onSelectedIndexChanged: function () {
        	if(this.selectedIndex < cboCalendarActivityStart.selectedIndex){
        		cboCalendarActivityStart.selectedIndex = this.selectedIndex;
        	}
        }
    });	    
    
    
    var selectedDates = "";
    for(i = cboCalendarActivityStart.selectedIndex; i <= cboCalendarActivityEnd.selectedIndex; i++){
    	selectedDates = selectedDates + calendarActivityCollection.items[i].id + ",";
    }
    
    $.ajax({
        url: '${pageContext.request.contextPath}/api/reservation/listByDates',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {"customerId":cboCustomer.selectedValue.id,
        	   "calendarActivityIds": selectedDates},
        success: function (results) {
        	//GET ALL RESERVATIONS
        	results.forEach(function (reservation){
        		reservationsList.push({
        			RESV_ID: reservation.RESV_ID,
        			RESV_CUST_ID: reservation.RESV_CUST_ID,
        			RESV_CACT_ID: reservation.RESV_CACT_ID,
        			RESV_MEBR_ID: reservation.RESV_MEBR_FK["MEBR_ID"],
        			RESV_MEBR_EMAIL: reservation.RESV_MEBR_FK["MEBR_EMAIL_ADDRESS"],
        			RESV_UNIT_NO: reservation.RESV_UNIT_NO,
        			RESV_PARTS_NO: reservation.RESV_PARTS_NO,
        			RESV_START_TIME_ID: reservation.RESV_START_TIME_ID,
        			RESV_END_TIME_ID: reservation.RESV_END_TIME_ID,
        			RESV_NOTE: reservation.RESV_NOTE,
        			RESV_ISDELETED: reservation.ISDELETED,
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
        	loggedInCustomerEmail = data[0]["mebr_EMAIL_ADDRESS"]
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
