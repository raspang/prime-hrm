
<%@include file="shared/admin-header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>




<section>
	<div class="container">
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">

				<p class="lead text-center m-5">FORM</p>

				<form:form method="POST" modelAttribute="post"
					class="form-horizontal">
					<form:input type="hidden" path="id" />
					<form:input type="hidden" path="category" value="${cat}" />
					<form:input type="hidden" path="subCategory" value="${subcat}" />
					<div class="form-group">
						<form:input type="text" class="form-control form-control-lg"
							placeholder="Title" path="title" required="required" />
						<form:errors path="title" class="help-inline" />
					</div>
					<div class="form-group">
						<form:input type="url" class="form-control form-control-lg"
							placeholder="URL Link file (i.e Google Drive)" path="url" />
						<form:errors path="url" class="help-inline" />
					</div>
					<div class="form-group">
						<form:textarea class="form-control form-control-lg" path="content" />
					</div>

					<div class="form-group border border-white p-2">
						
							<form:radiobutton
									 path="enable" value="true" />Enable Public
							<form:radiobutton
									 path="enable" value="false" />User Account required
						
						</div>
				

					<c:choose>
						<c:when test="${edit}">
							<a href="${contextRoot}/admin/add-document-${post.id}">Click
								here to upload/manage your documents</a>
							<input type="submit" value="Update"
								class="btn btn-info btn-block mt-4" />
							<a class="btn btn-warning btn-block mt-4"
								href="${contextRoot}/admin/about">Cancel</a>

						</c:when>
						<c:otherwise>
							<input type="submit" value="Add"
								class="btn btn-info btn-block mt-4" />
							<a class="btn btn-warning btn-block mt-4"
								href="${contextRoot}/admin/about">Cancel</a>
						</c:otherwise>
					</c:choose>


				</form:form>
			</div>
		</div>
	</div>

</section>
<!-- end of tables -->


<%@include file="shared/admin-footer.jsp"%>



