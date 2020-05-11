
<%@include file="shared/header.jsp" %>	



<!--  -->
<section id="about" class="py-5 text-center bg-light">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="info-header mb-5">
					<h1 class="text-primary pb-2">PRIME-HRM</h1>
	
				</div>

     <c:if test="${cat == 'RECRUITMENT'}">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">
									<div href="#collapseRECRUITMENT" data-toggle="collapse" data-parent="#accordion">
									<i class="fas fa-arrow-circle-down" ></i> 
									Recruitment, Selection and Placement (RSP)
								</div>
							</h5>
						</div>
						<div id="collapseRECRUITMENT" class="collapse <c:if test="${cat == 'RECRUITMENT'}"> show</c:if>">
							<div class="card-body">		
									<div id="accordion">
									
									
										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseRECRUITMENT_GOVERNANCE" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Governance Pillar
													</div>
												</h5>
											</div>
											<div id="collapseRECRUITMENT_GOVERNANCE" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																
														<c:forEach items="${listRECRUITMENT_GOVERNANCE}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																		
																		
																		${post.content}
																		
																		
																		</div>
																	</div>
																</div>
														</c:forEach>									
													</div>
												</div>
											</div>
										</div>
					
										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseRECRUITMENT_PLANNING" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Talent Planning Pillar
													</div>
												</h5>
											</div>
											<div id="collapseRECRUITMENT_PLANNING" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">
														<c:forEach items="${listRECRUITMENT_PLANNING}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																		
																		
																		${post.content}
																		
																		
																		</div>
																	</div>
																</div>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>

										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseRECRUITMENT_SOURCING" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Talent Sourcing Pillar
													</div>
												</h5>
											</div>
											<div id="collapseRECRUITMENT_SOURCING" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																																
															<c:forEach items="${listRECRUITMENT_SOURCING}" var="post" varStatus="loop">
																	<div class="card">
																		<div class="card-header">
																			<h5 class="mb-0">
																				<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																					<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																				</div>
																			</h5>
																		</div>
																		<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																			
																			${post.content}
																			
																			
																			</div>
																		</div>
																	</div>
															</c:forEach>
														</div>
												</div>
											</div>
										</div>

										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseRECRUITMENT_SELECTING" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Talent Selection and Placement Pillar
													</div>
												</h5>
											</div>
											<div id="collapseRECRUITMENT_SELECTING" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																						
															<c:forEach items="${listRECRUITMENT_SELECTING}" var="post" varStatus="loop">
																	<div class="card">
																		<div class="card-header">
																			<h5 class="mb-0">
																				<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																					<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																				</div>
																			</h5>
																		</div>
																		<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>
																												
																			${post.content}
																			
																			</div>
																		</div>
																	</div>
															</c:forEach>
														</div>
												</div>
											</div>
										</div>																			
									</div>
							</div>
						</div>
					</div>
				
	</c:if>
	<c:if test="${cat == 'DEVELOPMENT'}">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">
									<div href="#collapseDEVELOPMENT" data-toggle="collapse" data-parent="#accordion">
									<i class="fas fa-arrow-circle-down"></i> 
									Learning and Development
								</div>
							</h5>
						</div>
						<div id="collapseDEVELOPMENT" class="collapse <c:if test="${cat == 'DEVELOPMENT'}"> show</c:if>">
							<div class="card-body">		
									<div id="accordion">
																	
										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseDEVELOPMENT_GOVERNANCE" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Governance Pillar
													</div>
												</h5>
											</div>
											<div id="collapseDEVELOPMENT_GOVERNANCE" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																							
														<c:forEach items="${listDEVELOPMENT_GOVERNANCE}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																		
																		${post.content}
																		
																		
																		
																		</div>
																	</div>
																</div>										
														</c:forEach>
													</div>
												</div>
											</div>
										</div>										
										

										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseDEVELOPMENT_PLANNING" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Planning and M&E Pillar
													</div>
												</h5>
											</div>
											<div id="collapseDEVELOPMENT_PLANNING" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">										
														<c:forEach items="${listDEVELOPMENT_PLANNING}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>
																											
																		${post.content}
																		
																		</div>
																	</div>
																</div>										
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										
	
											<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseDEVELOPMENT_EXECUTION" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Execution Pillar
													</div>
												</h5>
											</div>
											<div id="collapseDEVELOPMENT_EXECUTION" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																					
														<c:forEach items="${listDEVELOPMENT_EXECUTION}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																		
																		${post.content}
																		
																		</div>
																	</div>
																</div>									
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										
								</div>
							</div>
						</div>
					</div>
					
	</c:if>	
	<c:if test="${cat == 'PERFORMANCE'}">			
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">
									<div href="#collapsePERFORMANCE" data-toggle="collapse" data-parent="#accordion">
									<i class="fas fa-arrow-circle-down"></i> 
									Performance Management
								</div>
							</h5>
						</div>
						<div id="collapsePERFORMANCE" class="collapse <c:if test="${cat == 'PERFORMANCE'}"> show</c:if>">
							<div class="card-body">		
									<div id="accordion">
									
										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapsePERFORMANCE_GOVERNANCE" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Governance Pillar
													</div>
												</h5>
											</div>
											<div id="collapsePERFORMANCE_GOVERNANCE" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">													
														<c:forEach items="${listPERFORMANCE_GOVERNANCE}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
	
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																	
																		${post.content}
																		
																		</div>
																	</div>
																</div>										
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										
										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapsePERFORMANCE_PLANNING" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Performance Planning and Commitment Pillar
													</div>
												</h5>
											</div>
											<div id="collapsePERFORMANCE_PLANNING" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																				
														<c:forEach items="${listPERFORMANCE_PLANNING}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>
																										
																		
																		${post.content}
																		
																		
																		</div>
																	</div>
																</div>
											
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										
										
										<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapsePERFORMANCE_REVIEW" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Performance Review and Evaluation Pillar
													</div>
												</h5>
											</div>
											<div id="collapsePERFORMANCE_REVIEW" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">									
														<c:forEach items="${listPERFORMANCE_REVIEW}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																	
																		
																		${post.content}
																		
																		</div>
																	</div>
																</div>
											
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
										
											<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapsePERFORMANCE_DEVELOPMENT" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Development Planning Pillar
													</div>
												</h5>
											</div>
											<div id="collapsePERFORMANCE_DEVELOPMENT" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																			
															<c:forEach items="${listPERFORMANCE_DEVELOPMENT}" var="post" varStatus="loop">
																	<div class="card">
																		<div class="card-header">
																			<h5 class="mb-0">
																				<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																					<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																				</div>
																			</h5>
																		</div>
																		<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																		
																			
																			
																			
																			${post.content}
																			
																			
																			</div>
																		</div>
																	</div>
												
															</c:forEach>	
													</div>
												</div>
											</div>
										</div>
																			
										
									</div>
							</div>
						</div>
					</div>
	</c:if>				
	<c:if test="${cat == 'RECOGNITION'}">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">
									<div href="#collapseRECOGNITION" data-toggle="collapse" data-parent="#accordion">
									<i class="fas fa-arrow-circle-down"></i> 
									Rewards and Recognition
								</div>
							</h5>
						</div>
						<div id="collapseRECOGNITION" class="collapse <c:if test="${cat == 'RECOGNITION'}"> show</c:if>">
							<div class="card-body">		
									<div id="accordion">
									
									
											<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseRECOGNITION_GOVERNANCE" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Governance Pillar
													</div>
												</h5>
											</div>
											<div id="collapseRECOGNITION_GOVERNANCE" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">										
															<c:forEach items="${listRECOGNITION_GOVERNANCE}" var="post" varStatus="loop">
																	<div class="card">
																		<div class="card-header">
																			<h5 class="mb-0">
																				<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																					<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																				</div>
																			</h5>
																		</div>
																		<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>
																											
																			${post.content}
																			
																			
																			</div>
																		</div>
																	</div>
															</c:forEach>
														</div>
												</div>
											</div>
										</div>
																			
											<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseRECOGNITION_PLANNING" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Planning Pillar
													</div>
												</h5>
											</div>
											<div id="collapseRECOGNITION_PLANNING" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">														
															<c:forEach items="${listRECOGNITION_PLANNING}" var="post" varStatus="loop">
																	<div class="card">
																		<div class="card-header">
																			<h5 class="mb-0">
																				<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																					<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																				</div>
																			</h5>
																		</div>
																		<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																			
																			
																			${post.content}
																			
																			</div>
																		</div>
																	</div>
												
															</c:forEach>
													</div>
												</div>
											</div>
										</div>
										
	
											<div class="card">
											<div class="card-header">
												<h5 class="mb-0">
														<div href="#collapseRECOGNITION_IMPLEMENTATION" data-toggle="collapse" data-parent="#accordion">
														<i class="fas fa-arrow-circle-down" style="color: #073f88b2;"></i> 
														Implementation Pillar
													</div>
												</h5>
											</div>
											<div id="collapseRECOGNITION_IMPLEMENTATION" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
												<div class="card-body">		
													<div id="accordion">																															
														<c:forEach items="${listRECOGNITION_IMPLEMENTATION}" var="post" varStatus="loop">
																<div class="card">
																	<div class="card-header">
																		<h5 class="mb-0">
																			<div href="#collapse1${post.id}" data-toggle="collapse" data-parent="#accordion">
																				<i class="fas fa-arrow-circle-down" style="color: #3292a6;"></i> ${post.title }
																			</div>
																		</h5>
																	</div>
																	<div id="collapse1${post.id}" class="collapse <c:if test="${loop.count == 1}"> show</c:if>">
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
											<div class="col">
												<div class=" text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.url }</a>
														</h6>
													
													</div>
												</div>
											</div>										
										</c:if>
									</div>																		
																		
																		${post.content}
																		
																		
																		</div>
																	</div>
																</div>
											
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
						</div>
					</div>			
				
	</c:if>



			</div>
		</div>
	</div>

</section>

<%@include file="shared/footer.jsp" %>