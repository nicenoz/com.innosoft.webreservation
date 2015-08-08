<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Password</title>

<div class="container"> 
<section id="">
	<form action="" role="form">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-4 col-md-offset-4">
	                <div class="login-panel panel panel-body-border">
	                    <div class="panel-heading">
	                        <h3 class="panel-title "><b>Change Password</b></h3>
	                    </div>
	                    <div class="panel-body">
	                        <fieldset>
	                           	<input type="password" name="" class="form-control border-custom" id="" size="30" maxlength="40" placeholder="Current Password"/>
	                            <hr/>
	                            <input type="password" name="" class="form-control border-custom" id="" size="30" maxlength="32" placeholder="New Password"/>
	                            <br />
	                            <input type="password" name="" class="form-control border-custom" id="" size="30" maxlength="32" placeholder="Confirm Password"/>
	                            <br />
	                            <input type="submit" value="Change Password" class="btn btn-lg btn-danger btn-block border-custom" />
	                        </fieldset>
	                        <br>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</form>
</section>
</div>

<!-- footer -->
<%@include file="include_secure_copyright_footer.jsp"%>