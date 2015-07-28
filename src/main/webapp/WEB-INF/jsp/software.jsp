<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>Software</title>

<!-- Message List -->
<div class="container"> 
<section>	
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <select id="ScheduleMonth" class="form-control calendar-input-custom">
                    <option value="0">January</option>
                    <option value="1">February</option>
                    <option value="2">March</option>
                    <option value="3">April</option>
                    <option value="4">May</option>
                    <option value="5">June</option>
                    <option value="6">July</option>
                    <option value="7">August</option>
                    <option value="8">September</option>
                    <option value="9">October</option>
                    <option value="10">November</option>
                    <option value="11">December</option>
                </select>
            </div>
            <div class="col-lg-2">
                <select id="ScheduleYear" class="form-control calendar-input-custom">
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2016">2017</option>
                    <option value="2016">2018</option>
                    <option value="2016">2019</option>
                </select>
            </div>
            <div class="col-lg-2">
                <button id="CmdGetSchedule" type="submit" class="btn btn-primary calendar-btn-custom btn-block pull-right" onclick="CmdGetSchedule_OnClick()">Get Schedule</button>
            </div>
            <div class="col-lg-6">
	        	<button id="cmdAddMessage" type="submit" class="btn btn-primary calendar-btn-custom pull-right" onclick="cmdScheduleAdd_OnClick()">Add</button>
		        <button id="cmdAddMessage" type="submit" class="btn btn-primary calendar-btn-custom pull-right" onclick="cmdScheduleAdd_OnClick()">Create Schedule</button>
	    	</div>
        </div>
        <div class="row">
            <p class="lead">
             	<div class="col-lg-12">
                	<div id="CalendarGrid" class="grid calendar-grid-custom"></div>
                </div>
            </p>
        </div>        
    </div>
</section>
</div>


<!-- Loading -->
<div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="Loading..." aria-hidden="true">
    <div class="modal-dialog" style="width: 220px;">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Loading...</h4>
            </div>
            <div class="modal-body">
                <img src="<c:url value='/img/progress_bar.gif' />"></img>
            </div>
        </div>
    </div>
</div>

<!-- Message Edit Detail -->
<div class="modal fade" id="ScheduleEdit">
    <div class="modal-dialog">
        <div class="modal-content modal-custom">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Schedule Edit</h4>
            </div>
            <div class="modal-body">
                <form id="messageForm" class="modal-form-custom">
                    <dl class="dl-horizontal">
                            modal body goes here...
                    </dl>
                </form>
            </div>
            <div class="modal-footer modal-footer-custom">
                <button type="button" class="btn btn-primary btn-form-custom btn-form-custom-2"  id="cmdMessageEditOk" onclick="cmdScheduleAdd_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger btn-form-custom btn-form-custom-2" id="cmdMessageEditCancel" onclick="cmdScheduleEditCancel_OnClick()">
                    Cancel
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

//===========================
//Calendar - Global Variables
//===========================	
var CalendarData;
var CalendarGrid;
var ScheduleData = [];
var ScheduleURL = "";

// ==================
// Add Button Clicked
// ==================   
function cmdScheduleAdd_OnClick() {
    $('#ScheduleEdit').modal({
        show: true,
        backdrop: false
    });   
}

// =================================
// Edit Detail Cancel Button Clicked
// =================================     
function cmdScheduleEditCancel_OnClick() {
	$('#ScheduleEdit').modal('hide');    	
}

//=================================
// Getting the Calendar Date
//=================================   
function GetCalendarDate(Month, Year) {
    var Sun = "", Mon = "", Tue = "", Wed = "", Thu = "", Fri = "", Sat = "";
    var data = new wijmo.collections.ObservableArray();

    // Get the start day, e.g., Monday=1, Tuesday=2, etc.
    var firstDay = new Date(Year, Month, 1);
    var startingDay = firstDay.getDay();

    // Get the month length
    var cal_days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var monthLength = cal_days_in_month[Month];
    if (Month == 1) { //FEB
        if ((Year % 4 == 0 && Year % 100 != 0) || Year % 400 == 0) {
            monthLength = 29;
        }
    }

    var day = 1;
    for (var i = 0; i < 9; i++) {
        for (var j = 0; j <= 6; j++) {
            if ((day <= monthLength) && (i > 0 || j >= startingDay)) {
                var dayDate = Year.toString() + "-" + (Month + 1).toString() + "-" + day.toString();
                switch (j) {
                    case 0:
                        Sun = day.toString() + "<br />" + GetScheduleData(dayDate);   
                        break;
                    case 1:
                        Mon = day.toString() + "<br />" + GetScheduleData(dayDate);
                        break;
                    case 2:
                        Tue = day.toString() + "<br />" + GetScheduleData(dayDate);
                        break;
                    case 3:
                        Wed = day.toString() + "<br />" + GetScheduleData(dayDate);
                        break;
                    case 4:
                        Thu = day.toString() + "<br />" + GetScheduleData(dayDate);
                        break;
                    case 5:
                        Fri = day.toString() + "<br />" + GetScheduleData(dayDate);
                        break;
                    case 6:
                        Sat = day.toString() + "<br />" + GetScheduleData(dayDate);
                        break;
                }
                day++;
            }
        }

        if (day > monthLength) {
            data.push({
                Sunday: Sun,
                Monday: Mon,
                Tuesday: Tue,
                Wednesday: Wed,
                Thursday: Thu,
                Friday: Fri,
                Saturday: Sat
            });
            break;
            
        } else {
            data.push({
                Sunday: Sun,
                Monday: Mon,
                Tuesday: Tue,
                Wednesday: Wed,
                Thursday: Thu,
                Friday: Fri,
                Saturday: Sat
            });
            Sun = ""; Mon = ""; Tue = ""; Wed = ""; Thu = ""; Fri = ""; Sat = "";
        }
    }
    return data;
}

//=================================
// Calendar Grid
//=================================   
function MakeCalendarGrid(Month, Year) {
    CalendarData = new wijmo.collections.CollectionView(GetCalendarDate(Month, Year));
    CalendarData.pageSize = 6;

    CalendarGrid.dispose();
    CalendarGrid = new wijmo.grid.FlexGrid('#CalendarGrid');
    CalendarGrid.initialize({
        columns: [
                    {
                        "header": "Sunday",
                        "binding": "Sunday",
                        "width": "7*",
                        "allowSorting": false,
                        "isContentHtml": true,
                        "wordWrap": true
                    },
                    {
                        "header": "Monday",
                        "binding": "Monday",
                        "width": "7*",
                        "allowSorting": false,
                        "isContentHtml": true,
                        "wordWrap": true
                    },
                    {
                        "header": "Tuesday",
                        "binding": "Tuesday",
                        "width": "7*",
                        "allowSorting": false,
                        "isContentHtml": true,
                        "wordWrap": true
                    },
                    {
                        "header": "Wednesday",
                        "binding": "Wednesday",
                        "width": "7*",
                        "allowSorting": false,
                        "isContentHtml": true,
                        "wordWrap": true
                    },
                    {
                        "header": "Thursday",
                        "binding": "Thursday",
                        "width": "7*",
                        "allowSorting": false,
                        "isContentHtml": true
                    },
                    {
                        "header": "Friday",
                        "binding": "Friday",
                        "width": "7*",
                        "allowSorting": false,
                        "isContentHtml": true,
                        "wordWrap": true
                    },
                    {
                        "header": "Saturday",
                        "binding": "Saturday",
                        "width": "7*",
                        "allowSorting": false,
                        "isContentHtml": true,
                        "wordWrap": true
                    }
        ],
        autoGenerateColumns: false,
        itemsSource: CalendarData,
        isReadOnly: true,
        selectionMode: wijmo.grid.SelectionMode.Cell
    });
    CalendarGrid.trackChanges = true;
    CalendarGrid.itemFormatter = function (panel, r, c, cell) {
        if (panel.cellType == wijmo.grid.CellType.Cell) {
            var flex = panel.grid;
            flex.rows[r].height = 80;
        }
    };
}

//==============
// Schedule Data 
//============== 
function GetScheduleData(dayDate) {
    var schedules = "";
    for (var i = 0; i < ScheduleData.length; i++) {
        var webinarDate = new Date(ScheduleData[i]["EventDate"]);
        if (parseDate(dayDate).equals(webinarDate) == true) {
            if (ScheduleData[i]["IsRestricted"] == true) {
                schedules = schedules + "<a href='#' onclick='OpenWeb99Link(\"" + ScheduleData[i]["URL"] + "\");return false;'>" + ScheduleData[i]["EventDescription"] + "</a><br />";
            } else {
                schedules = schedules + "<a href='" + ScheduleData[i]["URL"] + "'>" + ScheduleData[i]["EventDescription"] + "</a><br />";
            } 
        }
    }
    return schedules;
}

/* 
function OpenWeb99Link(URL) {
    var username = '';
    if (username.length > 0) {
        ScheduleURL = URL;
        userCheck(username);
    } else {
        window.location.href = "/account/login";
    } 
} */

/* function parseDate(input) {
    var parts = input.split('-');
    return new Date(parts[0], parts[1] - 1, parts[2]);
} */


//====================
// Get Schedule Button 
//==================== 
function CmdGetSchedule_OnClick() {
    var m = parseInt($("#ScheduleMonth").val());
    var y = parseInt($("#ScheduleYear").val());

    MakeCalendarGrid(m, y);
}

/* function userEdit(username) {
    $('#loading').modal({
        show: true,
        backdrop: false
    });

    $.ajax({
        url: '/api/GetUser/' + username,
        type: 'GET',
        data: {},
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (Results) {
            $('#loading').modal('hide');

            $('#UserEdit').modal({
                show: true,
                backdrop: false
            });

            if (Results.length > 0) {
                document.getElementById('UserEdit_Id').value = Results[0].Id !== null && typeof (Results[0].Id) != 'undefined' ? wijmo.Globalize.format(Results[0].Id) : '';
                document.getElementById('UserEdit_UserName').value = Results[0].UserName ? Results[0].UserName : '';
                document.getElementById('UserEdit_FirstName').value = Results[0].FirstName ? Results[0].FirstName : '';
                document.getElementById('UserEdit_LastName').value = Results[0].LastName ? Results[0].LastName : '';
                document.getElementById('UserEdit_EmailAddress').value = Results[0].EmailAddress ? Results[0].EmailAddress : '';
                document.getElementById('UserEdit_PhoneNumber').value = Results[0].PhoneNumber ? Results[0].PhoneNumber : '';
            }
        }

    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
            $('#UserEdit').modal('hide');
        });
} */

/* 
function userEditOk() {
    if (confirm("Save Information?") == true) {
        var User = new Object();

        User.Id = document.getElementById('UserEdit_Id').value;
        User.UserName = document.getElementById('UserEdit_UserName').value;
        User.FirstName = document.getElementById('UserEdit_FirstName').value;
        User.LastName = document.getElementById('UserEdit_LastName').value;
        User.EmailAddress = document.getElementById('UserEdit_EmailAddress').value;
        User.PhoneNumber = document.getElementById('UserEdit_PhoneNumber').value;

        var data = JSON.stringify(User);

        $.ajax({
            type: "PUT",
            url: "/api/UpdateUser/" + User.Id,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: data,
            statusCode: {
                200: function () {
                    var username = '';
                    $('#UserEdit').modal('hide');
                    userCheck(username);
                    window.location.href = ScheduleURL;
                },
                404: function () {
                    alert("Not found");
                },
                400: function () {
                    alert("Bad request");
                }
            }
        });
        $('#UserEdit').modal('hide');
    }
} */

/* function userEditCancel() {
    $('#UserEdit').modal('hide');
}
 */
 
 
function userCheck(username) {
    $.ajax({
        url: '/api/GetUser/' + username,
        type: 'GET',
        data: {},
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (Results) {
            if (Results.length > 0) {
                if (Results[0].FirstName == "NA" || Results[0].FirstName == "" ||
                    Results[0].LastName == "NA" || Results[0].LastName == "" ||
                    Results[0].EmailAddress == "NA" || Results[0].EmailAddress == "" ||
                    Results[0].PhoneNumber == "NA" || Results[0].PhoneNumber == "") {
                    alert("To remove this prompt, you must fill in all user information.");
                    userEdit(username);
                } else {
                    window.location.href = ScheduleURL;
                }
            }
        }

    });
}

$(document).ready(function () {
    CalendarGrid = new wijmo.grid.FlexGrid('#CalendarGrid');

    var d = new Date();
    var m = d.getMonth();
    var y = d.getFullYear();

    $("#ScheduleMonth").val(m);
    $("#ScheduleYear").val(y);

    $.ajax({
        url: '/api/LatestEvent',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (Results) {
            while (ScheduleData.length > 0) ScheduleData.pop();
            ScheduleData = Results;
            MakeCalendarGrid(m, y);
        }
    }).fail(
        function (xhr, textStatus, err) {  }
    );
});


</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>