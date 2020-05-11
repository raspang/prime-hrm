
<%@include file="shared/header.jsp"%>

<section id="showcase" class="py-5">
	<div class="primary-overlay text-white">
		<div class="container">
			<div class="row">


				<sec:authorize access="isAnonymous()">
					<div class="col-lg-6 text-center">
						<h1 class="display-2 mt-5 pt-5">Department of Science and
							Technology</h1>
						<p class="lead">DOST Regional Office No. XII</p>
						<a href="${contextRoot}/login"
							class="btn btn-outline-secondary btn-lg text-white"> <i
							class="fas fa-sign-in-alt"></i><small>Login Staff</small>
						</a>
					</div>
					<div class="col-lg-6">
						<img src="${images}/dost1.jpg" alt=""
							class="pt-5 mt-5 img-fluid d-none d-lg-block">
					</div>
				</sec:authorize>
				<sec:authorize access="hasRole('STAFF') or hasRole('HR')">
				
					<div class="lead mt-4">
					<h4 class="mb-3">Hi, ${loggedinuser}!</h4>
					<ul class="list-group">
					
					
					<c:forEach items="${userDocuments}" var="doc">
						
						<li
							class=" d-flex justify-content-between align-items-center">
							<a href="${contextRoot}/download-user-document-${doc.id}" class="text-white">${doc.name}</a> <span class="badge badge-primary badge-pill">${doc.description}</span>
						</li>

						</c:forEach>
					</ul>
					</div>
				</sec:authorize>
				<sec:authorize access="hasRole('ADMIN')">
				
	
					
					<div class="col-lg-6 text-center">
						<h1 class="display-2 mt-5 pt-5">Department of Science and
							Technology</h1>
						<p class="lead">DOST Regional Office No. XII</p>
							<div class="lead mt-4">
							<h4 class="mb-3">You're logged as Admin.</h4>
							</div>
					</div>
					<div class="col-lg-6">
						<img src="${images}/dost1.jpg" alt=""
							class="pt-5 mt-5 img-fluid d-none d-lg-block">
					</div>
					
					
				</sec:authorize>

			</div>
		</div>
	</div>
</section>


<%@include file="shared/footer.jsp"%>