
<%@include file="shared/header.jsp"%>

<!--  -->
<section id="about" class="py-5 text-center bg-light">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="info-header mb-5">
					<h1 class="text-primary pb-3">About DOST XII</h1>

				</div>

				<div id="accordion">


					<c:forEach items="${posts}" var="post">
						<div class="card">
							<div class="card-header">
								<h5 class="mb-0">
									<div href="#collapse1${post.id}" data-toggle="collapse"
										data-parent="#accordion">
										<i class="fas fa-arrow-circle-down"></i> ${post.title }
									</div>
								</h5>
							</div>
							<div id="collapse1${post.id}"
								class="collapse <c:if test="${selectedId == post.id}"> show</c:if>">
								<div class="card-body">

									<div class="row justify-content-center">
										<c:forEach items="${post.postDocuments}" var="doc" varStatus="status">											
												<div class=" text-center  ">
													<div class="card-body">													
													<c:choose>
														<c:when test="${doc.type =='image/jpeg' or doc.type =='image/jpg' or doc.type =='image/png' or doc.type =='image/gif'}">											
																<img src="${contextRoot}/imageDisplay?id=${doc.id}" class="img-fluid"/>		
														</c:when>
														<c:otherwise>
															<h6 class="text-primary">
																<a href="${contextRoot}/download-document-${post.id}-${doc.id}" target="_blank">${doc.name }</a>
															</h6>
														</c:otherwise>
													</c:choose>
														<p class="text-muted">${doc.description }</p>
													</div>
												</div>
										
										</c:forEach>
										<c:if test="${post.url != null and post.url != ''}">
								
												<div class=" text-center  ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>														
														</h6>												
													</div>
												</div>																	
										</c:if>
									</div>
									
									
									<div
										class="row justify-content-center p-2 bd-highlight border border-light rounded-light m-1">
										${post.content}</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>

			</div>
		</div>
	</div>

</section>

<%@include file="shared/footer.jsp"%>
