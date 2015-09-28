<!-- Header -->
<%@include file="include_secure_header.jsp"%>
<br /><br /><br /><br />
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="login-panel panel panel-body-border">
				<!-- <div class="panel-heading">
					<h3 class="panel-title "><i class="fa fa-exclamation-triangle"></i> Sorry</h3>
				</div> -->
				<div class="panel-body">
					 <img class="img-responsive" src="<c:url value='/img/403_Error.png'/>" alt="">
				</div>
				<div class="panel-footer" align="center">
					<a href="${pageContext.request.contextPath}/software/" class="btn btn-primary btn-lg border-custom"><i class="fa fa-arrow-left"></i> Back</a>
				</div>
			</div>	
		</div>
		<div class="col-md-2"></div>
	</div>
	
<!-- footer -->
<%@include file="include_secure_footer.jsp"%>>
