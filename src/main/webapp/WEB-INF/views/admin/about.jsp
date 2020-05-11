
 <%@include file="shared/admin-header.jsp" %>	
 
    <!-- tables -->
    <section>
      <div class="container-fluid">
        <div class="row mt-5">
          <div class="col-xl-10 col-lg-12 col-md-8 ml-auto">
            <div class="row align-items-center">
              <div class="col-xl-12 col-12 mb-4 mb-xl-0">
                
                	    <c:choose>
							<c:when test="${cat == 'RECRUITMENT'}">
								 <h3 class="text-muted text-center mb-2">Recruitment, Selection and Placement (RSP)</h3>
							</c:when>
							<c:when test="${cat == 'DEVELOPMENT'}">
								 <h3 class="text-muted text-center mb-2">Learning and Development (L&D)</h3>
							</c:when>
							<c:when test="${cat == 'PERFORMANCE'}">
								 <h3 class="text-muted text-center mb-2">Performance Management (PM)</h3>
							</c:when>
							<c:when test="${cat == 'RECOGNITION'}">
								 <h3 class="text-muted text-center mb-2">Rewards and Recognition (R&R)</h3>
							</c:when>
							<c:when test="${cat == 'OTHERS'}">
								 <h3 class="text-muted text-center mb-2">Other Documentary Evidence</h3>
							</c:when>
							<c:when test="${cat == 'FORMS'}">
								 <h3 class="text-muted text-center mb-2">Forms</h3>
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
								 <h4 class="text-muted text-center mb-3">Talent Planning Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECRUITMENT_SOURCING'}">
								 <h4 class="text-muted text-center mb-3">Talent Sourcing Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECRUITMENT_SELECTING'}">
								 <h4 class="text-muted text-center mb-3">Talent Selection and Placement Pillar</h4>
							</c:when>
							
							
							<c:when test="${subcat == 'DEVELOPMENT_GOVERNANCE'}">
								 <h4 class="text-muted text-center mb-3">Governance Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'DEVELOPMENT_PLANNING'}">
								 <h4 class="text-muted text-center mb-3">Planning and M&E Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'DEVELOPMENT_EXECUTION'}">
								 <h4 class="text-muted text-center mb-3">Execution Pillar</h4>
							</c:when>

							<c:when test="${subcat == 'PERFORMANCE_GOVERNANCE'}">
								 <h4 class="text-muted text-center mb-3">Governance Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'PERFORMANCE_PLANNING'}">
								 <h4 class="text-muted text-center mb-3">Performance Planning and Commitment Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'PERFORMANCE_REVIEW'}">
								 <h4 class="text-muted text-center mb-3">Performance Review and Evaluation Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'PERFORMANCE_DEVELOPMENT'}">
								 <h4 class="text-muted text-center mb-3">Development Planning Pillar</h4>
							</c:when>
													
							<c:when test="${subcat == 'RECOGNITION_GOVERNANCE'}">
								 <h4 class="text-muted text-center mb-3">Governance Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECOGNITION_PLANNING'}">
								 <h4 class="text-muted text-center mb-3">Planning Pillar</h4>
							</c:when>
							<c:when test="${subcat == 'RECOGNITION_IMPLEMENTATION'}">
								 <h4 class="text-muted text-center mb-3">Implementation Pillar</h4>
							</c:when>							
														

						</c:choose>	
	
                
                <a href="${contextRoot}/admin/newpost?cat=${cat}&subcat=${subcat}" class="btn btn-success btn-sm m-3">NEW</a>
                <table class="table table-striped bg-light text-center">
                  <thead>
                    <tr class="text-muted">
                      <th>Title</th>                     
					  <th></th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach items="${posts}" var="post">
                    <tr>      
                      <td>${post.title}</td>            
					  <td><a href="${contextRoot}/admin/edit-post-${post.id}" class="btn btn-info btn-sm">EDIT</a></td>
                      <td><a href="${contextRoot}/admin/delete-post-${post.id}" class="btn btn-danger btn-sm">DELETE</a></td>
                    </tr>
                   </c:forEach>
                  </tbody>
                </table>
                
              </div>
             
                <!-- end of pagination -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end of tables -->


 <%@include file="shared/admin-footer.jsp" %>	



