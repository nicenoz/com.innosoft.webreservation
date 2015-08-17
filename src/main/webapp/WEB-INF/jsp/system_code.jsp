<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Code</title>

<!-- Code List -->
<div class="container"> 
	<section id="codeList">	
		<div class="row">
		    <div class="col-lg-12">
		        <h4>Code List</h4>
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
		            <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search Kind Code">
		        </div>
		    </div>
		    <div class="col-lg-8">
		        <button id="cmdAddCode" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdCodeAdd_OnClick()">Add</button>
		    </div>
		</div>		
		<br />		
		<div class="row">
		    <div class="col-lg-12">
		        <div id="codeGrid" class="grid border-custom"></div>
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

<!-- Code Edit Detail -->
<div class="modal fade" id="codeEdit">
    <div class="modal-dialog">
        <div class="modal-content border-custom">
        
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Code Edit</h4>
            </div>   
            <div class="modal-body">
                <form id="messageForm">
                    <dl class="dl-horizontal">
                        <dt>Code: </dt>
                        <dd>
                            <input id="EDIT_CODE_ID" type="hidden" />
                            <input class="form-control border-custom" id="EDIT_CODE_KIND_CODE" name="EDIT_CODE_KIND_CODE" type="text" required />
                        </dd>
                        <dt>Code Value: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CODE_CODE_VALUE" name="EDIT_CODE_CODE_VALUE" type="text" required />
                        </dd>
                        <dt>Note: </dt>
                        <dd>
							<input class="form-control border-custom" id="EDIT_CODE_NOTE" name="EDIT_CODE_NOTE" type="text" required /> 
                        </dd>
                        <dt>Text: </dt>
                        <dd>
							<input class="form-control border-custom" id="EDIT_CODE_TEXT" name="EDIT_CODE_TEXT" type="text" required /> 
                        </dd>                        
                        <dt>Is Displayed?: </dt>
                        <dd>
							<input class="form-control border-custom" id="EDIT_CODE_ISDISPLAY" name="EDIT_CODE_ISDISPLAY" type="text" required /> 
                        </dd>                       
                    </dl>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary border-custom"  id="cmdCodeEditOk" onclick="cmdCodeEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger border-custom" id="cmdCodeEditCancel" onclick="cmdCodeEditCancel_OnClick()">
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
var codes;
var codeGrid;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

// ===================
// Edit Button Clicked
// ===================
function cmdCodeEdit_OnClick() {	
    codes.editItem(codes.currentItem);

    $('#codeEdit').modal({
        show: true,
        backdrop: false
    });

    var code = codes.currentEditItem;    
    document.getElementById('EDIT_CODE_ID').value = code.CODE_ID !== null && typeof (code.CODE_ID) != 'undefined' ? wijmo.Globalize.format(code.CODE_ID) : 0;
    document.getElementById('EDIT_CODE_KIND_CODE').value = code.CODE_KIND_CODE ? code.CODE_KIND_CODE : '';
    document.getElementById('EDIT_CODE_CODE_VALUE').value = code.CODE_CODE_VALUE ? code.CODE_CODE_VALUE : '';
    document.getElementById('EDIT_CODE_NOTE').value = code.CODE_NOTE ? code.CODE_NOTE : '';
    document.getElementById('EDIT_CODE_TEXT').value = code.CODE_TEXT ? code.CODE_TEXT : '';
    document.getElementById('EDIT_CODE_ISDISPLAY').value = code.CODE_ISDISPLAY ? code.CODE_ISDISPLAY : 1;      
} 

// ==================
// Add Button Clicked
// ==================   
function cmdCodeAdd_OnClick() {	
    $('#codeEdit').modal({
        show: true,
        backdrop: false
    });    
    document.getElementById('EDIT_CODE_ID').value = 0;
    document.getElementById('EDIT_CODE_KIND_CODE').value = '';
    document.getElementById('EDIT_CODE_CODE_VALUE').value = '';
    document.getElementById('EDIT_CODE_NOTE').value = '';
    document.getElementById('EDIT_CODE_TEXT').value = '';
    document.getElementById('EDIT_CODE_ISDISPLAY').value = 1;         
}

// =====================
// Delete Button Clicked
// =====================   
function cmdCodeDelete_OnClick() {	
    codes.editItem(codes.currentItem);
    
    var id = codes.currentEditItem.CODE_ID;
    var codeKindCode = codes.currentEditItem.CODE_KIND_CODE;
  
    alertify.confirm("Are you sure you want to delete Code Kind " + codeKindCode + "? <span class='glyphicon glyphicon-trash'></span>", function (e) {
    if (e) {
        $.ajax({
            type: "DELETE",
            url: '${pageContext.request.contextPath}/api/code/delete/' + id,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            statusCode: {
                200: function () {
                    toastr.success('Successfully Deleted.');
                    window.setTimeout(function () { location.reload() }, 1000);
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

// =================================
// Edit Detail Cancel Button Clicked
// =================================     
function cmdCodeEditCancel_OnClick() {	
	$('#codeEdit').modal('hide');    		
} 

// =============================
// Edit Detail OK Button Clicked
// =============================     
function cmdCodeEditOk_OnClick() {	
	var codeObject = new Object();

 	codeObject.CODE_ID = parseInt(document.getElementById('EDIT_CODE_ID').value);
 	codeObject.CODE_KIND_CODE = document.getElementById('EDIT_CODE_KIND_CODE').value;
 	codeObject.CODE_CODE_VALUE = document.getElementById('EDIT_CODE_CODE_VALUE').value;
 	codeObject.CODE_NOTE = document.getElementById('EDIT_CODE_NOTE').value;
 	codeObject.CODE_TEXT = document.getElementById('EDIT_CODE_TEXT').value;
 	codeObject.CODE_ISDISPLAY = parseInt(document.getElementById('EDIT_CODE_ISDISPLAY').value); 

 	var data = JSON.stringify(codeObject);

    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/api/code/update',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: function (data) {
            if (data.CODE_ID > 0) {
                toastr.success('Successfully updated.');
                window.setTimeout(function () { location.reload() }, 1000);
            } else {
                toastr.error("Not updated.");
            }
        }
    });
} 

// ==============
// Get Codes Data
// ==============   
function getCodes() {	
    var codes = new wijmo.collections.ObservableArray();
    
    $('#loading').modal('show');
    $.ajax({
        url: '${pageContext.request.contextPath}/api/code/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (Results) {
            $('#loading').modal('hide');
            if (Results.length > 0) {
                for (i = 0; i < Results.length; i++) {
                    codes.push({
                        EditId: "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditCode' onclick='cmdCodeEdit_OnClick()'>Edit</button>",
                        DeleteId: "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteCode' onclick='cmdCodeDelete_OnClick()'>Delete</button>",
                        CODE_ID: Results[i]["CODE_ID"],
                        CODE_KIND_CODE: Results[i]["CODE_KIND_CODE"],
                        CODE_CODE_VALUE: Results[i]["CODE_CODE_VALUE"],
                        CODE_NOTE: Results[i]["CODE_NOTE"],
                        CODE_TEXT: Results[i]["CODE_TEXT"],
                        CODE_ISDISPLAY: Results[i]["CODE_ISDISPLAY"],
                        
                        CREATED_DATE: Results[i]["created_DATE"],
                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
                        UPDATED_DATE: Results[i]["updated_DATE"],
                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
                        ISDELETED: Results[i]["isdeleted"],
                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
                        CODE_CREATED_BY_USER_FK: Results[i]["CODE_CREATED_BY_USER_FK"],
                        CODE_UPDATED_BY_USER_FK: Results[i]["CODE_UPDATED_BY_USER_FK"]
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
    return codes;
}

// ==================
// Navigation Buttons
// ==================   
 function updateNavigateButtonsCode() {	
    if (codes.pageSize <= 0) {
        document.getElementById('naviagtionPageGrid').style.display = 'none';
        return;
    }
    document.getElementById('naviagtionPageGrid').style.display = 'block';
    if (codes.pageIndex === 0) {
        btnFirstPageGrid.setAttribute('disabled', 'disabled');
        btnPreviousPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    else if (codes.pageIndex === (codes.pageCount - 1)) {
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
    btnCurrentPageGrid.innerHTML = (codes.pageIndex + 1) + ' / ' + codes.pageCount;    
} 

// ===================
// FlexGrid Selection
// ===================
function updateDetails() {	
	var item = codes.currentItem;	
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.CODE_CREATED_BY_USER_FK.USER_LOGIN;;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.CODE_UPDATED_BY_USER_FK.USER_LOGIN;
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
	// Validation
    $('#cmdCodeEditOk').click(function () {
        if (FormValidate() == true) {
            cmdCodeEditOkFunction();
            $('#codeEdit').modal('hide');
        }
        else {
            toastr.error("Fill the required field!");
        }
    });
	
    $('#cmdCodeEditCancel, .close').click(function () {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#codeEdit').modal('hide');
    });
    
    $('.close-btn').hide();

    // Collection View
    codes = new wijmo.collections.CollectionView(getCodes());
    codes.canFilter = true;
    codes.pageSize  = 15;
    
    var filterText = '';    
    $('#InputFilter').keyup(function () {
        filterText = this.value.toLowerCase();
        codes.refresh();
    });
    codes.filter = function (item) {
        return !filterText || (item.CODE_KIND_CODE.toLowerCase().indexOf(filterText) > -1);
    }
    
    codes.collectionChanged.addHandler(function (sender, args) {
        updateNavigateButtonsCode();
    });
    
    codes.currentChanged.addHandler(function (sender, args) {
	    updateDetails();
	});
    
    // Flex Grid
    codeGrid = new wijmo.grid.FlexGrid('#codeGrid');
    codeGrid.initialize({
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
                    }         ,
                    {
                        "header": "Kind Code",
                        "binding": "CODE_KIND_CODE",
                        "allowSorting": true,
                        "width": 100
                    },
                    {
                        "header": "Code Value",
                        "binding": "CODE_CODE_VALUE",
                        "allowSorting": true,
                        "width": 100
                    },                        
                    {
                        "header": "Note",
                        "binding": "CODE_NOTE",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Text",
                        "binding": "CODE_TEXT",
                        "allowSorting": true,
                        "width": "2*"
                    },
                    {
                        "header": "Display",
                        "binding": "CODE_ISDISPLAY",
                        "allowSorting": true,
                        "width": 60
                    }                
        	],
        autoGenerateColumns: false,
        itemsSource: codes,
        isReadOnly: true,
        selectionMode: wijmo.grid.SelectionMode.Row
    });
    
    codeGrid.trackChanges = true;

    // Navigation button
    btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
    btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
    btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
    btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
    btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

    updateNavigateButtonsCode();

    btnFirstPageGrid.addEventListener('click', function () {
        codes.moveToFirstPage();
        updateNavigateButtonsCode();
    });
    btnPreviousPageGrid.addEventListener('click', function () {
        codes.moveToPreviousPage();
        updateNavigateButtonsCode();
    });
    btnNextPageGrid.addEventListener('click', function () {
        codes.moveToNextPage();
        updateNavigateButtonsCode();
    });
    btnLastPageGrid.addEventListener('click', function () {
        codes.moveToLastPage();
        updateNavigateButtonsCode();
    }); 
});
</script>


<!-- footer -->
<%@include file="include_secure_footer.jsp"%>