<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - User Information</title>

<div class="container">

<!-- Charge List -->
<div class="container">
	<section id="memberList">
		<div class="row">
			<div class="col-lg-12">
				<h4>Member List</h4>
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
					<input type="text" class="form-control border-custom" id="InputFilter" placeholder="Search">
				</div>
			</div>
		</div>
		<br />
		
	<div class="row">
		<div class="col-lg-12">
			<div id="customerMemberGrid" class="grid border-custom"></div>
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
				<button type="button" class="btn btn-default border-custom" disabled style="width: 100px" id="btnCurrentPageGrid"></button>
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


	<!-- Charge Edit Detail -->
	<div class="modal fade" id="MemberEdit">
		<div class="modal-dialog  modal-wide">
				<div class="modal-content border-custom">
					<div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title">Member Edit</h4>
	            </div>
				<div class="modal-body">
					<form id="memberForm">
						<div class="row">
							<div class="col-sm-6">
								<dl class="dl-horizontal">
									<dt>Customer: </dt>
									<dd>
										<input id="EDIT_MEBR_ID" type="hidden" />
										
			            				<div id="EDIT_MEBR_CUST_ID" class="autocomplete-wide"></div>
										<input id="EDIT_MEBR_CUST_ID_DATA" name="EDIT_MEBR_CUST_ID_DATA" type="hidden" required />
										<input id="EDIT_CUST_NAME" name="EDIT_CUST_NAME" type="hidden" required />
									</dd>
									<dt>Member No: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_CUSTOMER_MEMBER_NO" name="EDIT_MEBR_CUSTOMER_MEMBER_NO" type="text" required />
									</dd>
									<dt>User: </dt>
									<dd>							
										<div id="EDIT_MEBR_CUSTOMER_MEMBER_USER_ID" class="autocomplete-wide"></div>
										<input id="EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_DATA" name="EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_DATA" type="hidden" required />
										<input id="EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_NAME" name="EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_NAME" type="hidden" required />
									</dd>
									<dt>First Name: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_FIRST_NAME" name="EDIT_MEBR_FIRST_NAME"	type="text" required />
									</dd>
									<dt>Last Name: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_LAST_NAME" name="EDIT_MEBR_LAST_NAME" type="text" required />
									</dd>
									<dt>Tel No: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_TEL_NO" name="EDIT_MEBR_TEL_NO" type="text" required />
									</dd>
									<dt>Address1: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_ADDRESS1" name="EDIT_MEBR_ADDRESS1" type="text"  />
									</dd>
									<dt>Address2: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_ADDRESS2" name="EDIT_MEBR_ADDRESS2" type="text"  />
									</dd>
									<dt>Address3: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_ADDRESS3" name="EDIT_MEBR_ADDRESS3" type="text"  />
									</dd>
								</dl>
							</div>
							<div class="col-sm-6">	
								<dl class="dl-horizontal">
									<dt>Zip Code: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_ZIP_CODE" name="EDIT_MEBR_ZIP_CODE" type="text" required />
									</dd>
									<dt>Email Address: </dt>
									<dd>
										<input class="form-control border-custom"	id="EDIT_MEBR_EMAIL_ADDRESS" name="EDIT_MEBR_EMAIL_ADDRESS" type="text" required />
									</dd>
									<dt>Birth Date: </dt>
									<dd>
		                       		 	  <div id="EDIT_MEBR_DATE_OF_BIRTH" class="autocomplete-wide"></div>
		                          		  <input id="EDIT_MEBR_DATE_OF_BIRTH_DATA" name="EDIT_MEBR_DATE_OF_BIRTH" type="hidden" required/>    
									</dd>
									<dt>Point: </dt>
									<dd>
										<select class="form-control border-custom" id="EDIT_MEBR_POINT" name="EDIT_MEBR_POINT" required >
										  <option value="1">1</option>
										  <option value="2">2</option>
										  <option value="3">3</option>
										  <option value="4">4</option>
										  <option value="5">5</option>
										  <option value="6">6</option>
										  <option value="7">7</option>
										  <option value="8">8</option>
										  <option value="9">9</option>
										  <option value="10">10</option>
										</select>
									</dd>
									<dt>Custom Field 1: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_FIELD1" name="EDIT_MEBR_FIELD1" type="text"  />
									</dd>
									<dt>Custom Field 2: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_FIELD2" name="EDIT_MEBR_FIELD2" type="text"  />
									</dd>
									<dt>Custom Field 3: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_FIELD3" name="EDIT_MEBR_FIELD3" type="text"  />
									</dd>
									<dt>Custom Field 4: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_FIELD4" name="EDIT_MEBR_FIELD4" type="text"  />
									</dd>
									<dt>Custom Field 5: </dt>
									<dd>
										<input class="form-control border-custom" id="EDIT_MEBR_FIELD5" name="EDIT_MEBR_FIELD5" type="text"  />
									</dd>						
								</dl>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary border-custom"	id="cmdChargeEditOk" onclick="cmdCustomerMemberEditOk_OnClick()">Ok</button>
					<button type="button" class="btn btn-danger border-custom"	id="cmdChargeEditCancel" onclick="cmdCustomerMemberEditCancel_OnClick()">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// ================
// Global Variables
// ================
var customerMembers;
var customerMemberGrid;

var customerMembersDate;

var btnFirstPageGrid;
var btnPreviousPageGrid;
var btnNextPageGrid;
var btnLastPageGrid;
var btnCurrentPageGrid;

// ===================
// Get Customer
// ===================
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

function getUsers() {
    var users = new wijmo.collections.ObservableArray();
    $.ajax({
        url: '${pageContext.request.contextPath}/api/user/list',
        cache: false,
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        data: {},
        success: function (results) {
            if (results.length > 0) {
                for (i = 0; i < results.length; i++) {
                	users.push({
                        id: results[i]["USER_ID"],
                        userLogin: results[i]["USER_LOGIN"]
                    });
                }
                createCboUsers(users);
            }
        }
    }).fail(
        function (xhr, textStatus, err) {
            alert(err);
        }
    );
}


// ===================
// Combo Box
// ===================
function createCboCustomer(customers) {
	customerCollection = new wijmo.collections.CollectionView(customers);
    var customerList = new Array();
    for (var i = 0; i < customerCollection.items.length; i++) {
    	customerList.push(customerCollection.items[i].customerName);
    }
 
    cboCustomer.dispose();
	cboCustomer = new wijmo.input.AutoComplete('#EDIT_MEBR_CUST_ID', {
        itemsSource: customerList,
        selectedValue: document.getElementById('EDIT_CUST_NAME').value.toString(),
        onSelectedIndexChanged: function () {
            $("#EDIT_MEBR_CUST_ID_DATA").val(customerCollection.items[this.selectedIndex].id);
        }
    });	
}


function createCboUsers(users) {
	userCollection = new wijmo.collections.CollectionView(users);
    var userList = new Array();
    for (var i = 0; i < userCollection.items.length; i++) {
    	userList.push(userCollection.items[i].id);
    }
 
    cboUsers.dispose();
    cboUsers = new wijmo.input.AutoComplete('#EDIT_MEBR_CUSTOMER_MEMBER_USER_ID', {
        itemsSource: userList,
        selectedValue: document.getElementById('EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_NAME').value.toString(),
        onSelectedIndexChanged: function () {
            $("#EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_DATA").val(userCollection.items[this.selectedIndex].id);
        }
    });	
}

// ===================
// Edit Button Clicked
// ===================
function cmdCustomerMemberEdit_OnClick() {
	customerMembers.editItem(customerMembers.currentItem);

    $('#MemberEdit').modal({
        show: true,
        backdrop: 'static'
    });

    var customerMember = customerMembers.currentEditItem;
   
    document.getElementById('EDIT_MEBR_ID').value = customerMember.MEBR_ID !== null && typeof (customerMember.MEBR_ID) != 'undefined' ? wijmo.Globalize.format(customerMember.MEBR_ID) : '';
    document.getElementById('EDIT_MEBR_TEL_NO').value = customerMember.MEBR_TEL_NO ? customerMember.MEBR_TEL_NO : '';
    document.getElementById('EDIT_MEBR_CUST_ID_DATA').value = customerMember.MEBR_CUST_ID ? customerMember.MEBR_CUST_ID : '';
    document.getElementById('EDIT_CUST_NAME').value = customerMember.MEBR_CUST_FK ? customerMember.MEBR_CUST_FK : '';
    document.getElementById('EDIT_MEBR_CUSTOMER_MEMBER_NO').value = customerMember.MEBR_CUSTOMER_MEMBER_NO ? customerMember.MEBR_CUSTOMER_MEMBER_NO : '';
    document.getElementById('EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_NAME').value = customerMember.MEBR_USER_ID ? customerMember.MEBR_USER_ID : '';
    document.getElementById('EDIT_MEBR_EMAIL_ADDRESS').value = customerMember.MEBR_EMAIL_ADDRESS ? customerMember.MEBR_EMAIL_ADDRESS : '';
    document.getElementById('EDIT_MEBR_FIRST_NAME').value = customerMember.MEBR_FIRST_NAME ? customerMember.MEBR_FIRST_NAME : '';
    document.getElementById('EDIT_MEBR_LAST_NAME').value = customerMember.MEBR_LAST_NAME ? customerMember.MEBR_LAST_NAME : '';
	document.getElementById('EDIT_MEBR_DATE_OF_BIRTH_DATA').value = customerMember.MEBR_DATE_OF_BIRTH ? customerMember.MEBR_DATE_OF_BIRTH : '';
	document.getElementById('EDIT_MEBR_ADDRESS1').value = customerMember.MEBR_ADDRESS1 ? customerMember.MEBR_ADDRESS1 : '';
	document.getElementById('EDIT_MEBR_ADDRESS2').value = customerMember.MEBR_ADDRESS2 ? customerMember.MEBR_ADDRESS2 : '';
	document.getElementById('EDIT_MEBR_ADDRESS3').value = customerMember.MEBR_ADDRESS3 ? customerMember.MEBR_ADDRESS3 : '';
	document.getElementById('EDIT_MEBR_ZIP_CODE').value = customerMember.MEBR_ZIP_CODE ? customerMember.MEBR_ZIP_CODE : '';
	document.getElementById('EDIT_MEBR_POINT').value = customerMember.MEBR_POINT ? customerMember.MEBR_POINT : '';
	document.getElementById('EDIT_MEBR_FIELD1').value = customerMember.MEBR_FIELD1 ? customerMember.MEBR_FIELD1 : '';
	document.getElementById('EDIT_MEBR_FIELD2').value = customerMember.MEBR_FIELD2 ? customerMember.MEBR_FIELD2 : '';
	document.getElementById('EDIT_MEBR_FIELD3').value = customerMember.MEBR_FIELD3 ? customerMember.MEBR_FIELD3 : '';
	document.getElementById('EDIT_MEBR_FIELD4').value = customerMember.MEBR_FIELD4 ? customerMember.MEBR_FIELD4 : '';
	document.getElementById('EDIT_MEBR_FIELD5').value = customerMember.MEBR_FIELD5 ? customerMember.MEBR_FIELD5 : '';

	getCustomers(); 
	getUsers();
	
    var splitDate = customerMember.MEBR_DATE_OF_BIRTH.split("-"); 
   
    customerMembersDate.dispose();
    customerMembersDate = new wijmo.input.InputDate('#EDIT_MEBR_DATE_OF_BIRTH', {
        format: 'MM/dd/yyyy',
        value: new Date(splitDate[0], splitDate[1] - 1, splitDate[2]),
        onValueChanged: function () {
            document.getElementById('EDIT_MEBR_DATE_OF_BIRTH_DATA').value = this.value.toString("yyyy-MM-dd");
        }
    }); 
}

// =================================
// Edit Detail Cancel Button Clicked 
// =================================     
function cmdCustomerMemberEditCancel_OnClick() {
	$('#MemberEdit').modal('hide');
}

// =====================
// Delete Button Clicked 
// =====================   
function cmdCustomerMemberDelete_OnClick() {
	customerMembers.editItem(customerMembers.currentItem);

	var id = customerMembers.currentEditItem.MEBR_ID;
	var memberName = customerMembers.currentEditItem.MEBR_FIRST_NAME;
	
	alertify.confirm("Are you sure you want to delete member " + memberName + "? <span class='glyphicon glyphicon-trash'></span>", function (e) {
	if (e) {
		$.ajax({
			type : "DELETE",
			url : '${pageContext.request.contextPath}/api/customerMember/delete/'+ id,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			statusCode : {
				200 : function() {
					toastr.success('Successfully Deleted!');
					window.setTimeout(function() {
						location.reload()
					}, 1000);
				},
				404 : function() {
					toastr.error("Not found!");
				},
				400 : function() {
					toastr.error("Bad request");
				}
			}
		});
		}
	});
}
	
// =============================
// Edit Detail OK Button Clicked
// =============================     
function cmdCustomerMemberEditOk_OnClick() {
	
	var customerMemberObject = new Object();

	customerMemberObject.MEBR_ID = parseInt(document.getElementById('EDIT_MEBR_ID').value);
	customerMemberObject.MEBR_CUST_ID = document.getElementById('EDIT_MEBR_CUST_ID_DATA').value;
	customerMemberObject.MEBR_CUSTOMER_MEMBER_NO =  document.getElementById('EDIT_MEBR_CUSTOMER_MEMBER_NO').value;
	customerMemberObject.MEBR_USER_ID =  document.getElementById('EDIT_MEBR_CUSTOMER_MEMBER_USER_ID_DATA').value;
	customerMemberObject.MEBR_TEL_NO = document.getElementById('EDIT_MEBR_TEL_NO').value;
	customerMemberObject.MEBR_EMAIL_ADDRESS = document.getElementById('EDIT_MEBR_EMAIL_ADDRESS').value;
	customerMemberObject.MEBR_FIRST_NAME = document.getElementById('EDIT_MEBR_FIRST_NAME').value;
	customerMemberObject.MEBR_LAST_NAME = document.getElementById('EDIT_MEBR_LAST_NAME').value;
	customerMemberObject.MEBR_ADDRESS1 = document.getElementById('EDIT_MEBR_ADDRESS1').value;
	customerMemberObject.MEBR_ADDRESS2 = document.getElementById('EDIT_MEBR_ADDRESS2').value;
	customerMemberObject.MEBR_ADDRESS3 = document.getElementById('EDIT_MEBR_ADDRESS3').value;
	customerMemberObject.MEBR_ZIP_CODE = document.getElementById('EDIT_MEBR_ZIP_CODE').value;
	customerMemberObject.MEBR_POINT = document.getElementById('EDIT_MEBR_POINT').options[document.getElementById("EDIT_MEBR_POINT").selectedIndex].value;
	customerMemberObject.MEBR_FIELD1 = document.getElementById('EDIT_MEBR_FIELD1').value;
	customerMemberObject.MEBR_FIELD2 = document.getElementById('EDIT_MEBR_FIELD2').value;
	customerMemberObject.MEBR_FIELD3 = document.getElementById('EDIT_MEBR_FIELD3').value;
	customerMemberObject.MEBR_FIELD4 = document.getElementById('EDIT_MEBR_FIELD4').value;
	customerMemberObject.MEBR_FIELD5 = document.getElementById('EDIT_MEBR_FIELD5').value;


	var splitDate = document.getElementById('EDIT_MEBR_DATE_OF_BIRTH_DATA').value.split("-");

	customerMemberObject.MEBR_DATE_OF_BIRTH = new Date(splitDate[0], splitDate[1] - 1, splitDate[2]);
 	
 	var data = JSON.stringify(customerMemberObject);

    $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/api/customerMember/update',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: data,
        success: function (data) {
            if (data.MEBR_ID > 0) {
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
function getCustomerMembers() {
	var customerMembers = new wijmo.collections.ObservableArray();
	$('#loading').modal('show');
	$.ajax({
		url : '${pageContext.request.contextPath}/api/customerMember/list',
		cache : false,
		type : 'GET',
		contentType : 'application/json; charset=utf-8',
		data : {},
		success : function(Results) {
			$('#loading').modal('hide');
			if (Results.length > 0) {
				for (i = 0; i < Results.length; i++) {
					customerMembers.push({
								EditId : "<button class='btn btn-primary btn-xs border-custom' data-toggle='modal' id='cmdEditCustomer' onclick='cmdCustomerMemberEdit_OnClick()'>Edit</button>",
								DeleteId : "<button class='btn btn-danger btn-xs border-custom' data-toggle='modal' id='cmdDeleteCustomer' onclick='cmdCustomerMemberDelete_OnClick()'>Delete</button>",
								MEBR_ID : Results[i]["mebr_ID"],
								MEBR_CUST_FK : Results[i].MEBR_CUST_FK.CUST_NAME,
								MEBR_CUST_ID : Results[i]["mebr_CUST_ID"],
								MEBR_TEL_NO : Results[i]["mebr_TEL_NO"], 
								MEBR_CUSTOMER_MEMBER_NO : Results[i]["mebr_CUSTOMER_MEMBER_NO"],
								MEBR_USER_ID : Results[i].MEBR_USER_FK.USER_ID,
								MEBR_EMAIL_ADDRESS : Results[i]["mebr_EMAIL_ADDRESS"],
								MEBR_FIRST_NAME : Results[i]["mebr_FIRST_NAME"],
								MEBR_LAST_NAME : Results[i]["mebr_LAST_NAME"],
								MEBR_DATE_OF_BIRTH : Results[i]["mebr_DATE_OF_BIRTH"],
								MEBR_ZIP_CODE : Results[i]["mebr_ZIP_CODE"],
								MEBR_ADDRESS1 : Results[i]["mebr_ADDRESS1"],
								MEBR_ADDRESS2 : Results[i]["mebr_ADDRESS2"],
								MEBR_ADDRESS3 : Results[i]["mebr_ADDRESS3"],
								MEBR_POINT : Results[i]["mebr_POINT"],
								MEBR_FIELD1 : Results[i]["mebr_FIELD1"],
								MEBR_FIELD2 : Results[i]["mebr_FIELD2"],
								MEBR_FIELD3 : Results[i]["mebr_FIELD3"],
								MEBR_FIELD4 : Results[i]["mebr_FIELD4"],
								MEBR_FIELD5 : Results[i]["mebr_FIELD5"],
								
								CREATED_DATE: Results[i]["created_DATE"],
		                        CREATED_BY_USER_ID: Results[i]["created_BY_USER_ID"],
		                        UPDATED_DATE: Results[i]["updated_DATE"],
		                        UPDATED_BY_USER_ID: Results[i]["updated_BY_USER_ID"],
		                        ISDELETED: Results[i]["isdeleted"],
		                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
		                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"],
								MEBR_CREATED_BY_USER_FK: Results[i]["MEBR_CREATED_BY_USER_FK"],
								MEBR_UPDATED_BY_USER_FK: Results[i]["MEBR_UPDATED_BY_USER_FK"]
							});
						}
				
					} else {
					/* 	alert("No data."); */
					}
				}
			}).fail(function(xhr, textStatus, err) {
		alert(err);
	});
	return customerMembers;
}


// ==================
// Navigation Buttons
// ==================   
function updateNavigateButtonsCustomerMember() {
    if (customerMembers.pageSize <= 0) {
        document.getElementById('naviagtionPageGrid').style.display = 'none';
        return;
    }
    document.getElementById('naviagtionPageGrid').style.display = 'block';
    if (customerMembers.pageIndex === 0) {
        btnFirstPageGrid.setAttribute('disabled', 'disabled');
        btnPreviousPageGrid.setAttribute('disabled', 'disabled');
        btnNextPageGrid.removeAttribute('disabled');
        btnLastPageGrid.removeAttribute('disabled');
    }
    else if (customerMembers.pageIndex === (customerMembers.pageCount - 1)) {
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
    btnCurrentPageGrid.innerHTML = (customerMembers.pageIndex + 1) + ' / ' + customerMembers.pageCount;
}

//===================
// FlexGrid Selection
//===================
function updateDetails() {	
	var item = customerMembers.currentItem;	
	document.getElementById('EDIT_CREATED_BY').innerHTML = item.MEBR_CREATED_BY_USER_FK.USER_LOGIN;;
	document.getElementById('EDIT_CREATE_DATE').innerHTML = item.CREATED_DATE;
	document.getElementById('EDIT_UPDATED_BY').innerHTML = item.MEBR_UPDATED_BY_USER_FK.USER_LOGIN;
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



//=========
//Page Load
//========= 
$(document).ready(function() {

		customerMembersDate = new wijmo.input.InputDate('#EDIT_MEBR_DATE_OF_BIRTH', {
	        format: 'MM/dd/yyyy',
	        value: new Date()
	    }); 

		// Validation
		$('#CmdCustomerMemberEditOk').click(function() {
			if (FormValidate() == true) {
				cmdCustomerEditOkFunction();
				$('#MemberEdit').modal('hide');
			} else {
				toastr.error("Fill the required field!");
			}
		});

		$('#CmdCustomerMemberEditCancel, .close').click(
				function() {
					$("form input").removeClass("errorHighlight");
					$('form')[0].reset();
					$('#MemberEdit').modal('hide');
				});

		$('.close-btn').hide();

		// Collection View
		customerMembers = new wijmo.collections.CollectionView(getCustomerMembers());
		customerMembers.canFilter = true;
		customerMembers.pageSize = 15;

		var filterText = '';
		$('#InputFilter').keyup(function() {
			filterText = this.value.toLowerCase();
			customerMembers.refresh();
		});

		customerMembers.filter = function(item) {
			return !filterText || (item.MEBR_FIRST_NAME.toLowerCase().indexOf(filterText) > -1);
		}

		customerMembers.collectionChanged.addHandler(function (sender, args) {
			updateNavigateButtonsCustomerMember();
		});
	
		 
		customerMembers.currentChanged.addHandler(function (sender, args) {
			    updateDetails();
		});
		
		cboCustomer = new wijmo.input.AutoComplete('#EDIT_MEBR_CUST_ID');
		cboUsers = new wijmo.input.AutoComplete('#EDIT_MEBR_CUSTOMER_MEMBER_USER_ID');
		
		// Flex Grid
		customerMemberGrid = new wijmo.grid.FlexGrid('#customerMemberGrid');
		customerMemberGrid.initialize({
			columns : [ 
					{
						"header" : "Edit",
						"binding" : "EditId",
						"width" : 60,
						"allowSorting" : false,
						"isContentHtml" : true
					}, 
					{
						"header" : "Delete",
						"binding" : "DeleteId",
						"width" : 60,
						"allowSorting" : false,
						"isContentHtml" : true
					}, 
					{
						"header" : "Firstname",
						"binding" : "MEBR_FIRST_NAME",
						"allowSorting" : true,
						"width" : "2*"
					}, 
					{
						"header" : "Lastname",
						"binding" : "MEBR_LAST_NAME",
						"allowSorting" : true,
						"width" : "2*"
					},
				    {
						"header" : "Telephone No.",
						"binding" : "MEBR_TEL_NO",
						"allowSorting" : true,
						"width" : "2*"
					},
					{
						"header" : "Code",
						"binding" : "MEBR_ID",
						"allowSorting" : true,
						"width" : "2*"
					}, 
					{
						"header" : "Name",
						"binding" : "MEBR_CUST_FK",
						"allowSorting" : true,
						"width" : "2*"
					},
					{
						"header" : "Member No",
						"binding" : "MEBR_CUSTOMER_MEMBER_NO",
						"allowSorting" : true,
						"width" : "2*"
					}, 
					{
						"header" : "Email Address",
						"binding" : "MEBR_EMAIL_ADDRESS",
						"allowSorting" : true,
						"width" : "2*"
					}
			],
			autoGenerateColumns : false,
			itemsSource : customerMembers,
			isReadOnly : true,
			selectionMode : wijmo.grid.SelectionMode.Row
		});
		
		customerMemberGrid.trackChanges = true;

		// Navigation button
		btnFirstPageGrid = document.getElementById('btnMoveToFirstPageGrid');
		btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
		btnNextPageGrid = document.getElementById('btnMoveToNextPageGrid');
		btnLastPageGrid = document.getElementById('btnMoveToLastPageGrid');
		btnCurrentPageGrid = document.getElementById('btnCurrentPageGrid');

		updateNavigateButtonsCustomerMember();

		btnFirstPageGrid.addEventListener('click', function() {
			customerMembers.moveToFirstPage();
			updateNavigateButtonsCustomer();
		});
		btnPreviousPageGrid.addEventListener('click',
				function() {
			customerMembers.moveToPreviousPage();
					updateNavigateButtonsCustomer();
				});
		btnNextPageGrid.addEventListener('click', function() {
			customerMembers.moveToNextPage();
			updateNavigateButtonsCustomer();
		});
		btnLastPageGrid.addEventListener('click', function() {
			customerMembers.moveToLastPage();
			updateNavigateButtonsCustomer();
		});

/* 		// Scroll settings
		$('.scroll').slimscroll({
			height : '450px'
		}); */
	});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>
