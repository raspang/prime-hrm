
<%@include file="shared/header.jsp"%>

<!-- CONTACT -->
<section id="contact" class="bg-light py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-8 m-auto">
				<h1 class="display-4 text-center">Log In</h1>
				<form action="${contextRoot}/login" method="post">
					<c:if test="${param.error != null}">
						<div class="alert alert-danger">
							<p>Invalid username and password.</p>
						</div>
					</c:if>
					<c:if test="${param.logout != null}">
						<div class="alert alert-success">
							<p>You have been logged out successfully.</p>
						</div>
					</c:if>
					<div class="form-group">
						<input type="text" class="form-control form-control-lg"
							placeholder="Username" name="ssoId" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control form-control-lg"
							placeholder="Password" name="password" />
					</div>

					<div class="input-group input-sm">
						<div class="checkbox">
							<label><input type="checkbox" id="rememberme"
								name="remember-me"> Remember Me</label>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
						<input type="submit"
						class="btn btn-info btn-block mt-4" />
				</form>
			</div>
		</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
		<div class="row">&nbsp;</div>
	</div>
</section>


<%@include file="shared/footer.jsp"%>