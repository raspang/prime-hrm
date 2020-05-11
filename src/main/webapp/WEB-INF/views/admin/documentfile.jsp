
<%@include file="shared/admin-header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- tables -->
<section>
	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-xl-10 col-lg-12 col-md-8 ml-auto">
				<div class="row align-items-center">
					<div class="col-xl-12 col-12 mb-4 mb-xl-0">

						<c:choose>
							<c:when test="${cat == 'RECRUITMENT'}">
								<h3 class="text-muted text-center mb-2">Recruitment,
									Selection and Placement (RSP)</h3>
							</c:when>
							<c:when test="${cat == 'DEVELOPMENT'}">
								<h3 class="text-muted text-center mb-2">Learning and
									Development (L&D)</h3>
							</c:when>
							<c:when test="${cat == 'PERFORMANCE'}">
								<h3 class="text-muted text-center mb-2">Performance
									Management (PM)</h3>
							</c:when>
							<c:when test="${cat == 'RECOGNITION'}">
								<h3 class="text-muted text-center mb-2">Rewards and
									Recognition (R&R)</h3>
							</c:when>
							<c:when test="${cat == 'OTHERS'}">
								<h3 class="text-muted text-center mb-2">Other Documentary
									Evidence</h3>
							</c:when>
							<c:otherwise>
								<h3 class="text-muted text-center mb-2">LANDING ABOUT US</h3>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${subcat == 'RECRUITMENT_GOVERNANCE'}">
								<h4 class="text-muted text-center mb-3">Governance Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECRUITMENT_PLANNING'}">
								<h4 class="text-muted text-center mb-3">Talent Planning
									Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECRUITMENT_SOURCING'}">
								<h4 class="text-muted text-center mb-3">Talent Sourcing
									Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECRUITMENT_SELECTING'}">
								<h4 class="text-muted text-center mb-3">Talent Selection
									and Placement Pillar</h4>
							</c:when>


							<c:when test="${subcat == 'DEVELOPMENT_GOVERNANCE'}">
								<h4 class="text-muted text-center mb-3">Governance Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'DEVELOPMENT_PLANNING'}">
								<h4 class="text-muted text-center mb-3">Planning and M&E
									Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'DEVELOPMENT_EXECUTION'}">
								<h4 class="text-muted text-center mb-3">Execution Pillar</h4>
							</c:when>

							<c:when test="${subcat == 'PERFORMANCE_GOVERNANCE'}">
								<h4 class="text-muted text-center mb-3">Governance Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'PERFORMANCE_PLANNING'}">
								<h4 class="text-muted text-center mb-3">Performance
									Planning and Commitment Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'PERFORMANCE_REVIEW'}">
								<h4 class="text-muted text-center mb-3">Performance Review
									and Evaluation Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'PERFORMANCE_DEVELOPMENT'}">
								<h4 class="text-muted text-center mb-3">Development
									Planning Pillar</h4>
							</c:when>

							<c:when test="${subcat == 'RECOGNITION_GOVERNANCE'}">
								<h4 class="text-muted text-center mb-3">Governance Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECOGNITION_PLANNING'}">
								<h4 class="text-muted text-center mb-3">Planning Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECOGNITION_IMPLEMENTATION'}">
								<h4 class="text-muted text-center mb-3">Implementation
									Pillar</h4>
							</c:when>
						</c:choose>



					</div>

					<!-- end of pagination -->
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
<!-- end of tables -->

<!-- activities / quick post -->
<section>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
				<div class="row align-items-center mb-5">
					<div class="col-xl-7">
						<h4 class="text-muted mb-4">List of Documents</h4>
						<table class="table table-striped bg-light text-center">
							<thead>
								<tr class="text-muted">
									<th>No.</th>
									<th>File Name</th>
									<th>Type</th>
									<th>Description</th>
									<th width="100"></th>
									<th width="100"></th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${documents}" var="doc" varStatus="counter">
									<tr>
										<td>${counter.index + 1}</td>
										<td>${doc.name}</td>
										<td>${doc.type}</td>
										<td>${doc.description}</td>
										<td><a
											href="<c:url value='/admin/download-document-${post.id}-${doc.id}' />"
											class="btn btn-success custom-width">download</a></td>
										<td><a
											href="<c:url value='/admin/delete-document-${post.id}-${doc.id}' />"
											class="btn btn-danger custom-width">delete</a></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-xl-5 mt-5">
						<div class="card rounded">
							<div class="card-body">
								<h5 class="text-muted text-center mb-4">Upload New Document</h5>

								<form:form method="POST" modelAttribute="fileBucket"
									enctype="multipart/form-data" class="form-horizontal">
									<div class="form-group">
										<form:input type="file" path="file" id="file"
											class="form-control input-sm" />
										<form:errors path="file" class="help-inline" />
									</div>
									<div class="form-group">
										<form:input type="text" path="description" id="description"
											class="form-control input-sm" placeholder="Description" />
									</div>
									<div class="form-group">
										<input type="submit" value="Upload"
											class="btn btn-block text-uppercase font-weight-bold text-light bg-info py-2 mb-5">

									</div>
								</form:form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- end of activities / quick post -->



<%@include file="shared/admin-footer.jsp"%>



