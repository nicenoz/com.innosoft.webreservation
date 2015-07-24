<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<title>System - Password</title>

<div class="container"> 
<section id="">
<form method="" action="" role="form">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-custom2">
                    <div class="panel-heading panel-custom3">
                        <h3 class="panel-title ">Change Password</h3>
                    </div>
                    <div class="panel-body">
                        <fieldset>
                           	<input type="password" name="" class="form-control btn-form-custom" id="" size="30" maxlength="40" placeholder="Current Password"/>
                            <br />
                            <hr/>
                            <br />
                            <input type="password" name="" class="form-control btn-form-custom" id="" size="30" maxlength="32" placeholder="New Password"/>
                            <br />
                            <input type="password" name="" class="form-control btn-form-custom" id="" size="30" maxlength="32" placeholder="Confirm Password"/>
                            <br />
                            <br />
                            <input type="submit" value="Change Password" class="btn btn-lg btn-danger btn-block btn-form-custom" />
                        </fieldset>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form></section>
</div>

<!-- footer -->
<%@include file="include_secure_footer.jsp"%>