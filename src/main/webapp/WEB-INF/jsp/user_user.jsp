<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>User - User Information</title>

<div class="container">

<!-- Charge List -->
<div class="container">
	<section id="chargeList">
		<div class="row">
			<div class="col-lg-12">
				<h4>Member List</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-default btn-extend-padding btn-form-custom" type="button" readonly>
							<i class="fa fa-search"></i>
						</button>
					</span> 
					<input type="text" class="form-control input-form-custom" id="InputFilter" placeholder="Search...">
				</div>
			</div>
		</div>
		<br />
		
	<div class="row table-form-custom">
		<div class="col-lg-12 table-form-custom">
			<div id="customerMemberGrid" class="grid table-form-custom"></div>
		</div>
	</div>

		<br />
	
		<div class="row">
			<div class="btn-group col-md-7" id="naviagtionPageGrid">
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToFirstPageGrid">
					<span class="glyphicon glyphicon-fast-backward"></span>
				</button>
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToPreviousPageGrid">
					<span class="glyphicon glyphicon-step-backward"></span>
				</button>
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" disabled style="width: 100px" id="btnCurrentPageGrid"></button>
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToNextPageGrid">
					<span class="glyphicon glyphicon-step-forward"></span>
				</button>
				<button type="button" class="btn btn-default btn-extend-padding btn-form-custom" id="btnMoveToLastPageGrid">
					<span class="glyphicon glyphicon-fast-forward"></span>
				</button>
			</div>
		</div>
	</section>
</div>


	<!-- Charge Edit Detail -->
	<div class="modal fade" id="MemberEdit">
		<div class="modal-dialog">
			<div class="modal-content modal-custom">
				<div class="modal-header">
					<button type="button" class="close" aria-hidden="true">	&times;</button>
					<h4 class="modal-title">Member Edit</h4>
				</div>
				<div class="modal-body">
					<form id="memberForm" class="modal-form-custom">
						<dl class="dl-horizontal">
							<dt>Tel #</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_ID" type="hidden" />
								<input class="form-control modal-custom-input" id="EDIT_MEBR_TEL_NO" name="EDIT_MEBR_TEL_NO" type="text" required />
							</dd>
							<dt>Customer Id</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_CUST_ID" name="EDIT_MEBR_CUST_ID" type="text" required />
							</dd>
							<dt>Member Id</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_CUSTOMER_MEMBER_NO" name="EDIT_MEBR_CUSTOMER_MEMBER_NO" type="text" required />
							</dd>
							<dt>Email Address</dt>
							<dd>
								<input class="form-control modal-custom-input"	id="EDIT_MEBR_EMAIL_ADDRESS" name="EDIT_MEBR_EMAIL_ADDRESS" type="text" required />
							</dd>
							<dt>First Name</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_FIRST_NAME" name="EDIT_MEBR_FIRST_NAME"	type="text" required />
							</dd>
							<dt>Last Name</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_LAST_NAME" name="EDIT_MEBR_LAST_NAME" type="text" required />
							</dd>
							<dt>Birth Date</dt>
							<dd>
                        			<div id="EDIT_MEBR_DATE_OF_BIRTH_DATA" class="form-control modal-custom-input" ></div>
                            		<input class="form-control" id="EDIT_MEBR_DATE_OF_BIRTH" name="EDIT_MEBR_DATE_OF_BIRTH" type="hidden" />  
							</dd>
							<dt>Zip Code</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_ZIP_CODE" name="EDIT_MEBR_ZIP_CODE" type="text" required />
							</dd>
							<dt>Address1</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_ADDRESS1" name="EDIT_MEBR_ADDRESS1" type="text"  />
							</dd>
							<dt>Address2</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_ADDRESS2" name="EDIT_MEBR_ADDRESS2" type="text"  />
							</dd>
							<dt>Address3</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_ADDRESS3" name="EDIT_MEBR_ADDRESS3" type="text"  />
							</dd>
							<dt>Points</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_POINT" name="EDIT_MEBR_POINT" type="text" required />
							</dd>
							<dt>Field1</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_FIELD1" name="EDIT_MEBR_FIELD1" type="text"  />
							</dd>
							<dt>Field2</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_FIELD2" name="EDIT_MEBR_FIELD2" type="text"  />
							</dd>
							<dt>Field3</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_FIELD3" name="EDIT_MEBR_FIELD3" type="text"  />
							</dd>
							<dt>Field4</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_FIELD4" name="EDIT_MEBR_FIELD4" type="text"  />
							</dd>
							<dt>Field5</dt>
							<dd>
								<input class="form-control modal-custom-input" id="EDIT_MEBR_FIELD5" name="EDIT_MEBR_FIELD5" type="text"  />
							</dd>						
						</dl>
					</form>
				</div>
				<div class="modal-footer modal-footer-custom">
					<button type="button" class="btn btn-primary btn-form-custom btn-form-custom-2"	id="cmdChargeEditOk" onclick="cmdCustomerMemberEditOk_OnClick()">Ok</button>
					<button type="button" class="btn btn-danger btn-form-custom btn-form-custom-2"	id="cmdChargeEditCancel" onclick="cmdCustomerMemberEditCancel_OnClick()">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var customerMembers;
	var customerMemberGrid;

	var customerMembersDate;

	var btnFirstPageGrid;
	var btnPreviousPageGrid;
	var btnNextPageGrid;
	var btnLastPageGrid;
	var btnCurrentPageGrid;
	
	// ===================
	// Edit Button Clicked
	// ===================
	function cmdCustomerMemberEdit_OnClick() {
		customerMembers.editItem(customerMembers.currentItem);

	    $('#MemberEdit').modal({
	        show: true,
	        backdrop: false
	    });

	    var customerMember = customerMembers.currentEditItem;
	    
	    document.getElementById('EDIT_MEBR_ID').value = customerMember.MEBR_ID !== null && typeof (customerMember.MEBR_ID) != 'undefined' ? wijmo.Globalize.format(customerMember.MEBR_ID) : '';
	    document.getElementById('EDIT_MEBR_TEL_NO').value = customerMember.MEBR_TEL_NO ? customerMember.MEBR_TEL_NO : '';
	    document.getElementById('EDIT_MEBR_CUST_ID').value = customerMember.MEBR_CUST_ID ? customerMember.MEBR_CUST_ID : '';
	    document.getElementById('EDIT_MEBR_CUSTOMER_MEMBER_NO').value = customerMember.MEBR_CUSTOMER_MEMBER_NO ? customerMember.MEBR_CUSTOMER_MEMBER_NO : '';
	    document.getElementById('EDIT_MEBR_EMAIL_ADDRESS').value = customerMember.MEBR_EMAIL_ADDRESS ? customerMember.MEBR_EMAIL_ADDRESS : '';
	    document.getElementById('EDIT_MEBR_FIRST_NAME').value = customerMember.MEBR_FIRST_NAME ? customerMember.MEBR_FIRST_NAME : '';
	    document.getElementById('EDIT_MEBR_LAST_NAME').value = customerMember.MEBR_LAST_NAME ? customerMember.MEBR_LAST_NAME : '';
		document.getElementById('EDIT_MEBR_DATE_OF_BIRTH').value = customerMember.MEBR_DATE_OF_BIRTH ? customerMember.MEBR_DATE_OF_BIRTH : '';
		document.getElementById('EDIT_MEBR_ADDRESS1').value = customerMember.MEBR_ADDRESS1 ? customerMember.MEBR_ADDRESS1 : '';
		document.getElementById('EDIT_MEBR_ADDRESS2').value = customerMember.MEBR_ADDRESS2 ? customerMember.MEBR_ADDRESS2 : '';
		document.getElementById('EDIT_MEBR_ADDRESS3').value = customerMember.MEBR_ADDRESS3 ? customerMember.MEBR_ADDRESS3 : '';
		document.getElementById('EDIT_MEBR_POINT').value = customerMember.MEBR_POINT ? customerMember.MEBR_POINT : '';
		document.getElementById('EDIT_MEBR_FIELD1').value = customerMember.MEBR_FIELD1 ? customerMember.MEBR_FIELD1 : '';
		document.getElementById('EDIT_MEBR_FIELD2').value = customerMember.MEBR_FIELD2 ? customerMember.MEBR_FIELD2 : '';
		document.getElementById('EDIT_MEBR_FIELD3').value = customerMember.MEBR_FIELD3 ? customerMember.MEBR_FIELD3 : '';
		document.getElementById('EDIT_MEBR_FIELD4').value = customerMember.MEBR_FIELD4 ? customerMember.MEBR_FIELD4 : '';
		document.getElementById('EDIT_MEBR_FIELD5').value = customerMember.MEBR_FIELD5 ? customerMember.MEBR_FIELD5 : '';
	
	    var splitDate = customerMembers.MEBR_DATE_OF_BIRTH.split("-");

	    customerMembersDate.dispose();
	    customerMembersDate = new wijmo.input.InputDate('#EDIT_MEBR_DATE_OF_BIRTH_DATA', {
	        format: 'MM/dd/yyyy',
	        value: new Date(splitDate[0], splitDate[1] - 1, splitDate[2]),
	        onValueChanged: function () {
	            document.getElementById('EDIT_MEBR_DATE_OF_BIRTH').value = this.value.toString("yyyy-MM-dd");
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

		if (confirm("Delete " + memberName + "?") == true) {
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
	}
		
	// =============================
	// Edit Detail OK Button Clicked
	// =============================     
	function cmdCustomerMemberEditOk_OnClick() {
		var customerMemberObject = new Object();

		customerMemberObject.MEBR_ID = parseInt(document.getElementById('EDIT_MEBR_ID').value);
		customerMemberObject.MEBR_TEL_NO = document.getElementById('EDIT_MEBR_TEL_NO').value;
		customerMemberObject.MEBR_CUST_ID =  parseInt(document.getElementById('EDIT_MEBR_CUST_ID').value);
		customerMemberObject.MEBR_CUSTOMER_MEMBER_NO =  document.getElementById('EDIT_MEBR_CUSTOMER_MEMBER_NO').value;
		customerMemberObject.MEBR_EMAIL_ADDRESS = document.getElementById('EDIT_MEBR_EMAIL_ADDRESS').value;
		customerMemberObject.MEBR_FIRST_NAME = document.getElementById('EDIT_MEBR_FIRST_NAME').value;
		customerMemberObject.MEBR_LAST_NAME = document.getElementById('EDIT_MEBR_LAST_NAME').value;
		customerMemberObject.MEBR_ADDRESS1 = document.getElementById('EDIT_MEBR_ADDRESS1').value;
		customerMemberObject.MEBR_ADDRESS2 = document.getElementById('EDIT_MEBR_ADDRESS2').value;
		customerMemberObject.MEBR_ADDRESS3 = document.getElementById('EDIT_MEBR_ADDRESS3').value;
		customerMemberObject.MEBR_POINT = document.getElementById('EDIT_MEBR_POINT').value;
		customerMemberObject.MEBR_FIELD1 = document.getElementById('EDIT_MEBR_FIELD1').value;
		customerMemberObject.MEBR_FIELD2 = document.getElementById('EDIT_MEBR_FIELD2').value;
		customerMemberObject.MEBR_FIELD3 = document.getElementById('EDIT_MEBR_FIELD3').value;
		customerMemberObject.MEBR_FIELD4 = document.getElementById('EDIT_MEBR_FIELD4').value;
		customerMemberObject.MEBR_FIELD5 = document.getElementById('EDIT_MEBR_FIELD5').value;


		var splitDate = document.getElementById('EDIT_MEBR_DATE_OF_BIRTH').value.split("-");

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
	//=================
	//Get Customer Data
	//=================   
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
									EditId : "<button class='btn btn-primary btn-xs btn-form-custom' data-toggle='modal' id='cmdEditCustomer' onclick='cmdCustomerMemberEdit_OnClick()'>Edit</button>",
									DeleteId : "<button class='btn btn-danger btn-xs btn-form-custom' data-toggle='modal' id='cmdDeleteCustomer' onclick='cmdCustomerMemberDelete_OnClick()'>Delete</button>",
									MEBR_ID : Results[i]["mebr_ID"],
									MEBR_CUST_ID : Results[i]["mebr_CUST_ID"],
									MEBR_TEL_NO : Results[i]["mebr_TEL_NO"], 
									MEBR_CUSTOMER_MEMBER_NO : Results[i]["mebr_CUSTOMER_MEMBER_NO"],
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
									
			                        CREATED_DATE: Results[i]["CREATED_DATE"],
			                        CREATED_BY_USER_ID: Results[i]["CREATED_BY_USER_ID"],
			                        UPDATED_DATE: Results[i]["UPDATED_DATE"],
			                        UPDATED_BY_USER_ID: Results[i]["UPDATED_BY_USER_ID"],
			                        ISDELETED: Results[i]["ISDELETED"],
			                        ISDELETED_DATE: Results[i]["ISDELETED_DATE"],
			                        ISDELETED_BY_USER_ID: Results[i]["ISDELETED_BY_USER_ID"]
									
								});
							}
					
						} else {
							alert("No data.");
						}
					}
				}).fail(function(xhr, textStatus, err) {
			alert(err);
		});
		return customerMembers;
	}

	$(document).ready(function() {

						// Validation
						$('#CmdCustomerMemberEditOk').click(function() {
							if (FormValidate() == true) {
								cmdCustomerEditOkFunction();
								$('#CustomerMemberEdit').modal('hide');
							} else {
								toastr.error("Fill the required field!");
							}
						});

						$('#CmdCustomerMemberEditCancel, .close').click(
								function() {
									$("form input").removeClass("errorHighlight");
									$('form')[0].reset();
									$('#CustomerEdit').modal('hide');
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
							return !filterText || (item.MEBR_ID.toLowerCase().indexOf(filterText) > -1);
						}
					   /*  customerMembers.collectionChanged.addHandler(function (sender, args) {
						 updateNavigateButtonsCustomer();
						 });  */

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
										"header" : "Tel #",
										"binding" : "MEBR_TEL_NO",
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
										"header" : "Code",
										"binding" : "MEBR_ID",
										"allowSorting" : true,
										"width" : "2*"
									}, 
									{
										"header" : "Name",
										"binding" : "MEBR_CUST_ID",
										"allowSorting" : true,
										"width" : "2*"
									},
									{
										"header" : "Phone No",
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
						
						customerGrid.trackChanges = true;

						// Navigation button
						btnFirstPageGrid = document.getElementById('btnMoveToFirstPageGrid');
						btnPreviousPageGrid = document.getElementById('btnMoveToPreviousPageGrid');
						btnNextPageGrid = document.getElementById('btnMoveToNextPageGrid');
						btnLastPageGrid = document.getElementById('btnMoveToLastPageGrid');
						btnCurrentPageGrid = document.getElementById('btnCurrentPageGrid');

						updateNavigateButtonsCustomer();

						btnFirstPageGrid.addEventListener('click', function() {
							customers.moveToFirstPage();
							updateNavigateButtonsCustomer();
						});
						btnPreviousPageGrid.addEventListener('click',
								function() {
									customers.moveToPreviousPage();
									updateNavigateButtonsCustomer();
								});
						btnNextPageGrid.addEventListener('click', function() {
							customers.moveToNextPage();
							updateNavigateButtonsCustomer();
						});
						btnLastPageGrid.addEventListener('click', function() {
							customers.moveToLastPage();
							updateNavigateButtonsCustomer();
						});

						// Scroll settings
						$('.scroll').slimscroll({
							height : '450px'
						});
					});
</script>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>