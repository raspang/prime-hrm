
 <%@include file="shared/admin-header.jsp" %>	
 
    <!-- cards -->
    <section>
      <div class="container-fluid">
        <div class="row">

          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row pt-md-5 mt-md-3 mb-5">
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-list fa-3x text-primary"></i>
                      <div class="text-right text-secondary">
                        <h5>Total</h5>
                        <h3>${totalUploadedFiles }</h3>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer text-secondary">
                    <i class="fas fa-file-upload mr-3"></i>
                    <span>Uploaded files</span>
                  </div>
                </div>
              </div>
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-list fa-3x text-success"></i>
                      <div class="text-right text-secondary">
                        <h5>Total</h5>
                        <h3>${containingUploaded }</h3>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer text-secondary">
                    <i class="fas fa-file-upload mr-3"></i>
                    <span>Containing Uploaded</span>
                  </div>
                </div>
              </div>
              
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-list fa-3x text-danger"></i>
                      <div class="text-right text-secondary">
                        <h5>Total</h5>
                        <h3>${notUploaded }</h3>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer text-secondary">
                    <i class="fas  fa-file-upload mr-3"></i>
                    <span>Not Uploaded</span>
                  </div>
                </div>
              </div>
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-list fa-3x text-warning "></i>
                      <div class="text-right text-secondary">
                        <h5>Total</h5>
                        <h3>${noCreated }</h3>
                      </div>
                    </div>
                  </div>
                  <div class="card-footer text-secondary">
                    <i class="fas  fa-file-upload mr-3"></i>
                    <span>Created</span>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end of cards -->

    



 <%@include file="shared/admin-footer.jsp" %>	



