<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Message</title>

<!-- Message List -->
<div class="container"> 
<section id="messageList">
	<div class="row">
	    <div class="col-lg-12">
	        <h4>Message List</h4>
	    </div>
	</div>
	<div class="row">
	    <div class="col-lg-4">
	        <div class="input-group">
	            <span class="input-group-btn">
	                <button class="btn btn-default border-custom" type="button" readonly>
	                <i class="fa fa-search"></i>
	                </button>
	            </span>
	            <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search Message Code">
	        </div>
	    </div>
	    <div class="col-lg-8">
	        <button id="cmdAddMessage" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdMessageAdd_OnClick()">Add</button>
	    </div>
	</div>
	<br />
	<div class="row">
	    <div class="col-lg-12">
	        <div id="messageGrid" class="grid border-custom"></div>
	    </div>
	</div>
	
	<br />
	
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


<br/>
<br/>
<br/>



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

<!-- Message Edit Detail -->
<div class="modal fade" id="MessageEdit">
    <div class="modal-dialog">
        <div class="modal-content border-custom">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Message Edit</h4>
            </div>
            <div class="modal-body">
                <form id="messageForm">
                    <dl class="dl-horizontal">
                        <dt>Code: </dt>
                        <dd>
                            <input id="EDIT_MESG_ID" type="hidden" />
                            <input class="form-control border-custom" id="EDIT_MESG_CODE" name="EDIT_MESG_CODE" type="text" required />
                        </dd>
                        <dt>Level: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_MESG_LEVEL" name="EDIT_MESG_LEVEL" type="text" required />
                        </dd>
                        <dt>Note: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_MESG_NOTE" name="EDIT_MESG_NOTE" type="text" required />
                        </dd>                        
                        <dt>Start Date: </dt>
                        <dd>
							<div id="EDIT_MESG_START_DATE" class="form-control border-custom"></div>
                            <input id="EDIT_MESG_START_DATE_DATA" type="hidden" required/>  
                        </dd>
                        <dt>End Date: </dt>
                        <dd>
							<div id="EDIT_MESG_END_DATE" class="form-control border-custom"></div>
                            <input id="EDIT_MESG_END_DATE_DATA" type="hidden" required/>                            
                        </dd>                        
                    </dl>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary border-custom"  id="cmdMessageEditOk" onclick="cmdMessageEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger border-custom" id="cmdMessageEditCancel" onclick="cmdMessageEditCancel_OnClick()">
                    Cancel
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
// ================
// Global variables
// ================
var messages;
var messageGrid;

var messageStartDate;
var messageEditDate;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

// ===================
// Edit Button Clicked
// ===================
function cmdMessageEdit_OnClick() {
    messages.editItem(messages.currentItem);

    $('#MessageEdit').modal({
        show: true,
        backdrop: false
    });

    var message = messages.currentEditItem;
    
    document.getElementById('EDIT_MESG_ID').value = message.MESG_ID !== null && typeof (message.MESG_ID) != 'undefined' ? wijmo.Globalize.format(message.MESG_ID) : 0;
    document.getElementById('EDIT_MESG_CODE').value = message.MESG_CODE ? message.MESG_CODE : '';
    document.getElementById('EDIT_MESG_LEVEL').value = message.MESG_LEVEL ? message.MESG_LEVEL : '';
    document.getElementById('EDIT_MESG_NOTE').value = message.MESG_NOTE ? message.MESG_NOTE : '';
    document.getElementById('EDIT_MESG_START_DATE_DATA').value = message.MESG_START_DATE ? message.MESG_START_DATE : '';
    document.getElementById('EDIT_MESG_END_DATE_DATA').value = message.MESG_END_DATE ? message.MESG_END_DATE : '';
     
    var splitStartDate = message.MESG_START_DATE.split("-");
    var splitEndDate = message.MESG_END_DATE.split("-");
    
    messageStartDate.dispose();
    messageStartDate = new wijmo.input.InputDate('#EDIT_MESG_START_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date(splitStartDate[0], splitStartDate[1] - 1, splitStartDate[2]),
        onValueChanged: function () {
            document.getElementById('EDIT_MESG_START_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });    
    messageEndDate.dispose();
    messageEndDate = new wijmo.input.InputDate('#EDIT_MESG_END_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date(splitEndDate[0], splitEndDate[1] - 1, splitEndDate[2]),
        onValueChanged: function () {
            document.getElementById('EDIT_MESG_END_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });        
}

// ==================
// Add Button Clicked
// ==================   
function cmdMessageAdd_OnClick() {
    $('#MessageEdit').modal({
        show: true,
        backdrop: false
    });
    
    var currentDate = new Date();
    
    document.getElementById('EDIT_MESG_ID').value = 0;
    document.getElementById('EDIT_MESG_CODE').value = '';
    document.getElementById('EDIT_MESG_LEVEL').value = '';
    document.getElementById('EDIT_MESG_NOTE').value = '';
    document.getElementById('EDIT_MESG_START_DATE_DATA').value = currentDate.toString("yyyy-MM-dd");
    document.getElementById('EDIT_MESG_END_DATE_DATA').value = currentDate.toString("yyyy-MM-dd");  
    
    messageStartDate.dispose();
    messageStartDate = new wijmo.input.InputDate('#EDIT_MESG_START_DATE', {
        format: 'MM/dd/yyyy',
        value: currentDate,
        onValueChanged: function () {
            document.getElementById('EDIT_MESG_START_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });    
    messageEndDate.dispose();
    messageEndDate = new wijmo.input.InputDate('#EDIT_MESG_END_DATE', {
        format: 'MM/dd/yyyy',
        value: currentDate,
        onValueChanged: function () {
            document.getElementById('EDIT_MESG_END_DATE_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    });         
}

// =====================
// Delete Button Clicked
// =====================   
function cmdMessageDelete_OnClick() {
    messages.editItem(messages.currentItem);
    
    var id = messages.currentEditItem.MESG_ID;
    var messageCode = messages.currentEditItem.MESG_CODE;

 	// confirm dialog
    alertify.confirm("Are you sure you want to delete Message Code " + messageCode + "? <span class='glyphicon glyphicon-trash'></span>", function (e) {
        if (e) {
        	$.ajax({
                type: "DELETE",
                url: '${pageContext.request.contextPath}/api/message/delete/' + id,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                statusCode: {
                    200: function () {
                        log.success('Successfully Deleted.');
                        window.setTimeout(function () { location.reload() }, 1000);
                    },
                    404: function () {
                        log.error("Not found.");
                    },
                    400: function () {
                        log.error("Bad request.");
                    }
                }
            });
        }
    });
}

// =================================
// Edit Detail Cancel Button Clicked
// =================================     
function cmdMessageEditCancel_OnClick() {
	$('#MessageEdit').modal('hide');    	
}

// =============================
// Edit Detail OK Button Clicked
// =============================     
function cmdMessageEditOk_OnClick() {
	var messageObject = new Object();

	messageObject.MESG_ID = parseInt(document.getElementById('EDIT_MESG_ID').value);
	messageObject.MESG_CODE = document.getElementById('EDIT_MESG_CODE').value;
	messageObject.MESG_LEVEL = document.getElementById('EDIT_MESG_LEVEL').value;
	messageObject.MESG_NOTE = document.getElementById('EDIT_MESG_NOTE').value;
		 
	var splitStartDate = document.getElementById('EDIT_MESG_START_DATE_DATA').value.split("-");
	var splitEndDate = document.getElementById('EDIT_MESG_END_DATE_DATA').value.split("-");
	
	messageObject.MESG_START_DATE = new Date(splitStartDate[0], splitStartDate[1] - 1, splitStartDate[2]);
	messageObject.MESG_END_DATE = new Date(splitEndDate[0], splitEndDate[1] - 1, splitEndDate[2]);
	
	var data = JSON.stringify(messageObject);
	
	$.ajax({
	    type: "POST",
	    url: '${pageContext.request.contextPath}/api/message/update',
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    data: data,
	    success: function (data) {
	        if (data.MESG_ID > 0) {
	            toastr.success('Successfully updated.');
	            window.setTimeout(function () { location.reload() }, 1000);
	        } else {
	            toastr.error("Not updated.");
	        }
	    }
	});
}

// =================
// Get Messages Data
// =================   
function getMessages() {
    var messages = new wijmo.collections.ObservableArray();
    $('#loading').modal('show');
    $.ajax({
        url: '${pageContext.request.contextPath}/api/message/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (Results) {
            $('#loading').modal('hide');
            if (Results.length > 0) {
                for (i = 0; i < Results.length; i++) {
                    messages.push({
                        EditId: "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditMessage' onclick='cmdMessageEdit_OnClick()'>Edit</button>",
                        DeleteId: "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteMessage' onclick='cmdMessageDelete_OnClick()'>Delete</button>",
                        MESG_ID: Results[i]["mesg_ID"],
                        MESG_CODE: Results[i]["mesg_CODE"],
                        MESG_LEVEL: Results[i]["mesg_LEVEL"],
                        MESG_NOTE: Results[i]["mesg_NOTE"],
                        MESG_START_DATE: Results[i]["mesg_START_DATE"],
                        MESG_END_DATE: Results[i]["mesg_END_DATE"],
                        CREATED_DATE: Results[i]["created_DATE"],
                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
                        UPDATED_DATE: Results[i]["updated_DATE"],
                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
                        ISDELETED: Results[i]["isdeleted"],
                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
                        MESG_CREATED_BY_USER: Results[i]["MESG_CREATED_BY_USER"],
                        MESG_UPDATED_BY_USER: Results[i]["MESG_UPDATED_BY_USER"]
                    });
                }
            } else {
                alert("No data.");
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );
	return messages;
}

// ==================
// Navigation Buttons
// ==================   
function updateNavigateButtonsMessage() {
    if (messages.pageSize <= 0) {
        document.getElementById('naviagtionPageGrid').style.display = 'none';
        return;
    }
    document.getElementById('naviagtionPageGrid').style.display = 'block';
    if (messages.pageIndex === 0) {
        btnFirstPageGrid.setAttribute('disabled', 'disabled');
        btnPreviousPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    else if (messages.pageIndex === (Messages.pageCount - 1)) {
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
    btnCurrentPageGrid.innerHTML = (messages.pageIndex + 1) + ' / ' + messages.pageCount;
}

//===================
//FlexGrid Selection
//=================== 
function updateDetails() {
	var item = messages.currentItem;
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.MESG_CREATED_BY_USER.USER_LOGIN;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.MESG_UPDATED_BY_USER.USER_LOGIN;
	document.getElementById('EDIT_UPDATE_DATE').innerHTML = item.UPDATED_DATE;
}

// =====================
// Detail Edit Validator
// =====================     
function FormValidate() {
    var validator = $('form').validate({
        submitHandler: function (form) {
            form.submit();
        }
    });
    var x = validator.form();
    console.log(x);
    return x;
}

// ==============================
// Detail Edit Validator Defaults
// ==============================    
$.validator.setDefaults({
    errorPlacement: function (error, element) {
        $(element).attr({ "title": error.append() });
    },
    highlight: function (element) {
        $(element).removeClass("textinput");
        $(element).addClass("errorHighlight");
    },
    unhighlight: function (element) {
        $(element).removeClass("errorHighlight");
        $(element).addClass("textinput");
    }
});

// ============
// On Page Load
// ============
$(document).ready(function () {
	
	 // Date Control Initialization
    messageStartDate = new wijmo.input.InputDate('#EDIT_MESG_START_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date()
    });    	
    messageEndDate = new wijmo.input.InputDate('#EDIT_MESG_END_DATE', {
        format: 'MM/dd/yyyy',
        value: new Date()
    });     	
	
    // Validation
    $('#CmdMessageEditOk').click(function () {
        if (FormValidate() == true) {
            cmdMessageEditOkFunction();
            $('#MessageEdit').modal('hide');
        }
        else {
            toastr.error("Fill the required field!");
        }
    });
    $('#CmdMessageEditCancel, .close').click(function () {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#MessageEdit').modal('hide');
    });
    $('.close-btn').hide();

    // Collection View
    messages = new wijmo.collections.CollectionView(getMessages());
    messages.canFilter = true;
    messages.pageSize  = 15;
    
    var filterText = '';
    $('#InputFilter').keyup(function () {
        filterText = this.value.toLowerCase();
        messages.refresh();
    });
    messages.filter = function (item) {
        return !filterText || (item.MESG_CODE.toLowerCase().indexOf(filterText) > -1);
    }
    messages.collectionChanged.addHandler(function (sender, args) {
        updateNavigateButtonsMessage();
    });
   
    messages.currentChanged.addHandler(function (sender, args) {
    	updateDetails();
    });
    
    // Flex Grid
    messageGrid = new wijmo.grid.FlexGrid('#messageGrid');
    messageGrid.initialize({
        columns: [
                    {
                        "header": "Edit",
                        "binding": "EditId",
                        "width": 60,
                        "allowSorting": false,
                        "isContentHtml": true
                    },
                    {
                        "header": "Delete",
                        "binding": "DeleteId",
                        "width": 60,
                        "allowSorting": false,
                        "isContentHtml": true
                    },
                    {
                        "header": "Code",
                        "binding": "MESG_CODE",
                        "allowSorting": true,
                        "width": "7*"
                    },
                    {
                        "header": "Level",
                        "binding": "MESG_LEVEL",
                        "allowSorting": true,
                        "width": "7*"
                    },
                    {
                        "header": "Note",
                        "binding": "MESG_NOTE",
                        "allowSorting": true,
                        "width": "7*"
                    },                    
                    {
                        "header": "Start Date",
                        "binding": "MESG_START_DATE",
                        "allowSorting": true,
                        "width": "7*"
                    },
                    {
                        "header": "End Date",
                        "binding": "MESG_END_DATE",
                        "allowSorting": true,
                        "width": "7*"
                    }                         
        ],
        autoGenerateColumns: false,
        itemsSource: messages,
        isReadOnly: true,
        selectionMode: wijmo.grid.SelectionMode.Row
    });
    messageGrid.trackChanges = true;
    
    // Navigation button
    btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
    btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
    btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
    btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
    btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

    updateNavigateButtonsMessage();

    btnFirstPageGrid.addEventListener('click', function () {
        messages.moveToFirstPage();
        updateNavigateButtonsMessage();
    });
    btnPreviousPageGrid.addEventListener('click', function () {
        messages.moveToPreviousPage();
        updateNavigateButtonsMessage();
    });
    btnNextPageGrid.addEventListener('click', function () {
        messages.moveToNextPage();
        updateNavigateButtonsMessage();
    });
    btnLastPageGrid.addEventListener('click', function () {
        messages.moveToLastPage();
        updateNavigateButtonsMessage();
    });
});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>