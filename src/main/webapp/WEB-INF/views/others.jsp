
<%@include file="shared/header.jsp"%>


<
<!-- BOXES -->
<section id="boxes" class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class=" text-center  mb-resp">
					<div class="card-body">
						<h3 class="text-primary">Other Documentary Evidence</h3>
						<c:forEach items="${listOthers}" var="post">



							<div class="border border-primary m-2">

								<p class="text-muted m-2">${post.title}</p>

								<div class="row justify-content-center">
										<c:forEach items="${post.postDocuments}" var="doc" varStatus="status">											
												<div class=" text-center  ">
													<div class="card-body">													
													<c:choose>
														<c:when test="${doc.type =='image/jpeg' or doc.type =='image/jpg' or doc.type =='image/png' or doc.type =='image/gif'}">	
														
															<div aria-hidden="true" aria-labelledby="myModalLabel" class="modal fade" id="modalIMG${doc.id}" role="dialog" tabindex="-1">
																<div class="modal-dialog modal-lg" role="document">
																	<div class="modal-content">
																		<div class="modal-body mb-0 p-0">
																			
																			<img src="${contextRoot}/imageDisplay?id=${doc.id}"  alt="" style="width:100%"/>	
																		</div>
																		<div class="modal-footer">
																			<div><a href="${contextRoot}/imageDisplay?id=${doc.id}" target="_blank">Download</a></div>
																			<button class="btn btn-outline-primary btn-rounded btn-md ml-4 text-center" data-dismiss="modal" type="button">Close</button>
																		</div>
																	</div>
																</div>
															</div>
			
															<a  data-target="#modalIMG${doc.id}" data-toggle="modal" href="#">${doc.name}</a>			
																
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
										
												<div class="  text-center m-resp ">
													<div class="card-body">
														<h6 class="text-primary">
															<a href="${post.url}" target="_blank">${post.title }</a>
														</h6>
													
													</div>
												</div>
																		
										</c:if>
								</div>

								
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>

<%@include file="shared/footer.jsp"%>
