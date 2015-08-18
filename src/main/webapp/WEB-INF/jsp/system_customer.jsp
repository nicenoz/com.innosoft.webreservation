<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Customer</title>
    
<!-- Customer List -->
<div class="container"> 
	<section id="customerList">
		<div class="row">
		    <div class="col-lg-12">
		        <h4>Customer List</h4>
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
		            <input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search Customer">
		        </div>
		    </div>
		    <div class="col-lg-8">
		        <button id="cmdAddCustomer" type="submit" class="btn btn-primary pull-right border-custom" onclick="cmdCustomerAdd_OnClick()">Add</button>
		    </div>
		</div>
		<br />
		<div class="row">
		    <div class="col-lg-12">
		        <div id="customerGrid" class="grid border-custom"></div>
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

<!-- Customer Edit Detail -->
<div class="modal fade" id="CustomerEdit">
    <div class="modal-dialog">
        <div class="modal-content border-custom">
            <div class="modal-header">
                <button type="button" class="close" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">Customer Edit</h4>
            </div>
            <div class="modal-body scroll">
                <form id="messageForm">       
                    <dl class="dl-horizontal">
                        <dt>Customer No: </dt>
                        <dd>
                            <input id="EDIT_CUST_ID" type="hidden" />
                            <input class="form-control border-custom" id="EDIT_CUST_CUSTOMER_NO" name="EDIT_CUST_CUSTOMER_NO" type="text" required />
                        </dd>
                        <dt>Name: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CUST_NAME" name="EDIT_CUST_NAME" type="text" required />
                        </dd>
                        <dt>Phone No: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CUST_PHONENO" name="EDIT_CUST_PHONENO" type="text" required />
                        </dd>  
                        <dt>E-mail Address: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CUST_EMAIL" name="EDIT_CUST_EMAIL" type="text" required />
                        </dd> 	
                        <dt>ZIP Code: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CUST_ZIPCODE" name="EDIT_CUST_ZIPCODE" type="text" required />
                        </dd> 
                        <dt>Address 1: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CUST_ADDRESS1" name="EDIT_CUST_ADDRESS1" type="text" required />
                        </dd>   
                        <dt>Address 2: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CUST_ADDRESS2" name="EDIT_CUST_ADDRESS2" type="text" required />
                        </dd> 
                        <dt>Address 3: </dt>
                        <dd>
                            <input class="form-control border-custom" id="EDIT_CUST_ADDRESS3" name="EDIT_CUST_ADDRESS3" type="text" required />
                        </dd>   
                        <dt>Is Deleted?: </dt>
                        <dd>
                            <select class="form-control border-custom" id="EDIT_CUST_ISDELETED" name="EDIT_CUST_ISDELETED" required >
									  <option value="1">Yes</option>
									  <option value="0">No</option>
							</select>
                        </dd>                                               
                    </dl>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary border-custom"  id="cmdCustomerEditOk" onclick="cmdCustomerEditOk_OnClick()">
                    Ok
                </button>
                <button type="button" class="btn btn-danger border-custom" id="cmdCustomerEditCancel" onclick="cmdCustomerEditCancel_OnClick()">
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
var customers;
var customerGrid;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;
    
// ===================
// Edit Button Clicked
// ===================
function cmdCustomerEdit_OnClick() {
    customers.editItem(customers.currentItem);

    $('#CustomerEdit').modal({
        show: true,
        backdrop: false
    });

    var customer = customers.currentEditItem;
      
    document.getElementById('EDIT_CUST_ID').value = customer.CUST_ID !== null && typeof (customer.CUST_ID) != 'undefined' ? wijmo.Globalize.format(customer.CUST_ID) : 0;
	document.getElementById('EDIT_CUST_CUSTOMER_NO').value = customer.CUST_CUSTOMER_NO ? customer.CUST_CUSTOMER_NO : '';	
	document.getElementById('EDIT_CUST_NAME').value = customer.CUST_NAME ? customer.CUST_NAME : '';	
	document.getElementById('EDIT_CUST_PHONENO').value = customer.CUST_PHONENO ? customer.CUST_PHONENO : '';	
	document.getElementById('EDIT_CUST_EMAIL').value = customer.CUST_EMAIL ? customer.CUST_EMAIL : '';	
	document.getElementById('EDIT_CUST_ZIPCODE').value = customer.CUST_ZIPCODE ? customer.CUST_ZIPCODE : '';	
	document.getElementById('EDIT_CUST_ADDRESS1').value = customer.CUST_ADDRESS1 ? customer.CUST_ADDRESS1 : '';	
	document.getElementById('EDIT_CUST_ADDRESS2').value = customer.CUST_ADDRESS2 ? customer.CUST_ADDRESS2 : '';	
	document.getElementById('EDIT_CUST_ADDRESS3').value = customer.CUST_ADDRESS3 ? customer.CUST_ADDRESS3 : '';	
	document.getElementById('EDIT_CUST_ISDELETED').value = customer.CUST_ISDELETED ? customer.CUST_ISDELETED : '';		       
}

// ==================
// Add Button Clicked
// ==================   
function cmdCustomerAdd_OnClick() {
    $('#CustomerEdit').modal({
        show: true,
        backdrop: false
    });
    
    document.getElementById('EDIT_CUST_ID').value = 0;
    document.getElementById('EDIT_CUST_CUSTOMER_NO').value = '';	
	document.getElementById('EDIT_CUST_NAME').value = '';	
	document.getElementById('EDIT_CUST_PHONENO').value = '';	
	document.getElementById('EDIT_CUST_EMAIL').value = '';	
	document.getElementById('EDIT_CUST_ZIPCODE').value = '';	
	document.getElementById('EDIT_CUST_ADDRESS1').value = '';	
	document.getElementById('EDIT_CUST_ADDRESS2').value = '';	
	document.getElementById('EDIT_CUST_ADDRESS3').value = '';	
	document.getElementById('EDIT_CUST_ISDELETED').value = '';	        
}

// =====================
// Delete Button Clicked
// =====================   
function cmdCustomerDelete_OnClick() {
    customers.editItem(customers.currentItem);
    
    var id = customers.currentEditItem.CUST_ID;
    var customerName = customers.currentEditItem.CUST_NAME;
 
    alertify.confirm("Are you sure you want to delete customer " + customerName + "? <span class='glyphicon glyphicon-trash'></span>", function (e) {
    if (e) {
        $.ajax({
            type: "DELETE",
            url: '${pageContext.request.contextPath}/api/customer/delete/' + id,
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
function cmdCustomerEditCancel_OnClick() {
	$('#CustomerEdit').modal('hide');    	
}

// =============================
// Edit Detail OK Button Clicked
// =============================     
function cmdCustomerEditOk_OnClick() {
 	var customerObject = new Object();

	customerObject.CUST_ID = parseInt(document.getElementById('EDIT_CUST_ID').value);
	customerObject.CUST_CUSTOMER_NO = document.getElementById('EDIT_CUST_CUSTOMER_NO').value;	
	customerObject.CUST_NAME = document.getElementById('EDIT_CUST_NAME').value;	
	customerObject.CUST_PHONENO = document.getElementById('EDIT_CUST_PHONENO').value;	
	customerObject.CUST_EMAIL = document.getElementById('EDIT_CUST_EMAIL').value;	
	customerObject.CUST_ZIPCODE = document.getElementById('EDIT_CUST_ZIPCODE').value;	
	customerObject.CUST_ADDRESS1 = document.getElementById('EDIT_CUST_ADDRESS1').value;	
	customerObject.CUST_ADDRESS2 = document.getElementById('EDIT_CUST_ADDRESS2').value;	
	customerObject.CUST_ADDRESS3 = document.getElementById('EDIT_CUST_ADDRESS3').value;	
	customerObject.CUST_ISDELETED = document.getElementById('EDIT_CUST_ISDELETED').options[document.getElementById("EDIT_CUST_ISDELETED").selectedIndex].value;	

 	var data = JSON.stringify(customerObject);

    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/api/customer/update',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: function (data) {
            if (data.CUST_ID > 0) {
                toastr.success('Successfully updated.');
                window.setTimeout(function () { location.reload() }, 1000);
            } else {
                toastr.error("Not updated.");
            }
        }
    });
}

// =================
// Get Customer Data
// =================   
function getCustomers() {
    var customers = new wijmo.collections.ObservableArray();
    $('#loading').modal('show');
    $.ajax({
        url: '${pageContext.request.contextPath}/api/customer/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (Results) {
            $('#loading').modal('hide');
            if (Results.length > 0) {
                for (i = 0; i < Results.length; i++) {                    	
                    customers.push({
                        EditId: "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditCustomer' onclick='cmdCustomerEdit_OnClick()'>Edit</button>",
                        DeleteId: "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteCustomer' onclick='cmdCustomerDelete_OnClick()'>Delete</button>",
                        CUST_ID: Results[i]["CUST_ID"],
                        CUST_CUSTOMER_NO: Results[i]["CUST_CUSTOMER_NO"],
                        CUST_NAME: Results[i]["CUST_NAME"],
                        CUST_PHONENO: Results[i]["CUST_PHONENO"],
                        CUST_EMAIL: Results[i]["CUST_EMAIL"],
                        CUST_ZIPCODE: Results[i]["CUST_ZIPCODE"],
                        CUST_ADDRESS1: Results[i]["CUST_ADDRESS1"],
                        CUST_ADDRESS2: Results[i]["CUST_ADDRESS2"],
                        CUST_ADDRESS3: Results[i]["CUST_ADDRESS3"],
                        CUST_ISDELETED: Results[i]["CUST_ISDELETED"],
                        
                        CREATED_DATE: Results[i]["created_DATE"],
                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
                        UPDATED_DATE: Results[i]["updated_DATE"],
                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
                        ISDELETED: Results[i]["isdeleted"],
                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
                        CUST_CREATED_BY_USER_FK: Results[i]["CUST_CREATED_BY_USER_FK"],
                        CUST_UPDATED_BY_USER_FK: Results[i]["CUST_UPDATED_BY_USER_FK"]
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
    return customers;
}

// ==================
// Navigation Buttons
// ==================   
function updateNavigateButtonsCustomer() {
    if (customers.pageSize <= 0) {
        document.getElementById('naviagtionPageGrid').style.display = 'none';
        return;
    }
    document.getElementById('naviagtionPageGrid').style.display = 'block';
    if (customers.pageIndex === 0) {
        btnFirstPageGrid.setAttribute('disabled', 'disabled');
        btnPreviousPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    else if (customers.pageIndex === (Customers.pageCount - 1)) {
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
    btnCurrentPageGrid.innerHTML = (customers.pageIndex + 1) + ' / ' + customers.pageCount;
}

//===================
//FlexGrid Selection
//=================== 
function updateDetails() {
	var item = customers.currentItem;
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.CUST_CREATED_BY_USER_FK.USER_LOGIN;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.CUST_UPDATED_BY_USER_FK.USER_LOGIN;
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
    $('#CmdCustomerEditOk').click(function () {
        if (FormValidate() == true) {
            cmdCustomerEditOkFunction();
            $('#CustomerEdit').modal('hide');
        }
        else {
            toastr.error("Fill the required field!");
        }
    });

    $('#CmdCustomerEditCancel, .close').click(function () {
        $("form input").removeClass("errorHighlight");
        $('form')[0].reset();
        $('#CustomerEdit').modal('hide');
    });

    $('.close-btn').hide();

    // Collection View
    customers = new wijmo.collections.CollectionView(getCustomers());
    customers.canFilter = true;
    customers.pageSize  = 15;
    
    var filterText = '';
    $('#InputFilter').keyup(function () {
        filterText = this.value.toLowerCase();
        customers.refresh();
    });
    customers.filter = function (item) {
        return !filterText || (item.CUST_NAME.toLowerCase().indexOf(filterText) > -1);
    }
    
    customers.collectionChanged.addHandler(function (sender, args) {
        updateNavigateButtonsCustomer();
    });
    
    customers.currentChanged.addHandler(function (sender, args) {
	    updateDetails();
	});
           
    // Flex Grid
    customerGrid = new wijmo.grid.FlexGrid('#customerGrid');
    customerGrid.initialize({
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
                        "header": "Customer No",
                        "binding": "CUST_CUSTOMER_NO",
                        "allowSorting": true,
                        "width": 100
                    },
                    {
                        "header": "Name",
                        "binding": "CUST_NAME",
                        "allowSorting": true,
                        "width": "3*"
                    },
                    {
                        "header": "Phone No",
                        "binding": "CUST_PHONENO",
                        "allowSorting": true,
                        "width": "3*"
                    },
                    {
                        "header": "Email Address",
                        "binding": "CUST_EMAIL",
                        "allowSorting": true,
                        "width": "3*"
                    }                         
        ],
        autoGenerateColumns: false,
        itemsSource: customers,
        isReadOnly: true,
        selectionMode: wijmo.grid.SelectionMode.Row
    });
    customerGrid.trackChanges = true;

    // Navigation button
    btnFirstPageGrid    = document.getElementById('btnMoveToFirstPageGrid');
    btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
    btnNextPageGrid     = document.getElementById('btnMoveToNextPageGrid');
    btnLastPageGrid     = document.getElementById('btnMoveToLastPageGrid');
    btnCurrentPageGrid  = document.getElementById('btnCurrentPageGrid');

    updateNavigateButtonsCustomer();

    btnFirstPageGrid.addEventListener('click', function () {
        customers.moveToFirstPage();
        updateNavigateButtonsCustomer();
    });
    btnPreviousPageGrid.addEventListener('click', function () {
        customers.moveToPreviousPage();
        updateNavigateButtonsCustomer();
    });
    btnNextPageGrid.addEventListener('click', function () {
        customers.moveToNextPage();
        updateNavigateButtonsCustomer();
    });
    btnLastPageGrid.addEventListener('click', function () {
        customers.moveToLastPage();
        updateNavigateButtonsCustomer();
    });
    
    // Scroll settings
    $('.scroll').slimscroll({
        height: '450px'
    });
});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>